//
//  CharactersTabView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import SwiftUI

struct CharactersTabView: View {
    @ObservedObject var viewmodel: GameViewModel
    var onSelected: () -> Void
    
    var body: some View {
        VStack(spacing: 0){
            Text("Select your candle to start")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .padding(.vertical, 8)
            
            GeometryReader{ geo in
                TabView{
                    ForEach(viewmodel.skins){ skin in
                        VStack(spacing: 4){
                            CharacterCard(skin: skin, isSelected: viewmodel.selectedCharacter?.id == skin.id){
                                withAnimation(.spring(.smooth)){
                                    viewmodel.selectedCharacter = skin
                                }
                            }
                            
                            Text(skin.name)
                                .font(.caption2)
                                .foregroundStyle(viewmodel.selectedCharacter?.id == skin.id ? Color.white : Color.secondary)
                                .padding(.bottom, 16)
                        }
                        .frame(width: geo.size.width * 0.8)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
            }
            .frame(height: 120)
            
            Spacer(minLength: 4)
            
            Button(action: {
                onSelected()
            }, label:{
                Text("Start")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .tint(viewmodel.selectedCharacter?.color ?? .gray)
            .disabled(viewmodel.selectedCharacter == nil)
            .padding([.vertical, .horizontal], 8)
        }
    }
}

