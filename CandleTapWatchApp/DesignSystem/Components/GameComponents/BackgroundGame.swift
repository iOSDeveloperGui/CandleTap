//
//  BackgroundGame.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import SwiftUI

struct BackgroundGame: View {
    var body: some View {
        Image(.candleTapbg)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .opacity(1)
    }
}

#Preview {
    BackgroundGame()
}
