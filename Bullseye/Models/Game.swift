//
//  Game.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 3/30/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let maximumScore = 100
        let difference = abs(target - sliderValue)
        var bonus = 0
        if difference == 0 {
            bonus = 100
        }
//        else if difference == 1 {
//            bonus = 50
//        } else {
//            bonus = 0
//        }
        return maximumScore - difference + bonus
    }
    
    func sliderValueRounded(value: Double) -> Int {
        Int(value.rounded())
    }
    
    func amountOff(value: Int) -> Int {
        abs(target - value)
    }
    
    func alertTitle(sliderValue: Double) -> String {
        let difference = amountOff(value: sliderValueRounded(value: sliderValue))

        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if  difference < 5 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
}
