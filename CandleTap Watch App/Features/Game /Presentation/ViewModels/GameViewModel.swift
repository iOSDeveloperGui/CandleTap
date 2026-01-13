//
//  CandleViewModel.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import SwiftUI
import Combine

@MainActor
class CandleViewModel: ObservableObject{
    @Published var candles: [Candle] = []
    @Published var score: Int = 0
    @Published var currentState: GameState = .idle
    
    private var gameLogic: GameLogicUseCase
    private var scoreRepo: ScoreRepositoryProtocol
    private var sequence: [Int] = []
    
    init(gameLogic: GameLogicUseCase, scoreRepo: ScoreRepositoryProtocol){
        self.gameLogic = gameLogic
        self.scoreRepo = scoreRepo
    }
    
    func startGame(){
        sequence = gameLogic.generateNextSequence(current: [])
        playSequence()
    }
    
    func playSequence(){
        currentState = .showingSequence
        
        Task{
            do{
                try await Task.sleep(nanoseconds: 800_000_000)
                
                for candleId in sequence{
                    withAnimation(.easeInOut(duration: 0.2)){
                        candles[candleId].isLit = true
                    }
                    
                    try await Task.sleep(nanoseconds: 600_000_000)
                    
                    withAnimation(.easeInOut(duration: 0.2)){
                        candles[candleId].isLit = false
                    }
                    
                    try await Task.sleep(nanoseconds: 400_000_000)
                }
                currentState = .awaitingInput
                
            } catch{
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
