//
//  PortfolioView.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 16/07/2025.
//

import SwiftUI
import Kingfisher

struct PortfolioView: View {
    @Binding var showPortfolioView: Bool
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBarView(searchText: $homeViewModel.searchText)
                
                CoinListView
                
                if selectedCoin != nil {
                    portfolioInputSection
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton(action: {
                        showPortfolioView = false
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark")
                            .opacity(showCheckmark ? 1.0 : 0.0)
                        
                        Button(action: {
                            saveButtonPressed()
                        }, label: {
                            Text("Save".uppercased())
                        })
                        .opacity(
                            (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ?
                            1.0 : 0.0
                        )
                    }
                    .font(.headline)
                    
                }
            })
        }
    }
}

extension PortfolioView {
    private func saveButtonPressed() {
        guard let coin = selectedCoin else { return }
        
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showCheckmark = false
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        homeViewModel.searchText = ""
    }
    
    private var CoinListView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(isPreview ? MockData.shared.coinList : homeViewModel.allCoins) { coin in
                    
                    VStack {
                        CachedImage(url: coin.image)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.top, 10)
                        
                        Text(coin.symbol.uppercased())
                            .font(.headline)
                        
                        Text(coin.name)
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.theme.secondaryText)
                    }
                    .frame(width: 100)
                    .onTapGesture(perform: {
                        withAnimation(.easeIn) {
                            selectedCoin = coin
                        }
                    })
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                    )
                    
                }
            }
            .padding(.leading)
        }
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .padding()
        .font(.headline)
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
}

#Preview {
    PortfolioView(showPortfolioView: .constant(false))
        .environmentObject(HomeViewModel())
}
