# Pokémon Widget

iOS ana ekran widget’ı: Uygulama içinde seçtiğiniz Pokémon, widget’ta görünür.

## Ne yapıyorum?

- **Ana uygulama:** Pikachu, Charmander ve Ball arasından birine dokunuyorsunuz.
- **Widget:** En son dokunduğunuz Pokémon, ana ekrandaki widget’ta gösteriliyor.
- **Paylaşım:** App Group ile uygulama ve widget aynı veriyi kullanıyor; seçim anında widget güncelleniyor.

Yani tek dokunuşla hem uygulama içinde seçim yapıyorsunuz hem de widget’ta en son seçtiğiniz Pokémon’u sergiliyorsunuz.

## Özellikler

- SwiftUI ile modern arayüz
- WidgetKit ile iOS ana ekran widget’ı
- App Group ile uygulama ↔ widget veri paylaşımı
- Seçim sonrası widget zaman çizelgesinin anında yenilenmesi

## Ekran görüntüleri

Çalışmayı görmek için `screen/` klasöründeki simülatör ekran görüntülerine bakabilirsiniz:

- **Uygulama:** Listedeki Pokémon’lara dokunup seçim yapıyorsunuz.
- **Widget:** Ana ekranda en son seçtiğiniz Pokémon görünüyor.

## Proje yapısı

- **PokemonWidget/** — Ana uygulama (liste, seçim, App Group’a yazma)
- **WidgetPokemon/** — Widget extension (App Group’tan okuma, widget UI)
- **screen/** — Ekran görüntüleri

## Gereksinimler

- Xcode 15+
- iOS 17+
- Swift 5.9+

## Kurulum

1. Repoyu klonlayın:  
   `git clone https://github.com/yasirbilir06/pokemon-widget.git`
2. `PokemonWidget.xcodeproj` dosyasını Xcode ile açın.
3. Simülatör veya cihaz seçip **Run** (⌘R) ile çalıştırın.
4. Ana ekrana widget ekleyin: **Pokémon Widget** → istediğiniz boyutu seçin.
5. Uygulamayı açıp bir Pokémon’a dokunun; widget’ta aynı Pokémon görünecektir.

---

**Geliştirici:** Yasir Bilir
