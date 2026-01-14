//
//  GameLogicUseCase.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation

final class GameLogicUseCase: GameLogicProtocol {
    private(set) var currentSequence: [Int] = []
    private(set) var currentScore: Int = 0
    private var userProgressIndex: Int = 0
    private let candleRange: ClosedRange<Int> = 0...3
    
    func startGame() -> GameEvent {
        reset()
        currentSequence = appendRandom(to: [])
        return .showSequence(currentSequence)
    }
    
    func reset() {
        currentSequence = []
        currentScore = 0
        userProgressIndex = 0
    }
       
    func registerTap(_ id: Int) -> GameEvent {
        guard !currentSequence.isEmpty else {
            return .gameOver(finalScore: currentScore)
        }
        
        if id == currentSequence[userProgressIndex] {
            userProgressIndex += 1
            
            if userProgressIndex == currentSequence.count {
                currentScore += 1
                
                currentSequence = appendRandom(to: currentSequence)
                userProgressIndex = 0
                return .roundCompleted(newScore: currentScore, newSequence: currentSequence)
            } else {
                return .awaitingInput(progress: userProgressIndex, required: currentSequence.count)
            }
        } else {
            let final = currentScore
            reset()
            return .gameOver(finalScore: final)
        }
    }
    
    func advanceToNextRound() -> GameEvent {
        return .showSequence(currentSequence)
    }
    
    private func appendRandom(to sequence: [Int]) -> [Int] {
        var new = sequence
        new.append(Int.random(in: candleRange))
        return new
    }
}

