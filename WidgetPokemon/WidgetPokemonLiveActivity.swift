//
//  WidgetPokemonLiveActivity.swift
//  WidgetPokemon
//
//  Created by Yasir Bilir on 28.01.2026.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetPokemonAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        /// Canlı aktivite sırasında değişen durum (emoji vb.)
        var emoji: String
    }

    /// Aktivite boyunca sabit kalan özellikler
    var name: String
}

struct WidgetPokemonLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetPokemonAttributes.self) { context in
            // Kilit ekranı / bildirim alanı
            VStack {
                Text("Merhaba \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Sol")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Sağ")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Alt \(context.state.emoji)")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetPokemonAttributes {
    fileprivate static var preview: WidgetPokemonAttributes {
        WidgetPokemonAttributes(name: "Dünya")
    }
}

extension WidgetPokemonAttributes.ContentState {
    fileprivate static var smiley: WidgetPokemonAttributes.ContentState {
        WidgetPokemonAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetPokemonAttributes.ContentState {
         WidgetPokemonAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetPokemonAttributes.preview) {
   WidgetPokemonLiveActivity()
} contentStates: {
    WidgetPokemonAttributes.ContentState.smiley
    WidgetPokemonAttributes.ContentState.starEyes
}
