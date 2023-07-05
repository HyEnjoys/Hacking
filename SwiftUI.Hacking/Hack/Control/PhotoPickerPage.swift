//
//  PhotoPickerPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct PhotoPickerPage: View {
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?
        
    var body: some View {
        ZStack {
            image?
                .resizable()
                .scaledToFit()
                .clipped()
                .padding()
        }
        .toolbar {
            /*
             .all(of: [
                 .images,
                 .bursts,
                 .cinematicVideos,
                 .depthEffectPhotos,
                 .livePhotos,
                 .timelapseVideos,
                 .screenshots,
                 .screenRecordings,
                 .panoramas
             ])
             */
            HStack {
                PhotosPicker(
                    selection: $selectedPhoto,
                    matching: .any(of: [.images])
                ) {
                    Image(systemName: "pencil")
                        .resizable()
                        .tint(Color.red)
                }
            }
        }
        .onChange(of: selectedPhoto) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self), let img = UIImage(data: data) {
                    image = Image(uiImage: img)
                }
            }
        }
        .navigationTitle("Photo Picker")
    }
}

struct PhotoPickerPage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            PhotoPickerPage()
        } else {
            Text("")
        }
    }
}
