//
//  XMarkButton.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 16/07/2025.
//

import SwiftUI

struct XMarkButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMarkButton(action: {})
}
