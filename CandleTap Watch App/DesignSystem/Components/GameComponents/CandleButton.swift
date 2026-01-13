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
                    .stroke(candle.isLit ? Color.cyan : Color.gray.opacity(0.4), lineWidth: 2)
                    .frame(width: 70, height: 70)
                    .shadow(color: Color.cyan.opacity(candle.isLit ? 1: 0) ,radius: 8)
                
                Image("magicCandle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42)
                    .brightness(candle.isLit ? 0.4 : 0)
            }
        }
        .buttonStyle(.plain)
    }
}
