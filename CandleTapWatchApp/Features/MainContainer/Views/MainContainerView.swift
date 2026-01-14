//
//  MainContainerView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import Foundation
import SwiftUI

struct MainContainerView: View{
    @StateObject private var viewModel: GameViewModel
    @State private var flowState: Screens = .splash
    
    init(gameLogic: GameLogicUseCase, scoreRepo: ScoreRepository){
        _viewModel = StateObject(wrappedValue: GameViewModel(gameLogic: gameLogic, scoreRepo: scoreRepo))
    }
    
    var body: some View{
        ZStack{
            switch flowState{
            case .splash:
                SplashView(viewModel: viewModel){
                    withAnimation(.easeInOut){
                        flowState = .onboarding
                    }
                }
                
            case .onboarding:
                WelcomeSheetView(viewModel: viewModel){
                    withAnimation(.easeInOut){
                        flowState = .characterSelection
                    }
                    Task{ await viewModel.startGame() }
                }
                
            case .game:
                GameView(viewmodel: viewModel)
                    .transition(.opacity)
                
            case .characterSelection:
                CharactersSelection(viewmodel: viewModel){
                    withAnimation { flowState = .game }
                    Task {
                        await viewModel.startGame()
                    }
                }
            
            }
            
        }
    }
}

#Preview {
    MainContainerView(gameLogic: GameLogicUseCase(), scoreRepo: ScoreRepository())
}
