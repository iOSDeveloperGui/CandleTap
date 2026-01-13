//
//  SheetView.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation
import SwiftUI

struct WelcomeSheetView: View{
    let sheetInformation: SheetInformation
    
    var body: some View{
        VStack(spacing: 12){
            InstructionRow(sheetInformation: sheetInformation)
        }
    }
}

#Preview {
    SheetView(sheetInformation: SheetInformation(icon: "pencil", color: Color.yellow, title: "Welcome to", description: "adsksaksdakdask"))
}
