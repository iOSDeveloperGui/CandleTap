//
//  GameView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewmodel: GameViewModel
    
    init(viewmodel: GameViewModel) {
        _viewmodel = StateObject(wrappedValue: viewmodel)
    }
    
    var body: some View {
        ZStack{
            BackgroundGame()
            
            VStack(spacing: 4){
                Spacer()
                
                HeaderSection(score: viewmodel.score, selectedCharacter: viewmodel.selectedCharacter, isHighlighting: viewmodel.showPlusOne)
                
                CandlesGrid(candles: viewmodel.candles, isGameOver: viewmodel.currentState == .gameOver){ tappedID in
                    Task { await viewmodel.candleTapped(id: tappedID) }
                }

                MessageGame(message: self.viewmodel.gameMessage)
                
                Spacer()
            }
        }
        .overlay{
            GameOverView(viewModel: self.viewmodel)
        }
    }
}

#Preview {
    GameView(viewmodel: GameViewModel(gameLogic: GameLogicUseCase(), scoreRepo: ScoreRepository()))
}
