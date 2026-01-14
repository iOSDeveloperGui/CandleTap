//
//  MessageGame.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import SwiftUI

struct MessageGame: View {
    let message: String
    
    var body: some View {
        Text(self.message)
            .font(.system(size: 12, weight: .light, design: .rounded))
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .background(Capsule()
                .fill(.ultraThinMaterial)
            )
            .opacity(self.message.isEmpty ? 0 : 1)
            .animation(.easeInOut, value: self.message)
            .zIndex(20)
    }
}

