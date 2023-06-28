//
//  DownloadImage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct DownloadImagePage: View {
    
    @State private var uiImage: UIImage? = nil
    let placeholderImage = UIImage(named: "icon.swift")!
    
    var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform: downloadWeb)
            .frame(width: 80, height: 80, alignment: .center)
            .onTapGesture {
                print("Image Tap")
            }.navigationBarTitle(Text("WebImage"), displayMode: .inline)
    }
    
    func downloadWeb() {
        guard let url = URL(string: "https://picsum.photos/50/50?i=30") else { return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            } else {
                print("error: \(String(describing: error))")
            }
        }.resume()
    }
}

#if DEBUG
struct DownloadImagePage_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImagePage()
    }
}
#endif
