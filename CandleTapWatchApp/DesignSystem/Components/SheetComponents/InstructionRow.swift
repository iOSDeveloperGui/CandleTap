//
//  InstructionRow.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import SwiftUI

struct InstructionRow: View {
    let sheetInformation: SheetInformation
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: sheetInformation.icon)
                .foregroundStyle(sheetInformation.color)
                .font(.system(size: 16))
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4){
                Text(sheetInformation.title)
                    .font(.caption)
                    .bold()
                Text(sheetInformation.description)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}


