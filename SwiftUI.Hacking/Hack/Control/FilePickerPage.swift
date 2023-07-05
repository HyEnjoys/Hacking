//
//  FilePickerPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct FilePickerPage: View {
    
    @State var filePath = URL(fileURLWithPath: "")
    
    @State var importing = false
    @State var moving    = false
    @State var exporting = false
    
    var body: some View {
        VStack {
            Text("Operate: must pick file can move it.")
                .foregroundColor(Color.gray)
                .padding()
            
            Button {
                importing = true
            } label: {
                Text("File Picker")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [.plainText]
            ) { result in
                switch result {
                case .success(let file):
                    filePath = file.absoluteURL
                    print("file pick path: \(file.absoluteString)")
                case .failure(let error):
                    print("file pick failed: \(error.localizedDescription)")
                }
            }
            
            Button {
                importing = true
            } label: {
                Text("File Move")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            .fileMover(isPresented: $moving, file: filePath) { result in
                switch result {
                case .success(let file):
                    print(file.absoluteString)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        .toolbar {
            HStack {
                Button {
                    importing = true
                } label: {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .foregroundColor(Color.red)
                }
                .fileImporter(
                    isPresented: $importing,
                    allowedContentTypes: [.plainText]
                ) { result in
                    switch result {
                    case .success(let file):
                        filePath = file.absoluteURL
                        print("file pick path: \(file.absoluteString)")
                    case .failure(let error):
                        print("file pick failed: \(error.localizedDescription)")
                    }
                }
            }
        }
        .navigationTitle("File Picker")
    }
}

struct FilePickerPage_Previews: PreviewProvider {
    static var previews: some View {
        FilePickerPage()
    }
}
