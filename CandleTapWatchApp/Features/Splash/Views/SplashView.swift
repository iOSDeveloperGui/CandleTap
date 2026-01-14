//
//  SplashView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 09/01/26.
//

import Foundation
import SwiftUI

struct SplashView: View{
    @State var isAnimate: Bool = false
    @ObservedObject var viewModel: GameViewModel
    var onComplete: () -> Void 
    
    var body: some View{
        VStack(spacing: 0){
            Image("candleTapLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 152)
                .scaleEffect(isAnimate ? 1 : 0)
            
            ProgressView()
                .tint(Color.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
        .onAppear{
            withAnimation(.bouncy(duration: 1.4)){
                isAnimate = true
            }
        }
        .task{
            do{
                try await Task.sleep(nanoseconds: 3_000_000_000)
                onComplete()
            } catch{
                print("Error: \(error.localizedDescription)")
            }
            
        }
    }
}
