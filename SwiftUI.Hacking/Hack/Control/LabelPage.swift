//
//  LabelPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/9.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct LabelPage: View {
    
    @AppStorage("MineIndex") var mineIndex: Int = 800
    
    var body: some View {
        ScrollView {
            
            Label("Your account", systemImage: "person.crop.circle")
                .padding()
            
            Label("Welcome to the app", image: "icon.calendar")
            
            Label("Your account", systemImage: "person.crop.circle")
                .font(.title)
            
            Label {
                Text("Paul Hudson")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 64, height: 64)
            }
            
            NavigationLink.init(destination: NewLable() ) {
                Text("label Destionation")
            }
        }
        .navigationBarTitle("Label Page")
        .onAppear {
            print("Index: \(mineIndex)")
            
            if mineIndex == 809 {
                mineIndex = 810
            }
        }
    }
}

struct LabelPage_Previews: PreviewProvider {
    static var previews: some View {
        LabelPage()
    }
}

struct NewLable: View {
    
    @AppStorage("MineIndex") var mineIndex: Int = 800
    
    var body: some View {
        VStack {
            Text("\(mineIndex)")
        }
        .onAppear {
            print("Index: \(mineIndex)")
        }
    }
    
}
