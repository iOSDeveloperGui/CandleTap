//
//  GameLogicProtocol.swift
//  CandleTap Watch App
//
//  Created by iOS Developer on 08/01/26.
//

import Foundation

protocol GameLogicProtocol{
    func generateNextSequence(current: [Int]) -> [Int]
    func verifyTap(index: Int, userChoice: Int, sequence: [Int]) -> Bool
}
