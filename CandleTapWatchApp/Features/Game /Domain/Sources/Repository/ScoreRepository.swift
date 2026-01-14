//
//  ScoreRepository.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation

class ScoreRepository: ScoreRepositoryProtocol{
    private let key = "candle_tap_high_score"
    
    func getHighScore() -> Int {
        UserDefaults.standard.integer(forKey: key)
    }
    
    func saveHighScore(_ score: Int) {
        let highScore = getHighScore()
        if score > highScore{
            UserDefaults.standard.set(score, forKey: key)
        }
    }
    
    
}
