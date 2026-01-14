//
//  ScoreRepositoryProtocol.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation

protocol ScoreRepositoryProtocol{
    func getHighScore() -> Int
    func saveHighScore(_ score: Int)
}
