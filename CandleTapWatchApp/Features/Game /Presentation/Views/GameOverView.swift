//
//  GameOverView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 10/01/26.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        if viewModel.showPlusOne{
            Text("+1")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(.green)
                .padding([.horizontal, .vertical], 8)
                .background(Capsule()
                    .fill(Color.darkPurple)
                )
                .shadow(color: .green, radius: 4)
                .transition(.asymmetric(
                    insertion: .scale.combined(with: .opacity),
                    removal: .move(edge: .top).combined(with: .opacity)
                ))
                .zIndex(24)
        }
        
        if viewModel.currentState == .gameOver || viewModel.currentState == .idle{
            VStack(spacing: 12){
                if viewModel.currentState == .gameOver{
                    Text("You lose: \(viewModel.score)")
                        .font(.headline)
                }
                Button(action: {
                    Task { await viewModel.startGame() } 
                }, label: {
                    Text(viewModel.currentState == .idle ? "Start Game" : "Try Again")
                        .bold()
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.glass)
                .tint(.cyan)
                .padding(.horizontal, 20)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

