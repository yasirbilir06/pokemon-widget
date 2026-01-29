//
//  WidgetPokemonBundle.swift
//  WidgetPokemon
//
//  Created by Yasir Bilir on 28.01.2026.
//

import WidgetKit
import SwiftUI

@main
struct WidgetPokemonBundle: WidgetBundle {
    var body: some Widget {
        WidgetPokemon()
        WidgetPokemonControl()
        WidgetPokemonLiveActivity()
    }
}
