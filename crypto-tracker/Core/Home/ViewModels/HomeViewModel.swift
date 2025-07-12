//
//  HomeViewModel.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 12/07/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var profolioCoins: [CoinModel] = []
    
    init() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(MockData.shared.coin)
            self.profolioCoins.append(MockData.shared.coin)
        }
    }
}
