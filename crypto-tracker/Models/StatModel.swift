//
//  StatModel.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 15/07/2025.
//

import Foundation

struct StatModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

let newModel = StatModel(title: "Bitcoin", value: "123456", percentageChange: 12.34)
let newModel2 = StatModel(title: "Ethereum", value: "654321")
