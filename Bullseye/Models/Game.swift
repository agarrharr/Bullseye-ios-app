//
//  Game.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 3/30/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Double) -> Int {
        let maximumScore = 100
        let difference = amountOff(value: sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func sliderValueRounded(value: Double) -> Int {
        Int(value.rounded())
    }
    
    func amountOff(value: Double) -> Int {
        abs(target - sliderValueRounded(value: value))
    }
}
