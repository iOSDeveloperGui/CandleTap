//
//  GameEvent.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 09/01/26.
//

import Foundation

enum GameEvent: Equatable {
    case showSequence([Int])
    case awaitingInput(progress: Int, required: Int)
    case roundCompleted(newScore: Int, newSequence: [Int])
    case gameOver(finalScore: Int)
}

