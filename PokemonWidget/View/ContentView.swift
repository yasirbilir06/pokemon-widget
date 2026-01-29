//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Yasir Bilir on 28.01.2026.
//

import SwiftUI
import WidgetKit

/// Ana ekran: Seçilen Pokemon widget’a gönderilir.
struct ContentView: View {
    /// Entitlements’taki App Group ile birebir aynı olmalı.
    private static let appGroup = "group.com.yasir.PokemonWidget"
    private static let storageKey = "pokemon"
    private static let widgetKind = "WidgetPokemon"

    @AppStorage(storageKey, store: UserDefaults(suiteName: appGroup))
    private var pokemonData: Data = Data()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(Pokemon.tumPokemonlar) { pokemon in
                    PokemonView(pokemon: pokemon)
                        .onTapGesture {
                            secilenPokemonuKaydet(pokemon: pokemon)
                        }
                }
            }
            .padding()
        }
    }

    /// Seçilen Pokemon’u App Group’a yazar ve widget zaman çizelgesini yeniler.
    private func secilenPokemonuKaydet(pokemon: Pokemon) {
        guard let data = try? JSONEncoder().encode(pokemon) else { return }
        pokemonData = data
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}

#Preview {
    ContentView()
}
