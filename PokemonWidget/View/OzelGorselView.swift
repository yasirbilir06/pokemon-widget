//
//  OzelGorselView.swift
//  PokemonWidget
//
//  Created by Yasir Bilir on 28.01.2026.
//

import SwiftUI

/// Pokemon görseli: yuvarlak çerçeve, turuncu kenarlık ve gölge.
struct OzelGorselView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.orange, lineWidth: 8))
            .shadow(radius: 10)
    }
}

#Preview {
    OzelGorselView(image: Image("pikachu"))
}
