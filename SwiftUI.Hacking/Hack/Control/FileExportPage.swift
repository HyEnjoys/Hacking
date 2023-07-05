//
//  FileExportPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers

struct TextDocument: FileDocument {
    static var readableContentTypes: [UTType] {
        [.plainText]
    }
    
    var text = ""
    
    init(text: String) {
        self.text = text
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            text = ""
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: Data(text.utf8))
    }
}

struct FileExportPage: View {
    
    @State private var exporting = false
    
    @State private var document = TextDocument(text: "This is a placeholder text.")
    
    var body: some View {
        TextEditor(text: $document.text)
            .toolbar {
                Button("Operate") {
                    exporting = true
                }
                .fileExporter(
                    isPresented: $exporting,
                    document: document,
                    contentType: .plainText
                ) { result in
                    switch result {
                    case .success(let file):
                        print("file export path: \(file.absoluteString)")
                    case .failure(let error):
                        print("file export failed: \(error.localizedDescription)")
                    }
                }
            }
            .navigationTitle("File Export")
    }
}

struct FileExportPage_Previews: PreviewProvider {
    static var previews: some View {
        FileExportPage()
    }
}
