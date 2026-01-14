//
//  SheetView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation
import SwiftUI

struct WelcomeSheetView: View{
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) private var dismiss
    var onStart: () -> Void
    
    var body: some View{
        VStack{
            Text("How to play")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 12){
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 12){
                        InstructionRow(sheetInformation: SheetInformation(icon: "eye.fill", color: .purple, title: "Watch", description: "Memorize the sequence as candles ignite."))
                        
                        InstructionRow(sheetInformation: SheetInformation(icon: "hand.tap.fill", color: .cyan, title: "Repeat", description: "Tap the candles in the exact same order."))
                        
                        InstructionRow(sheetInformation: SheetInformation(icon: "flame", color: .orange, title: "Choose", description: "Pick a unique light that matches your style."))
                    }
                    .padding([.horizontal, .vertical], 8)
                    
                    Button(action: {
                        onStart()
                    }, label: {
                        Text("Continue")
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.glass)
                    .tint(.purple)
                    .padding([.horizontal, .vertical], 16)
                    
                }
                
            }
            
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
}



