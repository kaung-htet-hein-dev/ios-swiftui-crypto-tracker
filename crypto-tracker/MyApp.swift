//
//  crypto_trackerApp.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 10/07/2025.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
