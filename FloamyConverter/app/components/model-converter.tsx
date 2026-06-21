"use client"

interface ModelPart {
  part: string
  id: string
  invertAxis: string
  translate: number[]
  boxes?: Box[]
  submodels?: Submodel[]
  mirrorTexture?: string
}

interface Box {
  coordinates: number[]
  textureOffset?: number[]
  uvNorth?: string
  uvEast?: string
  uvSouth?: string
  uvWest?: string
  uvUp?: string
  uvDown?: string
  sizeAdd?: number
}

interface Submodel {
  id: string
  invertAxis: string
  translate: number[]
  rotate?: number[]
  boxes?: Box[]
  mirrorTexture?: string
  submodels?: Submodel[]
}

interface ModelData {
  models: ModelPart[]
  texture: string
  textureSize: number[]
}

export class ModelConverter {
  private static readonly PART_MAPPING: Record<string, string> = {
    head: "STASIS_HELMET",
    body: "STASIS_CHESTPLATE",
    left_arm: "STASIS_LEFT_ARM",
    right_arm: "STASIS_RIGHT_ARM",
    left_leg: "STASIS_LEFT_LEG",
    right_leg: "STASIS_RIGHT_LEG",
    left_shoe: "STASIS_LEFT_BOOT",
    right_shoe: "STASIS_RIGHT_BOOT",
    waist: "STASIS_INNER_ARMOR",
  }

  private static readonly CUSTOM_PART_MAPPING: Record<string, string> = {
    head: "PLACEHOLDER_ID_HELMET",
    body: "PLACEHOLDER_ID_CHESTPLATE",
    left_arm: "PLACEHOLDER_ID_LEFT_ARM",
    right_arm: "PLACEHOLDER_ID_RIGHT_ARM",
    left_leg: "PLACEHOLDER_ID_LEFT_LEG",
    right_leg: "PLACEHOLDER_ID_RIGHT_LEG",
    left_shoe: "PLACEHOLDER_ID_LEFT_FEET",
    right_shoe: "PLACEHOLDER_ID_RIGHT_FEET",
    waist: "PLACEHOLDER_ID_INNER_ARMOR",
  }

  public static async convertToGLSL(layer1Data: any, layer2Data: any, customId = "PLACEHOLDER_ID"): Promise<string> {
    // Generate internal ID for model identification
    const internalId = {
      r: Math.floor(Math.random() * 255),
      g: Math.floor(Math.random() * 255),
      b: Math.floor(Math.random() * 255),
    }

    // Replace placeholder ID with custom ID
    const mappedParts = Object.entries(this.CUSTOM_PART_MAPPING).reduce(
      (acc, [key, value]) => {
        acc[key] = value.replace("PLACEHOLDER_ID", customId)
        return acc
      },
      {} as Record<string, string>,
    )

    // Generate VSH section
    const vshCode = this.generateVSHCode(internalId, mappedParts)

    // Generate FSH section
    const fshCode = this.generateFSHCode(layer1Data, layer2Data, mappedParts)

    // Combine sections
    return `#ifdef VSH\n\n${vshCode}\n#endif\n\n\n\n#ifdef FSH\n\n${fshCode}\n#endif`
  }

  private static generateVSHCode(
    internalId: { r: number; g: number; b: number },
    mappedParts: Record<string, string>,
  ): string {
    return `if(getChannel(RelativeCords,ivec2(63,31), 0) == ${internalId.r}
&& getChannel(RelativeCords,ivec2(63,31), 1) == ${internalId.g}
&& getChannel(RelativeCords,ivec2(63,31), 2) == ${internalId.b}) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,${mappedParts["body"]});
        //removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,${mappedParts["right_arm"]});
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,${mappedParts["left_arm"]});
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,${mappedParts["left_shoe"]});
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,${mappedParts["right_shoe"]});
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_LEG) {
        removeAll=1;
        cems = addCem(cems,${mappedParts["right_leg"]});
    }
     if(cube==STASIS_LEFT_LEG) {
        removeAll=1;
         cems = addCem(cems,${mappedParts["left_leg"]});
    }
}`
  }

  private static generateFSHCode(layer1Data: any, layer2Data: any, mappedParts: Record<string, string>): string {
    let fshCode = ""

    // Process each model part
    for (const model of [...(layer1Data.models || []), ...(layer2Data.models || [])]) {
      const partName = model.part
      const customPartName = mappedParts[partName]

      if (!customPartName) continue

      fshCode += `    case ${customPartName}: {\n\n`

      // Process boxes and submodels
      if (model.boxes) {
        fshCode += this.processBoxes(model.boxes, model.translate, [0, 0, 0])
      }

      if (model.submodels) {
        fshCode += this.processSubmodels(model.submodels, model.translate)
      }

      fshCode += `        break;\n    }\n\n    \n`
    }

    return fshCode
  }

  private static processBoxes(boxes: Box[], parentTranslate: number[], parentRotate: number[]): string {
    let code = ""

    for (const box of boxes) {
      if (!box.coordinates) continue

      const [x, y, z, width, height, depth] = box.coordinates

      // Calculate position relative to parent
      const posX = x + width / 2 + parentTranslate[0]
      const posY = y + height / 2 + parentTranslate[1]
      const posZ = z + depth / 2 + parentTranslate[2]

      // Generate box code
      code += `       ADD_BOX_WITH_ROTATION_ROTATE(vec3(${posX.toFixed(4)},${posY.toFixed(4)},${posZ.toFixed(4)}), vec3(${width.toFixed(2)},${height.toFixed(2)},${depth.toFixed(2)})*0.75 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(${box.uvDown || "0,0"},${width.toFixed(0)},-${depth.toFixed(0)},RelativeCords), relativeUv(${box.uvUp || "0,0"},${width.toFixed(0)},${depth.toFixed(0)},RelativeCords), //down up
       relativeUv(${box.uvNorth || "0,0"},${width.toFixed(0)},${height.toFixed(0)},RelativeCords), relativeUv(${box.uvEast || "0,0"},${depth.toFixed(0)},${height.toFixed(0)},RelativeCords) , //north east
       relativeUv(${box.uvSouth || "0,0"},${width.toFixed(0)},${height.toFixed(0)},RelativeCords),  relativeUv(${box.uvWest || "0,0"},${depth.toFixed(0)},${height.toFixed(0)},RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);\n`
    }

    return code
  }

  private static processSubmodels(submodels: Submodel[], parentTranslate: number[]): string {
    let code = ""

    for (const submodel of submodels) {
      // Calculate absolute translation
      const translate = [
        submodel.translate[0] + parentTranslate[0],
        submodel.translate[1] + parentTranslate[1],
        submodel.translate[2] + parentTranslate[2],
      ]

      // Process rotation
      let rotation = "PIX"
      if (submodel.rotate) {
        const [rotX, rotY, rotZ] = submodel.rotate

        // Convert rotation to appropriate macro
        rotation = this.convertRotation(rotX, rotY, rotZ)
      }

      // Process boxes in this submodel
      if (submodel.boxes) {
        for (const box of submodel.boxes) {
          if (!box.coordinates) continue

          const [x, y, z, width, height, depth] = box.coordinates

          // Calculate position relative to submodel
          const posX = x + width / 2 + translate[0]
          const posY = y + height / 2 + translate[1]
          const posZ = z + depth / 2 + translate[2]

          // Generate box code with rotation
          code += `       ADD_BOX_WITH_ROTATION_ROTATE(vec3(${posX.toFixed(4)},${posY.toFixed(4)},${posZ.toFixed(4)}), vec3(${width.toFixed(2)},${height.toFixed(2)},${depth.toFixed(2)})*0.75 ,   //Pos, Size,
       PIX*${rotation}, vec3(0, 0, 0),
       relativeUv(${box.uvDown || "0,0"},${width.toFixed(0)},-${depth.toFixed(0)},RelativeCords), relativeUv(${box.uvUp || "0,0"},${width.toFixed(0)},${depth.toFixed(0)},RelativeCords), //down up
       relativeUv(${box.uvNorth || "0,0"},${width.toFixed(0)},${height.toFixed(0)},RelativeCords), relativeUv(${box.uvEast || "0,0"},${depth.toFixed(0)},${height.toFixed(0)},RelativeCords) , //north east
       relativeUv(${box.uvSouth || "0,0"},${width.toFixed(0)},${height.toFixed(0)},RelativeCords),  relativeUv(${box.uvWest || "0,0"},${depth.toFixed(0)},${height.toFixed(0)},RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);\n`
        }
      }

      // Process nested submodels
      if (submodel.submodels) {
        code += this.processSubmodels(submodel.submodels, translate)
      }
    }

    return code
  }

  // Helper function to convert rotation degrees to radians and find the closest predefined rotation macro
  private static convertRotation(degX: number, degY: number, degZ: number): string {
    // Normalize angles
    const normalizeAngle = (deg: number) => (deg > 180 ? deg - 360 : deg)

    const normX = normalizeAngle(degX)
    const normY = normalizeAngle(degY)
    const normZ = normalizeAngle(degZ)

    // Convert to radians
    const radX = (normX * Math.PI) / 180
    const radY = (normY * Math.PI) / 180
    const radZ = (normZ * Math.PI) / 180

// Utilizar Map que puede tener números como claves
    const xMacros = new Map<number, string>([
      [0.5, "PIX"], [0.25, "PIX25"], [0.125, "PIX12"], [0.0625, "PIX62"],
      [1, "PIX2"], [1.5, "PIX3"], [-0.5, "NIX"], [-0.25, "NIX25"], [-0.125, "NIX12"], [-0.0625, "NIX62"],
      [-1, "NIX1"], [-1.5, "NIX3"]
    ]);
  const yMacros = new Map<number, string>([
    [0.5, "PIY"], [0.25, "PIY25"], [0.125, "PIY12"], [0.0625, "PIY62"],
    [1, "PIY2"], [1.5, "PIY3"], [-0.5, "NIY"], [-0.25, "NIY25"], [-0.125, "NIY12"], [-0.0625, "NIY62"],
    [-1, "NIY1"], [-1.5, "NIY3"]
  ]);

  const zMacros = new Map<number, string>([
    [0.5, "PIZ"], [0.25, "PIZ25"], [0.125, "PIZ12"], [0.0625, "PIZ62"],
    [1, "PIZ2"], [1.5, "PIZ3"], [-0.5, "NIZ"], [-0.25, "NIZ25"], [-0.125, "NIZ12"], [-0.0625, "NIZ62"],
    [-1, "NIZ1"], [-1.5, "NIZ3"]
  ]);

// Find closest macros
const findClosestMacro = (rad: number, macros: Map<number, string>): string => {
  const tolerance = 0.05
  const factor = rad / Math.PI

  for (const [mult, macro] of Object.entries(macros)) {
    if (Math.abs(factor - Number.parseFloat(mult)) < tolerance) {
      return macro
    }
  }

  return `Rotate3(PI*${factor.toFixed(4)})`
}

const xMacro = findClosestMacro(radX, xMacros)
const yMacro = findClosestMacro(radY, yMacros)
const zMacro = findClosestMacro(radZ, zMacros)

// Combine macros
const macros = []
if (xMacro !== "Rotate3(PI*0.0000)") macros.push(xMacro)
if (yMacro !== "Rotate3(PI*0.0000)") macros.push(yMacro)
if (zMacro !== "Rotate3(PI*0.0000)") macros.push(zMacro)

return macros.length > 0 ? macros.join("*") : "PIX";
}
}

