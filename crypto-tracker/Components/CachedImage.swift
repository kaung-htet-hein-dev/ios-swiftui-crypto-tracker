//
//  CachedImage.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 16/07/2025.
//

import SwiftUI
import Kingfisher

struct CachedImage: View {
    var url: String
    
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    CachedImage(url: MockData.shared.coin.image)
}
