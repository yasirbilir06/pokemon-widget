//
//  AppIntent.swift
//  WidgetPokemon
//
//  Created by Yasir Bilir on 28.01.2026.
//

import WidgetKit
import AppIntents

/// Widget yapılandırma niyeti: Ana ekranda seçilen Pokemon widget’ta gösterilir.
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Pokemon Widget" }
    static var description: IntentDescription { "Ana uygulamadan seçtiğiniz Pokemon widget’ta görünür." }

    @Parameter(title: "Favori Emoji", default: "😃")
    var favoriteEmoji: String
}
