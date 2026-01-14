//
//  CandleViewModel.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import SwiftUI
import Combine
import WatchKit

@MainActor
class GameViewModel: ObservableObject{
    @Published var candles: [Candle] = (0...3).map { Candle(id: $0) }
    @Published var score: Int = 0
    @Published var highScore: Int = 0
    @Published var currentState: GameState = .idle
    @Published var selectedCharacter: CandleCharacter? = nil
    @Published var showPlusOne: Bool = false
    @Published var gameMessage: String = "Ready?"
    
    var gameLogic: GameLogicProtocol
    var scoreRepo: ScoreRepositoryProtocol
    
    let skins = [
        CandleCharacter(name: "Amber", color: Color.orange, glowColor: .yellow, image: "character1"),
        CandleCharacter(name: "Phantom", color: Color.cyan, glowColor: .blue, image: "character2"),
        CandleCharacter(name: "Void", color: Color.purple, glowColor: .pink, image: "character3")
    ]
    
    init(gameLogic: GameLogicProtocol, scoreRepo: ScoreRepositoryProtocol){
        self.gameLogic = gameLogic
        self.scoreRepo = scoreRepo
        self.highScore = scoreRepo.getHighScore()
    }

    func startGame() async{
        let event = gameLogic.startGame()
        score = 0
        await handle(event: event)
    }
    
    private func handle(event: GameEvent) async{
        switch event {
            case .showSequence(let sequence):
                await playSequence(sequence: sequence)
            
        case .awaitingInput:
            currentState = .awaitingInput
            gameMessage = "Your turn! 🕯️"
            
        case .roundCompleted(let newScore, let newSequence):
            await triggerPlusOne()
            score = newScore
            if score > highScore{
                highScore = score
                scoreRepo.saveHighScore(highScore)
            }
            currentState = .showingSequence
            gameMessage = "Great! Next round…"
            Task {
                do{
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    await handle(event: .showSequence(newSequence))
                }
            }
            
        case .gameOver:
            currentState = .gameOver
            gameMessage = "Game Over!"
            WKInterfaceDevice.current().play(.failure)
        }
    }
    
    func candleTapped(id: Int) async{
        guard currentState == .awaitingInput else { return }
        
        Task { await flashCandle(id: id) }
        
        let event = gameLogic.registerTap(id)
        await handle(event: event)
    }
    
    private func playSequence(sequence: [Int]) async{
        currentState = .showingSequence
        gameMessage = "Pay Attention! 👁️"
        
        Task{
            do{
                try await Task.sleep(nanoseconds: 400_000_000)
                
                for candleId in sequence{
                    withAnimation(.easeInOut(duration: 0.4)){
                        candles[candleId].isLit = true
                    }
                    
                    try await Task.sleep(nanoseconds: 400_000_000)
                    
                    withAnimation(.easeInOut(duration: 0.4)){
                        candles[candleId].isLit = false
                    }
                    
                    try await Task.sleep(nanoseconds: 400_000_000)
                }
                await handle(event: .awaitingInput(progress: 0, required: sequence.count))
                
            } catch{
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func flashCandle(id: Int) async{
        guard let index = candles.firstIndex(where: { $0.id == id}) else { return }
        
        withAnimation(.easeInOut(duration: 0.4)){
            candles[index].isLit = true
        }
        
        do{
            try await Task.sleep(nanoseconds: 200_000_000)
            withAnimation(.easeInOut(duration: 0.2)){
                candles[index].isLit = false
            }
            
        } catch{
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func triggerPlusOne() async{
        withAnimation(.easeIn(duration: 0.8)){
            showPlusOne = true
        }
        
        do{
            try await Task.sleep(nanoseconds: 800_000_000)
            withAnimation(.easeInOut(duration: 0.6)){
                showPlusOne = false                
            }
        } catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}

