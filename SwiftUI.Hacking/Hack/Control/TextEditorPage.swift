//
//  TextEditorPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct TextEditorPage: View {
    
    @State private var profileText = "Please enter your bio. "
    
    var body: some View {
        TextEditor(text: $profileText)
            .foregroundColor(.green)
            .background(Color.red)
            .navigationBarTitle("TextEditor")
    }
}

struct TextEditorPage_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorPage()
    }
}
