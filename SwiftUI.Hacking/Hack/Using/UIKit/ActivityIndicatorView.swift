//
//  ActivityIndicatorView.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityIndicatorView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.animate.toggle()
                }) {
                    Text("Animate").bold().italic().font(.largeTitle)
                }
                Spacer()
            }
            
            ActivityIndicator(animate: $animate)
        }
        .navigationBarTitle("Animate")
    }
}

#if DEBUG
struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
#endif



struct ActivityIndicator: UIViewRepresentable {

    // 是否进行旋转
    @Binding var animate: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.tintColor = UIColor.black
        indicator.hidesWhenStopped = true
        indicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        return indicator
    }

    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animate {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
