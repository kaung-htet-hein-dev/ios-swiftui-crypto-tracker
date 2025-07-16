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
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBarView(searchText: $homeViewModel.searchText)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(homeViewModel.allCoins) { coin in
                            
                            VStack {
                                CachedImage(url: coin.image)
//                                    .placeholder {
//                                        Image(systemName: "photo")
//                                            .foregroundColor(.gray)
//                                            .frame(width: 50, height: 50)
//                                    }
//                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.top, 10)
                                        
                                Text(coin.symbol.uppercased())
                                    .font(.headline)
                                
                                Text(coin.name)
                                    .lineLimit(1)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(Color.theme.secondaryText)
                            }
                            .frame(width: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.theme.secondaryText, lineWidth: 1)
                            )
                           
                        }
                    }
                    .padding(.leading)
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton(action: {
                        showPortfolioView = false
                    })
                }
            })
        }
    }
}

#Preview {
    PortfolioView(showPortfolioView: .constant(false))
        .environmentObject(HomeViewModel())
}
