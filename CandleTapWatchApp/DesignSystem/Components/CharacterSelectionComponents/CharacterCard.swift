//
//  CharacterCard.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 13/01/26.
//

import SwiftUI

struct CharacterCard: View {
    let skin: CandleCharacter
    let isSelected: Bool
    var onSelected: () -> Void
    
    var body: some View {
        Button(action: {
            onSelected()
        }){
            Image(skin.image)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 80)
                .clipShape(Capsule())
                .padding(.all, 4)
                .overlay(
                    Capsule()
                        .stroke(lineWidth: 4)
                        .fill(isSelected ? skin.color : Color.gray.opacity(0.4))
                        .shadow(color: isSelected ? skin.glowColor : Color.clear, radius: 8)
                )
                .scaleEffect(isSelected ? 1.05 : 0.95)
        }
        .buttonStyle(.plain)
    }
}
