//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by FENTON, EDWARD F on 3/18/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score =  game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score =  game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    func testNewRound (){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    func testScoreExact() {
        let guess = game.target
        let score =  game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    func testScoreClose() {
        let guess = game.target - 2
        let score =  game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    func testRestart (){
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    func testLeaderBoard (){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.LeaderboardEntries.count, 1)
        XCTAssertEqual(game.LeaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.LeaderboardEntries.count, 2)
        XCTAssertEqual(game.LeaderboardEntries[0].score, 200)
        XCTAssertEqual(game.LeaderboardEntries[1].score, 100)    }
}
