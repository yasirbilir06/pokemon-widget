//
//  Pokemon.swift
//  PokemonWidget
//
//  Created by Yasir Bilir on 28.01.2026.
//

import Foundation

/// Widget ve ana uygulama arasında paylaşılan Pokemon modeli.
struct Pokemon: Identifiable, Codable, Hashable {
    let gorselIsmi: String
    let isim: String
    let tur: String

    var id: String { gorselIsmi }
}

// MARK: - Örnek veriler

extension Pokemon {
    static let pikachu = Pokemon(
        gorselIsmi: "pikachu",
        isim: "Pikachu",
        tur: "Mouse Pokemon"
    )
    static let charmander = Pokemon(
        gorselIsmi: "charmander",
        isim: "Charmander",
        tur: "Lizard Pokemon"
    )
    static let ball = Pokemon(
        gorselIsmi: "ball",
        isim: "Ball",
        tur: "Ball Pokemon"
    )

    /// Widget’ta listelenecek tüm Pokemon’lar.
    static let tumPokemonlar: [Pokemon] = [.pikachu, .charmander, .ball]
}
