//
//  GameLogicProtocol.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation

protocol GameLogicProtocol {
    func startGame() -> GameEvent
    func reset()
    func registerTap(_ id: Int) -> GameEvent
    func advanceToNextRound() -> GameEvent
    var currentSequence: [Int] { get }
    var currentScore: Int { get }
}

