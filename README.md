# Pokémon Widget

An iOS home screen widget: the Pokémon you select in the app appears on the widget.

## What does it do?

- **Main app:** You tap one of Pikachu, Charmander, or Ball.
- **Widget:** The last Pokémon you tapped is shown on the home screen widget.
- **Sharing:** The app and widget use the same data via an App Group, so the widget updates as soon as you make a selection.

One tap in the app both saves your choice and shows that Pokémon on the widget.

## Features

- Modern UI with SwiftUI
- iOS home screen widget with WidgetKit
- App Group for app ↔ widget data sharing
- Widget timeline refreshes immediately after a selection

## Screenshots

**App — Pokémon list & selection**

![App screen](screen/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-01-29%20at%2016.38.02.png)

**Widget on home screen**

![Widget](screen/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-01-29%20at%2017.01.57.png)

![Widget](screen/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-01-29%20at%2017.02.12.png)

## Project structure

- **PokemonWidget/** — Main app (list, selection, writing to App Group)
- **WidgetPokemon/** — Widget extension (reading from App Group, widget UI)
- **screen/** — Screenshots

## Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

## Setup

1. Clone the repo:  
   `git clone https://github.com/yasirbilir06/pokemon-widget.git`
2. Open `PokemonWidget.xcodeproj` in Xcode.
3. Choose a simulator or device and run with **Run** (⌘R).
4. Add the widget to the home screen: **Pokémon Widget** → choose the size you want.
5. Open the app, tap a Pokémon; the same one will appear on the widget.

---

**Developer:** Yasir Bilir
