//
//  WidgetPokemon.swift
//  WidgetPokemon
//
//  Created by Yasir Bilir on 28.01.2026.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    /// Ana uygulama ile aynı App Group (entitlements’taki ile birebir aynı).
    @AppStorage("pokemon", store: UserDefaults(suiteName: "group.com.yasir.PokemonWidget"))
    var pokemonData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), pokemon: .pikachu)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData), !pokemonData.isEmpty {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
            return entry
        } else {
            return SimpleEntry(date: Date(), configuration: configuration, pokemon: .pikachu)
        }
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData), !pokemonData.isEmpty {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
            return Timeline(entries: [entry], policy: .never)
        } else {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: .pikachu)
            return Timeline(entries: [entry], policy: .never)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let pokemon : Pokemon
}

struct WidgetPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        OzelGorselView(image: Image(entry.pokemon.gorselIsmi))
    }
}

struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "Widget Seçeneklerimiz"
        return intent
    }

    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "Örnek Widget Görünümü"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WidgetPokemon()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, pokemon: .pikachu)
    SimpleEntry(date: .now.addingTimeInterval(60), configuration: .starEyes, pokemon: .charmander)
}
