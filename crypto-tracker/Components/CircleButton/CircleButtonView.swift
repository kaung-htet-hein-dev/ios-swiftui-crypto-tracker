//
//  CircleButtonView.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 10/07/2025.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.title2)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding(0)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
            .colorScheme(.light)
        CircleButtonView(iconName: "plus")
            .colorScheme(.dark)
    }
    
}
