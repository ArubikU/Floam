"use client"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { ArrowDownToLine, FileCode, FileJson } from "lucide-react"
import { useState } from "react"
import { FileUploader } from "./components/file-uploader"
import { ModelConverter } from "./components/model-converter"

export default function Home() {
  const [layer1File, setLayer1File] = useState<File | null>(null)
  const [layer2File, setLayer2File] = useState<File | null>(null)
  const [convertedCode, setConvertedCode] = useState<string>("")
  const [isConverting, setIsConverting] = useState(false)
  const [customId, setCustomId] = useState<string>("PLACEHOLDER_ID")

  const handleConvert = async () => {
    if (!layer1File || !layer2File) {
      return
    }

    setIsConverting(true)
    try {
      const layer1Data = await layer1File.text()
      const layer2Data = await layer2File.text()

      const result = await ModelConverter.convertToGLSL(JSON.parse(layer1Data), JSON.parse(layer2Data), customId)

      setConvertedCode(result)
    } catch (error) {
      console.error("Conversion error:", error)
    } finally {
      setIsConverting(false)
    }
  }

  const downloadFile = () => {
    if (!convertedCode) return

    const blob = new Blob([convertedCode], { type: "text/plain" })
    const url = URL.createObjectURL(blob)
    const a = document.createElement("a")
    a.href = url
    a.download = "armor.txt"
    document.body.appendChild(a)
    a.click()
    document.body.removeChild(a)
    URL.revokeObjectURL(url)
  }

  return (
    <main className="flex min-h-screen flex-col items-center p-4 md:p-8 bg-gray-50 dark:bg-gray-900">
      <div className="w-full max-w-5xl space-y-6">
        <div className="text-center space-y-2">
          <h1 className="text-3xl font-bold tracking-tight">Model to GLSL Converter</h1>
          <p className="text-muted-foreground">
            Convert layer_1 and layer_2 model files (.cem, .jem, .json) to GLSL shader code
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div className="space-y-4">
            <h2 className="text-xl font-semibold flex items-center gap-2">
              <FileJson className="h-5 w-5" />
              Input Files
            </h2>
            <div className="space-y-4">
              <FileUploader
                label="Layer 1 File (.cem, .jem, .json)"
                onFileSelected={setLayer1File}
                acceptedFileTypes=".cem,.jem,.json"
                selectedFile={layer1File}
              />
              <FileUploader
                label="Layer 2 File (.cem, .jem, .json)"
                onFileSelected={setLayer2File}
                acceptedFileTypes=".cem,.jem,.json"
                selectedFile={layer2File}
              />
              <div className="space-y-2">
                <Label>Custom ID (e.g. MASAKI_SPIKE, TOURNE_FIN)</Label>
                <Input placeholder="Enter custom ID" value={customId} onChange={(e) => setCustomId(e.target.value)} />
              </div>
              <Button onClick={handleConvert} disabled={!layer1File || !layer2File || isConverting} className="w-full">
                {isConverting ? "Converting..." : "Convert to GLSL"}
              </Button>
            </div>
          </div>

          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h2 className="text-xl font-semibold flex items-center gap-2">
                <FileCode className="h-5 w-5" />
                Output GLSL
              </h2>
              {convertedCode && (
                <Button variant="outline" size="sm" onClick={downloadFile} className="flex items-center gap-1">
                  <ArrowDownToLine className="h-4 w-4" />
                  Download
                </Button>
              )}
            </div>
            <Tabs defaultValue="preview" className="w-full">
              <TabsList className="grid w-full grid-cols-2">
                <TabsTrigger value="preview">Preview</TabsTrigger>
                <TabsTrigger value="code">Code</TabsTrigger>
              </TabsList>
              <TabsContent value="preview" className="h-[500px] overflow-auto">
                {convertedCode ? (
                  <pre className="p-4 rounded-md bg-gray-100 dark:bg-gray-800 text-sm overflow-auto h-full">
                    {convertedCode}
                  </pre>
                ) : (
                  <div className="flex items-center justify-center h-full text-muted-foreground">
                    Convert files to see the GLSL output
                  </div>
                )}
              </TabsContent>
              <TabsContent value="code" className="h-[500px]">
                <textarea
                  className="w-full h-full p-4 rounded-md bg-gray-100 dark:bg-gray-800 text-sm font-mono resize-none"
                  value={convertedCode}
                  onChange={(e) => setConvertedCode(e.target.value)}
                  placeholder="GLSL code will appear here after conversion"
                />
              </TabsContent>
            </Tabs>
          </div>
        </div>
      </div>
    </main>
  )
}

