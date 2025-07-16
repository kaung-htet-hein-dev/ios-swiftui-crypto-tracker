//
//  SwiftUIView.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 15/07/2025.
//

import SwiftUI

struct HomeStatView: View {
    @Binding var showStats: Bool
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HStack {
            ForEach(homeViewModel.stats) { stat in
                StatView(stat: stat)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    HomeStatView(showStats: .constant(true))
        .environmentObject(MockData.shared.homeViewModel)
}
