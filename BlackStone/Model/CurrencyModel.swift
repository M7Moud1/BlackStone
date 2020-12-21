//
//  CurrencyModel.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import Foundation

// MARK: - CurrencyModel
struct CurrencyModel: Codable {
    var success: Bool?
    var timestamp: Int?
    var base, date: String?
    var rates: [String: Double]?
}
