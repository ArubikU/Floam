package dev.arubiku.floamy3d.pipeline.jem;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Hot-reloadable DSL ({@code parsers/**.jp}) — the per-part AND per-box model→shader transform,
 * tunable without recompiling the jar ({@code /floamy3d build} reloads).
 *
 * <p>Match key is {@code "<armorId>:<partName>"} so rules can scope to a whole armor, a part, or
 * both: {@code match *:*shoe*} (all feet), {@code match licorn_fenrir:*} (one armor),
 * {@code match licorn_fenrir:*shoe*} (one armor's feet). Files: {@code parsers/_*.jp} shared,
 * {@code parsers/armor/*.jp} armor, {@code parsers/cosmetic/*.jp} cosmetics.
 *
 * <pre>
 *   var NAME &lt;expr&gt;                  # global constant -> $NAME in any expr
 *   match &lt;glob&gt; ...                 # start a rule (globs over "armor:part"); none = all
 *   # --- part scope (the frame) ---
 *   translate &lt;x&gt; &lt;y&gt; &lt;z&gt; | set t.x|t.y|t.z &lt;e&gt; | mul t.x|t.y|t.z &lt;e&gt;
 *   rotate x|y|z &lt;e&gt; | invert x|y|z [on|off] | mirror [on|off]
 *   base PIX|none | scale &lt;e&gt; | sizeadd &lt;e&gt; | bone NAME
 *   # --- box scope (per cube; learned rule: a box "seats" at posZ = -sizeY) ---
 *   cube &lt;idx|*&gt;                     # select which cube(s) the following box ops target
 *   seat                            # bz.z = -sz.y   (sit the box on the bone by its height)
 *   bset bz.x|bz.y|bz.z &lt;e&gt;          # assign a box-position axis
 *   btranslate &lt;x&gt; &lt;y&gt; &lt;z&gt;          # box position += (x,y,z)
 * </pre>
 * Expr tokens: {@code t.x t.y t.z} (frame), {@code sz.x sz.y sz.z} (box half-size), {@code bz.x bz.y bz.z}
 * (box pos), {@code idx} (cube index), {@code $VAR}, numbers, {@code + - * / ( )}.
 */
public final class JpEngine {

    public static final class PartCtx {
        public double[] t = {0, 0, 0};
        public double[] rot = {0, 0, 0};
        public double[] sceneRot = {0, 0, 0};   // rotate the whole part's box POSITIONS around its pivot
        public double[] sceneT = {0, 0, 0};     // translate the whole scene (post-rotation)
        public double sceneScale = 1.0;          // scale the whole scene around the pivot
        public double[] childRot = {0, 0, 0};   // extra ORIENTATION rotation, sub-bones only (over everything)
        public double[] childSceneRot = {0, 0, 0}; // extra POSITION rotation, sub-bones only (over everything)
        public boolean[] invert = {false, false, false};
        public boolean mirror = false;
        public String base = "PIX";
        public double scale = 0.75;
        public double sizeadd = 0.0;
        public String bone = null;
        public boolean centerMain = false; // center the part's biggest box on the bone (X=0,Y=0)
        public double centerZ = 0.0;        // ...at this Z depth; decorations stay relative
    }

    /** Per-cube state for box-scope ops. pos = emit position, size = half-extent (post-scale). */
    public static final class BoxCtx {
        public double[] pos, size;
        public int idx;
        public double[] t;        // owning part's resolved translate (read-only reference)
        public boolean flipU = false, flipV = false; // all-face horizontal/vertical UV flip
        public boolean[] faceU = new boolean[6], faceV = new boolean[6]; // per-face flip (down,up,north,east,south,west)
        public int[] swap = {0, 1, 2, 3, 4, 5}; // face UV remap: swap[i] = which source face's UV face i takes
        public BoxCtx(double[] pos, double[] size, int idx, double[] t) { this.pos = pos; this.size = size; this.idx = idx; this.t = t; }
    }

    private final List<Script> scripts = new ArrayList<>();
    private final Map<String, Double> vars = new HashMap<>();

    public static JpEngine load(Path parsersRoot, String subFolder) {
        JpEngine e = new JpEngine();
        e.loadDir(parsersRoot);
        if (subFolder != null && parsersRoot != null) e.loadDir(parsersRoot.resolve(subFolder));
        return e;
    }

    private void loadDir(Path dir) {
        if (dir == null || !Files.isDirectory(dir)) return;
        try {
            List<Path> files = new ArrayList<>();
            try (var s = Files.list(dir)) {
                s.filter(p -> p.toString().toLowerCase(Locale.ROOT).endsWith(".jp")).forEach(files::add);
            }
            files.sort((a, b) -> {
                String fa = a.getFileName().toString().toLowerCase(Locale.ROOT), fb = b.getFileName().toString().toLowerCase(Locale.ROOT);
                boolean ua = fa.startsWith("_"), ub = fb.startsWith("_");
                if (ua != ub) return ua ? -1 : 1;
                return fa.compareTo(fb);
            });
            for (Path f : files) {
                try { Script.parseFile(Files.readAllLines(f), f.getFileName().toString(), this); }
                catch (Exception ex) { System.err.println("[Floamy3D] bad parser " + f.getFileName() + ": " + ex.getMessage()); }
            }
        } catch (IOException ignored) {}
    }

    /** Part-scope pass: key = "armorId:partName". */
    public PartCtx applyPart(String key, PartCtx ctx) {
        String k = key == null ? "" : key.toLowerCase(Locale.ROOT);
        for (Script s : scripts) if (s.matches(k)) for (Action a : s.actions) if (a.partOp != null) a.partOp.apply(ctx);
        return ctx;
    }

    /** Box-scope pass: run per cube, respecting each box op's cube selector. */
    public void applyBox(String key, BoxCtx box) {
        String k = key == null ? "" : key.toLowerCase(Locale.ROOT);
        for (Script s : scripts)
            if (s.matches(k))
                for (Action a : s.actions)
                    if (a.boxOp != null && a.selects(box.idx)) a.boxOp.apply(box);
    }

    /** Load extra .jp from another dir into this engine (e.g. an armor's own folder). */
    public JpEngine loadMore(Path dir) { loadDir(dir); return this; }

    public int scriptCount() { return scripts.size(); }

    // ---- model ----------------------------------------------------------------

    private interface PartOp { void apply(PartCtx c); }
    private interface BoxOp { void apply(BoxCtx b); }

    /** One directive: a part op OR a box op (the latter carrying the active cube selector). */
    private static final class Action {
        PartOp partOp; BoxOp boxOp; int cube = -2;  // -2 = all (no selector yet), -1 = *, >=0 = index
        boolean selects(int idx) { return cube == -1 || cube == -2 || cube == idx; }
        static Action part(PartOp p) { Action a = new Action(); a.partOp = p; return a; }
        static Action box(BoxOp b, int cube) { Action a = new Action(); a.boxOp = b; a.cube = cube; return a; }
    }

    private static final class Script {
        final List<String> globs = new ArrayList<>();
        final List<Action> actions = new ArrayList<>();
        boolean matches(String key) {
            if (globs.isEmpty()) return true;
            for (String g : globs) if (globMatch(g, key)) return true;
            return false;
        }

        static void parseFile(List<String> lines, String src, JpEngine eng) {
            Script sc = null; int curCube = -1;   // current box selector within the rule
            for (String raw : lines) {
                String line = raw.trim();
                int hash = line.indexOf('#'); if (hash >= 0) line = line.substring(0, hash).trim();
                if (line.isEmpty()) continue;
                String[] k = line.split("\\s+");
                String op = k[0].toLowerCase(Locale.ROOT);
                if (op.equals("var")) { eng.vars.put(k[1], Expr.parse(line.substring(line.indexOf(k[2])), eng.vars).eval(zero())); continue; }
                if (op.equals("match")) { sc = new Script(); for (int i = 1; i < k.length; i++) sc.globs.add(k[i].toLowerCase(Locale.ROOT)); eng.scripts.add(sc); curCube = -1; continue; }
                if (sc == null) { sc = new Script(); eng.scripts.add(sc); }
                if (op.equals("cube")) { curCube = k[1].equals("*") ? -1 : Integer.parseInt(k[1]); continue; }
                addAction(sc, op, k, line, eng.vars, curCube, src);
            }
        }

        static void addAction(Script sc, String op, String[] k, String line, Map<String, Double> vars, int cube, String src) {
            switch (op) {
                // --- part scope ---
                case "translate" -> { Expr x = Expr.parse(k[1], vars), y = Expr.parse(k[2], vars), z = Expr.parse(k[3], vars);
                    sc.actions.add(Action.part(c -> { c.t[0] += x.eval(part(c)); c.t[1] += y.eval(part(c)); c.t[2] += z.eval(part(c)); })); }
                case "set" -> { int ax = axis(k[1].replace("t.", "")); Expr e = Expr.parse(line.substring(line.indexOf(k[2])), vars);
                    sc.actions.add(Action.part(c -> c.t[ax] = e.eval(part(c)))); }
                case "mul" -> { int ax = axis(k[1].replace("t.", "")); Expr e = Expr.parse(line.substring(line.indexOf(k[2])), vars);
                    sc.actions.add(Action.part(c -> c.t[ax] *= e.eval(part(c)))); }
                case "rotate" -> { int ax = axis(k[1]); Expr e = Expr.parse(k[2], vars);
                    sc.actions.add(Action.part(c -> c.rot[ax] += e.eval(part(c)))); }
                case "rotatesc" -> { int ax = axis(k[1]); Expr e = Expr.parse(k[2], vars);   // rotate scene around pivot
                    sc.actions.add(Action.part(c -> c.sceneRot[ax] += e.eval(part(c)))); }
                case "rotatechilds" -> { int ax = axis(k[1]); Expr e = Expr.parse(k[2], vars);   // extra orientation, sub-bones only
                    sc.actions.add(Action.part(c -> c.childRot[ax] += e.eval(part(c)))); }
                case "rotatescchilds" -> { int ax = axis(k[1]); Expr e = Expr.parse(k[2], vars);   // extra position rotation, sub-bones only
                    sc.actions.add(Action.part(c -> c.childSceneRot[ax] += e.eval(part(c)))); }
                case "translatesc" -> { Expr x = Expr.parse(k[1], vars), y = Expr.parse(k[2], vars), z = Expr.parse(k[3], vars);  // shift whole scene
                    sc.actions.add(Action.part(c -> { c.sceneT[0] += x.eval(part(c)); c.sceneT[1] += y.eval(part(c)); c.sceneT[2] += z.eval(part(c)); })); }
                case "scalesc" -> { Expr e = Expr.parse(k[1], vars);   // scale whole scene around pivot
                    sc.actions.add(Action.part(c -> c.sceneScale = e.eval(part(c)))); }
                case "invert" -> { int ax = axis(k[1]); boolean on = k.length < 3 || truthy(k[2]); sc.actions.add(Action.part(c -> c.invert[ax] = on)); }
                case "base" -> { String v = k[1]; sc.actions.add(Action.part(c -> c.base = v.equalsIgnoreCase("none") ? null : v.toUpperCase(Locale.ROOT))); }
                case "scale" -> { Expr e = Expr.parse(k[1], vars); sc.actions.add(Action.part(c -> c.scale = e.eval(part(c)))); }
                case "sizeadd" -> { Expr e = Expr.parse(k[1], vars); sc.actions.add(Action.part(c -> c.sizeadd = e.eval(part(c)))); }
                case "bone" -> { String v = k[1].toUpperCase(Locale.ROOT); sc.actions.add(Action.part(c -> c.bone = v)); }
                case "center" -> { Expr e = Expr.parse(k[1], vars); sc.actions.add(Action.part(c -> { c.centerMain = true; c.centerZ = e.eval(part(c)); })); }
                // --- box scope ---
                case "seat" -> sc.actions.add(Action.box(b -> b.pos[2] = -b.size[1], cube));
                case "flipu" -> sc.actions.add(Action.box(b -> b.flipU = !b.flipU, cube));   // all-face horizontal UV flip
                case "flipv" -> sc.actions.add(Action.box(b -> b.flipV = !b.flipV, cube));   // all-face vertical UV flip
                case "flipface" -> {   // flip ONE face's UV: flipface <down|up|north|east|south|west> [u|v]
                    int fi = face(k[1]); boolean vv = k.length > 2 && k[2].equalsIgnoreCase("v");
                    sc.actions.add(Action.box(b -> { if (vv) b.faceV[fi] = !b.faceV[fi]; else b.faceU[fi] = !b.faceU[fi]; }, cube));
                }
                case "switchface" -> {   // swap the UVs of two faces: switchface <faceA> <faceB>
                    int a = face(k[1]), bb = face(k[2]);
                    sc.actions.add(Action.box(box -> { int t = box.swap[a]; box.swap[a] = box.swap[bb]; box.swap[bb] = t; }, cube));
                }
                // mirror <axis>: invert geometry on an axis AND flip the matching UV in one op.
                case "mirror" -> {
                    if (k.length >= 2 && (k[1].equalsIgnoreCase("x") || k[1].equalsIgnoreCase("y") || k[1].equalsIgnoreCase("z"))) {
                        int ax = axis(k[1]);
                        sc.actions.add(Action.box(b -> { b.pos[ax] = -b.pos[ax]; if (ax == 1) b.flipV = !b.flipV; else b.flipU = !b.flipU; }, cube));
                    } else { boolean on = k.length < 2 || truthy(k[1]); sc.actions.add(Action.part(c -> c.mirror = on)); }
                }
                case "bset" -> { int ax = axis(k[1].replace("bz.", "")); Expr e = Expr.parse(line.substring(line.indexOf(k[2])), vars);
                    sc.actions.add(Action.box(b -> b.pos[ax] = e.eval(box(b)), cube)); }
                case "btranslate" -> { Expr x = Expr.parse(k[1], vars), y = Expr.parse(k[2], vars), z = Expr.parse(k[3], vars);
                    sc.actions.add(Action.box(b -> { b.pos[0] += x.eval(box(b)); b.pos[1] += y.eval(box(b)); b.pos[2] += z.eval(box(b)); }, cube)); }
                default -> throw new IllegalArgumentException("unknown directive '" + op + "' in " + src);
            }
        }
    }

    private static int axis(String s) { return switch (s.toLowerCase(Locale.ROOT)) { case "x" -> 0; case "y" -> 1; case "z" -> 2; default -> throw new IllegalArgumentException("bad axis " + s); }; }
    // face order matches CemBox: DOWN,UP,NORTH(front),EAST,SOUTH(back),WEST
    private static int face(String s) { return switch (s.toLowerCase(Locale.ROOT)) { case "down" -> 0; case "up" -> 1; case "north", "front" -> 2; case "east" -> 3; case "south", "back" -> 4; case "west" -> 5; default -> throw new IllegalArgumentException("bad face " + s); }; }
    private static boolean truthy(String s) { return s.equalsIgnoreCase("on") || s.equals("1") || s.equalsIgnoreCase("true"); }

    // ---- expression context (resolves t.* / sz.* / bz.* / idx / $VAR) ---------

    private interface EvalCtx { double resolve(String tok); }
    private static EvalCtx zero() { return tok -> 0.0; }
    private static EvalCtx part(PartCtx c) { return tok -> switch (tok) { case "t.x" -> c.t[0]; case "t.y" -> c.t[1]; case "t.z" -> c.t[2]; default -> 0.0; }; }
    private static EvalCtx box(BoxCtx b) {
        return tok -> switch (tok) {
            case "sz.x" -> b.size[0]; case "sz.y" -> b.size[1]; case "sz.z" -> b.size[2];
            case "bz.x" -> b.pos[0];  case "bz.y" -> b.pos[1];  case "bz.z" -> b.pos[2];
            case "t.x" -> b.t[0]; case "t.y" -> b.t[1]; case "t.z" -> b.t[2];
            case "idx" -> b.idx; default -> 0.0;
        };
    }

    // ---- glob -----------------------------------------------------------------

    static boolean globMatch(String glob, String s) { return globMatch(glob, 0, s, 0); }
    private static boolean globMatch(String g, int gi, String s, int si) {
        while (gi < g.length()) {
            char c = g.charAt(gi);
            if (c == '*') { while (gi < g.length() && g.charAt(gi) == '*') gi++; if (gi == g.length()) return true;
                for (int k = si; k <= s.length(); k++) if (globMatch(g, gi, s, k)) return true; return false; }
            if (si >= s.length() || s.charAt(si) != c) return false; gi++; si++;
        }
        return si == s.length();
    }

    // ---- expressions ----------------------------------------------------------

    private static final class Expr {
        private final String src; private int pos; private final Map<String, Double> vars;
        private Expr(String src, Map<String, Double> vars) { this.src = src; this.vars = vars; }
        static Expr parse(String s, Map<String, Double> vars) { return new Expr(s.replaceAll("\\s+", ""), vars); }
        double eval(EvalCtx c) { pos = 0; return expr(c); }
        private double expr(EvalCtx c) { double v = term(c); while (pos < src.length() && (peek() == '+' || peek() == '-')) { char o = src.charAt(pos++); double r = term(c); v = o == '+' ? v + r : v - r; } return v; }
        private double term(EvalCtx c) { double v = factor(c); while (pos < src.length() && (peek() == '*' || peek() == '/')) { char o = src.charAt(pos++); double r = factor(c); v = o == '*' ? v * r : v / r; } return v; }
        private double factor(EvalCtx c) {
            if (peek() == '(') { pos++; double v = expr(c); if (peek() == ')') pos++; return v; }
            if (peek() == '-') { pos++; return -factor(c); }
            if (peek() == '+') { pos++; return factor(c); }
            if (peek() == '$') { int st = ++pos; while (pos < src.length() && (Character.isLetterOrDigit(src.charAt(pos)) || src.charAt(pos) == '_')) pos++; return vars.getOrDefault(src.substring(st, pos), 0.0); }
            for (String t : new String[]{"t.x","t.y","t.z","sz.x","sz.y","sz.z","bz.x","bz.y","bz.z","idx"})
                if (src.startsWith(t, pos)) { pos += t.length(); return c.resolve(t); }
            int st = pos; while (pos < src.length() && (Character.isDigit(src.charAt(pos)) || src.charAt(pos) == '.')) pos++;
            if (pos == st) throw new IllegalArgumentException("bad expr: " + src.substring(st));
            return Double.parseDouble(src.substring(st, pos));
        }
        private char peek() { return pos < src.length() ? src.charAt(pos) : '\0'; }
    }
}
