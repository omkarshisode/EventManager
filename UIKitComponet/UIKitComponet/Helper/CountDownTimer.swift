//
//  CountDownTimer.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 21/01/25.
//

import Foundation

class CountDownTimer {
    private var timer: Timer?
    private var secondRemaning: Int

    
    init(secondRemaning: Int) {
        self.secondRemaning = secondRemaning
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: <#T##TimeInterval#>, repeats: <#T##Bool#>, block: <#T##(Timer) -> Void#>)
    }
 }
