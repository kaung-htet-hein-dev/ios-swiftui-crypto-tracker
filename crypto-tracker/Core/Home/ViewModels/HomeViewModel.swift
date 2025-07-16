//
//  HomeViewModel.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 12/07/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var profolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var stats: [StatModel] = [
        StatModel(title: "Bitcoin", value: "$30,000", percentageChange: 2.5),
        StatModel(title: "Ethereum", value: "$2,000", percentageChange: -1.2),
        StatModel(title: "Litecoin", value: "$150")
    ]
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        subscribe()
    }
    
    private func subscribe() {
        //        dataService.$allCoins
        //            .sink { [weak self] (returnedCoins) in
        //                self?.allCoins = returnedCoins
        //            }
        //            .store(in: &cancellables)
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .map { (text, coins) -> [CoinModel] in
                guard !text.isEmpty else {
                    return coins
                }
                
                let lowercasedText = text.lowercased()
                
                return coins.filter { coin -> Bool in
                    return coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText)
                }
            }
            .sink { coins in
                self.allCoins = coins
            }
            .store(in: &cancellables)
    }
}
