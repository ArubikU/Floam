"use client"

import type React from "react"

import { useState, useRef } from "react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { FileIcon, UploadIcon, XIcon } from "lucide-react"

interface FileUploaderProps {
  label: string
  onFileSelected: (file: File | null) => void
  acceptedFileTypes: string
  selectedFile: File | null
}

export function FileUploader({ label, onFileSelected, acceptedFileTypes, selectedFile }: FileUploaderProps) {
  const [isDragging, setIsDragging] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)

  const handleDragOver = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault()
    setIsDragging(true)
  }

  const handleDragLeave = () => {
    setIsDragging(false)
  }

  const handleDrop = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault()
    setIsDragging(false)

    if (e.dataTransfer.files && e.dataTransfer.files.length > 0) {
      const file = e.dataTransfer.files[0]
      if (isValidFileType(file)) {
        onFileSelected(file)
      }
    }
  }

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      const file = e.target.files[0]
      if (isValidFileType(file)) {
        onFileSelected(file)
      }
    }
  }

  const isValidFileType = (file: File) => {
    const fileTypes = acceptedFileTypes.split(",")
    const fileName = file.name.toLowerCase()
    return fileTypes.some((type) => fileName.endsWith(type.replace(".", "")))
  }

  const clearFile = () => {
    onFileSelected(null)
    if (inputRef.current) {
      inputRef.current.value = ""
    }
  }

  return (
    <div className="space-y-2">
      <Label>{label}</Label>
      {!selectedFile ? (
        <div
          className={`border-2 border-dashed rounded-lg p-6 text-center cursor-pointer transition-colors ${
            isDragging ? "border-primary bg-primary/5" : "border-gray-300 dark:border-gray-700 hover:border-primary/50"
          }`}
          onDragOver={handleDragOver}
          onDragLeave={handleDragLeave}
          onDrop={handleDrop}
          onClick={() => inputRef.current?.click()}
        >
          <div className="flex flex-col items-center gap-2">
            <UploadIcon className="h-8 w-8 text-muted-foreground" />
            <p className="text-sm font-medium">Drag and drop or click to upload</p>
            <p className="text-xs text-muted-foreground">Supports {acceptedFileTypes.replace(/\./g, "")} files</p>
          </div>
          <Input ref={inputRef} type="file" accept={acceptedFileTypes} onChange={handleFileChange} className="hidden" />
        </div>
      ) : (
        <div className="flex items-center justify-between p-3 border rounded-lg">
          <div className="flex items-center gap-2">
            <FileIcon className="h-5 w-5 text-primary" />
            <span className="text-sm font-medium truncate max-w-[200px]">{selectedFile.name}</span>
            <span className="text-xs text-muted-foreground">({(selectedFile.size / 1024).toFixed(1)} KB)</span>
          </div>
          <Button
            variant="ghost"
            size="icon"
            onClick={(e) => {
              e.stopPropagation()
              clearFile()
            }}
          >
            <XIcon className="h-4 w-4" />
          </Button>
        </div>
      )}
    </div>
  )
}

