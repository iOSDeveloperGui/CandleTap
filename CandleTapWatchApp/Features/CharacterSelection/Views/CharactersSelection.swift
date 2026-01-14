//
//  CharactersSelection .swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import SwiftUI

struct CharactersSelection: View {
    @ObservedObject var viewmodel: GameViewModel
    var onSelected: () -> Void
    
    var body: some View {
        VStack(spacing: 0){
            CharactersTabView(viewmodel: viewmodel){
                onSelected()
            }
        }
        .preferredColorScheme(ColorScheme.dark)
    }
}


