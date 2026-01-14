//
//  CandlesGrid.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import SwiftUI

struct CandlesGrid: View {
    let candles: [Candle]
    let isGameOver: Bool
    let onCandleTap: (Int) -> Void
    
    public var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 4){
            ForEach(candles){ candle in
                CandleButton(candle: candle){
                    onCandleTap(candle.id)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(.ultraThinMaterial.opacity(0.8))
            .stroke(Color.cyan ,lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .blur(radius: self.isGameOver ? 4 : 0)
    }
}


