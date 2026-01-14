//
//  CandleTapApp.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import SwiftUI

@main
struct CandleTapWatchAppApp: App {
    private let gameLogic = GameLogicUseCase()
    private let scoreRepo = ScoreRepository()
    
    var body: some Scene {
        WindowGroup {
            MainContainerView(gameLogic: self.gameLogic, scoreRepo: self.scoreRepo)
        }
    }
}
