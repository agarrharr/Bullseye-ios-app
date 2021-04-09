//
//  Game.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 3/30/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var bonus = 0
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        }
        return 100 - difference + bonus
    }
    
    func sliderValueRounded(value: Double) -> Int {
        Int(value.rounded())
    }
    
    private func amountOff(value: Int) -> Int {
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
    
    fileprivate mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
