//
//  HomeView.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 10/07/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                homeView
                
                columnTitle
                
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .padding(.horizontal, 20)
                
                if !showPortfolio {
                    allCoinList
                } else {
                    profolioCoinList
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
    .environmentObject(MockData.shared.homeViewModel)
}

extension HomeView {
    private var homeView: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Crypto Tracker")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal, 20)
    }
    
    private var allCoinList: some View {
        List {
            ForEach(homeViewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: showPortfolio)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .leading))
    }
    
    private var profolioCoinList: some View {
        List {
            ForEach(homeViewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: showPortfolio)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .trailing))
    }
    
    private var columnTitle: some View {
        HStack {
            Text("Coin")
            Spacer()
            
            if(showPortfolio) {
                Text("Holdings")
                    
            }

            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
    }
}
