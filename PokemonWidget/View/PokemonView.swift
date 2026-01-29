//
//  PokemonView.swift
//  PokemonWidget
//
//  Created by Yasir Bilir on 28.01.2026.
//

import SwiftUI

/// Tek bir Pokemon satırı: görsel, isim ve tür.
struct PokemonView: View {
    let pokemon: Pokemon

    var body: some View {
        HStack(spacing: 16) {
            OzelGorselView(image: Image(pokemon.gorselIsmi))
                .frame(width: 100, height: 100)

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text(pokemon.isim)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.yellow)
                Text(pokemon.tur)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonView(pokemon: .pikachu)
}
