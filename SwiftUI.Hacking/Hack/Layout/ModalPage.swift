//
//  ModalPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ModalPage: View {
   
    @State var isModal: Bool = false
    var modal: some View {
        return Text("Modal")
    }
    
    @State var detail: ModalDetail? = nil
    
    var body: some View {
        VStack {
            Button("Modal") {
                self.isModal = true
            }.sheet(isPresented: $isModal, content: {
                self.modal
            }).font(.largeTitle).padding()
            
            Button("Modal") {
                self.detail = ModalDetail(body: "Detail")
            }.sheet(item: $detail, content: { detail in
                self.modal(detail: detail.body)
            }).font(.largeTitle).padding()
        }.navigationBarTitle("Modal")
    }
    
    func modal(detail: String) -> some View {
        Text(detail)
    }
}

struct ModalDetail: Identifiable {
    var id: String {
        return body
    }
    
    let body: String
}

#if DEBUG
struct ModalPage_Previews: PreviewProvider {
    static var previews: some View {
        ModalPage()
    }
}
#endif
