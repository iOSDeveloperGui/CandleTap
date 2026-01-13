//
//  HeaderSection.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation
import SwiftUI

struct HeaderSection: View{
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View{
        HStack{
            Text("Score: \(viewModel.score)")
            
            Spacer()
            
            Text("Best: \(viewModel.highScore)")
                .foregroundColor(.gray)
        }
        .font(.system(size: 20, weight: .bold, design: .monospaced))
    }
}
