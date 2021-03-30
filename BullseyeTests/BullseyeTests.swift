//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Adam Garrett-Harris on 3/30/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
}
