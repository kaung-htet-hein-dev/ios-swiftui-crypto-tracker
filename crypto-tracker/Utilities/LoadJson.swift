//
//  LoadJson.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 17/07/2025.
//

import Foundation

func loadJSON<T: Decodable>(_ filename: String) -> T {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Couldn't load data from \(filename).")
    }
    
    let decoder = JSONDecoder()
    guard let loaded = try? decoder.decode(T.self, from: data) else {
        fatalError("Couldn't parse \(filename) as \(T.self).")
    }
    
    return loaded
}
