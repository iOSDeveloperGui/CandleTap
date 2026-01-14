//
//  HeaderSection.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation
import SwiftUI

struct HeaderSection: View{
    let score: Int
    let selectedCharacter: CandleCharacter?
    let isHighlighting: Bool
    
    var body: some View{
        HStack(spacing: 8){
            
            if let character = self.selectedCharacter{
                Image(character.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(character.color, lineWidth: 1))
                    .scaleEffect(self.isHighlighting ? 1.2 : 1.0)
            }
            
            Text("Score: \(self.score)")
                .font(.system(size: 8, weight: .semibold, design: .monospaced))
                .foregroundColor(self.isHighlighting ? Color.green : Color.primary)
                .shadow(color: self.isHighlighting ? Color.green : Color.primary, radius: self.isHighlighting ? 2.0 : 0)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(.ultraThinMaterial)
            .stroke(self.selectedCharacter?.color ?? Color.white ,lineWidth: 1)
        )
    }
}
