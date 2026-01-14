//
//  CandleButton.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation
import SwiftUI

struct CandleButton: View{
    let candle: Candle
    let action: () -> Void
    
    var body: some View{
        Button(action: action){
            ZStack{
                Circle()
                    .stroke(candle.isLit ? Color.cyan : Color.gray.opacity(0.4), lineWidth: 1)
                    .background(
                        Circle()
                            .fill(candle.isLit ? Color.cyan.opacity(0.4) : Color.clear)
                            .shadow(color: candle.isLit ? Color.cyan.opacity(0.4) : Color.clear, radius: 4)
                    )
                    .frame(width: 60, height: 60)
                    
                Image(.magicCandle)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .brightness(candle.isLit ? 0.8 : 0)
                    .shadow(color: candle.isLit ? .cyan : .clear, radius: 10)
                    .scaleEffect(candle.isLit ? 1.4 : 1.0)
            }
        }
        .buttonStyle(.plain)
    }
}
