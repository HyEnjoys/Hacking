//
//  AlertPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AlertPage: View {
    
    @State var isShow: Bool = false
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                self.isShow.toggle()
            }) {
                Text("Show Alert")
                    .foregroundColor(.black)
                    .italic()
                    .bold()
                    .font(.largeTitle)
            }
            .alert(isPresented: self.$isShow) {
                Alert(title: Text("Title"), message: Text("message"), dismissButton: Alert.Button.cancel(Text("cancel"), action: {
                    print("Cancel")
                }))
            }
            .padding()
            
            Button("Show 1") {
                self.showingAlert1 = true
            }
            .alert(isPresented: $showingAlert1) {
                Alert(title: Text("One"), message: nil, dismissButton: .cancel())
            }
            .padding()
            
            Button("Show 2") {
                self.showingAlert2 = true
            }
            .alert(isPresented: $showingAlert2) {
                Alert(title: Text("Two"), message: nil, dismissButton: .cancel())
            }
            .padding()
        }
        .navigationBarTitle("Alert")
    }
}

#if DEBUG
struct AlertPage_Previews: PreviewProvider {
    static var previews: some View {
        AlertPage()
    }
}
#endif
