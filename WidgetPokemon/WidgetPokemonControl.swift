//
//  WidgetPokemonControl.swift
//  WidgetPokemon
//
//  Created by Yasir Bilir on 28.01.2026.
//

import AppIntents
import SwiftUI
import WidgetKit

struct WidgetPokemonControl: ControlWidget {
    static let kind: String = "com.yasir.PokemonWidget.WidgetPokemon"

    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: Self.kind,
            provider: Provider()
        ) { value in
            ControlWidgetToggle(
                "Zamanlayıcıyı Başlat",
                isOn: value.isRunning,
                action: StartTimerIntent(value.name)
            ) { isRunning in
                Label(isRunning ? "Açık" : "Kapalı", systemImage: "timer")
            }
        }
        .displayName("Zamanlayıcı")
        .description("Zamanlayıcıyı açıp kapatabileceğiniz kontrol widget’ı.")
    }
}

extension WidgetPokemonControl {
    struct Value {
        var isRunning: Bool
        var name: String
    }

    struct Provider: AppIntentControlValueProvider {
        func previewValue(configuration: TimerConfiguration) -> Value {
            WidgetPokemonControl.Value(isRunning: false, name: configuration.timerName)
        }

        func currentValue(configuration: TimerConfiguration) async throws -> Value {
            let isRunning = true // Check if the timer is running
            return WidgetPokemonControl.Value(isRunning: isRunning, name: configuration.timerName)
        }
    }
}

struct TimerConfiguration: ControlConfigurationIntent {
    static let title: LocalizedStringResource = "Zamanlayıcı Adı"

    @Parameter(title: "Zamanlayıcı Adı", default: "Zamanlayıcı")
    var timerName: String
}

struct StartTimerIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Zamanlayıcıyı başlat"

    @Parameter(title: "Zamanlayıcı Adı")
    var name: String

    @Parameter(title: "Zamanlayıcı çalışıyor")
    var value: Bool

    init() {}

    init(_ name: String) {
        self.name = name
    }

    func perform() async throws -> some IntentResult {
        // Start the timer…
        return .result()
    }
}
