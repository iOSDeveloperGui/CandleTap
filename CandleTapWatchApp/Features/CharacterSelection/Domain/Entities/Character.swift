//
//  Character.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 12/01/26.
//

import Foundation
import SwiftUI

struct CandleCharacter: Identifiable, Equatable{
    let id = UUID()
    let name: String
    let color: Color
    let glowColor: Color
    let image: String
}

