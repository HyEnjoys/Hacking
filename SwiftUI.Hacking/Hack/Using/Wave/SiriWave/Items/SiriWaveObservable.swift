//
//  Observable.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

class SiriWaveObservable: ObservableObject {
    
    @Published var waves = Array(repeating: Wave.random(withPower: 0), count: 3)
    
    func update(num: Int, power: CGFloat) {
        waves = (0..<num).map { _ in Wave.random(withPower: power) }
    }
    
}

