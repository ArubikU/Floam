package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.registry.OverlapDetector;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class OverlapTest {

    @Test
    void sameMarkerConflicts() throws Exception {
        Registry reg = new Registry();
        var a = reg.register(new BbModelParser().parse(headBb("a", 0, 0, 8, 8), "a", Part.HEAD));
        var b = reg.register(new BbModelParser().parse(headBb("b", 40, 40, 48, 48), "b", Part.HEAD));
        OverlapDetector.Result r = new OverlapDetector().detect(a, b);
        // both on HEAD -> same marker pixel -> mutually exclusive
        assertTrue(r.sameMarker);
        assertTrue(r.conflict, r.reason);
    }

    @Test
    void uvOverlapConflictsAcrossParts() throws Exception {
        Registry reg = new Registry();
        var a = reg.register(new BbModelParser().parse(headBb("a", 0, 0, 8, 8), "a", Part.HEAD));
        var b = reg.register(new BbModelParser().parse(headBb("b", 4, 4, 12, 12), "b", Part.BODY));
        OverlapDetector.Result r = new OverlapDetector().detect(a, b);
        assertFalse(r.sameMarker, "different parts -> different marker pixel");
        assertTrue(r.uvOverlap, "uv rects (0,0,8,8) and (4,4,8,8) intersect");
        assertTrue(r.conflict);
        assertFalse(r.overlaps.isEmpty());
    }

    @Test
    void disjointNoConflict() throws Exception {
        Registry reg = new Registry();
        var a = reg.register(new BbModelParser().parse(headBb("a", 0, 0, 8, 8), "a", Part.HEAD));
        var b = reg.register(new BbModelParser().parse(headBb("b", 40, 40, 48, 48), "b", Part.BODY));
        OverlapDetector.Result r = new OverlapDetector().detect(a, b);
        assertFalse(r.conflict, r.reason);
    }

    private static String headBb(String id, int u1, int v1, int u2, int v2) {
        return "{ \"name\":\"" + id + "\", \"resolution\":{\"width\":64,\"height\":64},"
             + " \"elements\":[ { \"type\":\"cube\",\"from\":[6,8,4],\"to\":[10,11,4],\"origin\":[8,8,8],"
             + " \"faces\":{ \"north\":{\"uv\":[" + u1 + "," + v1 + "," + u2 + "," + v2 + "]} } } ] }";
    }
}
