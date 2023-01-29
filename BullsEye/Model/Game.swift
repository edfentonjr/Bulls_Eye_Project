//
//  Game.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/17/22.
//

import Foundation
struct LeaderboardEntry{
let score: Int
let date: Date
}

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var LeaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestDate: Bool = false) {
        if loadTestDate {
            LeaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            LeaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            LeaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            LeaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            LeaderboardEntries.append(LeaderboardEntry(score: 150, date: Date()))
        }
    }
   
    
    func points(sliderValue: Int) -> Int{
    let difference = abs(self.target - sliderValue)
        let bonus: Int
        if difference == 0{
            bonus = 100}
        else if difference <= 2{
            bonus = 50
        }else {
            bonus = 0
        }
     return   100 - difference + bonus
        
}
    mutating func addToLeaderboard(point: Int){
        LeaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        LeaderboardEntries.sort{$0.score > $1.score}
        }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
        
    }
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1    }
}
