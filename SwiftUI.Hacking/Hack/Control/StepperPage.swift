//
//  StepperPage.swift
//  SwiftUI.lists
//
//  Created by Enjoy on 2019/7/26.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct StepperPage: View {
    @State var quantity: Int = 0
    
    var body: some View {
        VStack {
            Stepper(value: $quantity, in: 0...10, label: {
                Text("Quantity \(quantity)")
            }).padding()
            
            Stepper("Quantity \(quantity)", value: $quantity, in: 0...10).padding()
            
            Stepper(onIncrement: {
                self.quantity += 2
            }, onDecrement: {
                self.quantity -= 2
            }, label: { Text("Quantity \(quantity)") })
                .padding()
        }
    }
}

#if DEBUG
struct StepperPage_Previews: PreviewProvider {
    static var previews: some View {
        StepperPage()
    }
}
#endif
