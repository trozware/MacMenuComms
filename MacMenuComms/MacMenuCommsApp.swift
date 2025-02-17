//
// Sample project to accompany article at
// https://troz.net/post/2025/mac_menu_data/
//
// by Sarah Reichelt
// https://linktr.ee/trozware
//

import SwiftUI

@main
struct MacMenuCommsApp: App {
  @FocusedBinding(\.selectedSymbol) var selectedSymbol

  @State private var symbolName = "globe"
  @State private var symbolColor: Color = .blue

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .commands {
      CommandMenu("Symbol") {
        
        Picker("Symbol", selection: Binding($selectedSymbol)?.name ?? .constant("globe") ) {
          ForEach(Symbol.names, id: \.self) { name in
            Text(name)
              .tag(name)
          }
        }
        .disabled(selectedSymbol == nil)
        
        Picker("Color", selection: Binding($selectedSymbol)?.color ?? .constant(Color.blue)) {
          ForEach(Symbol.colors, id: \.self) { color in
            Text(color.description)
              .tag(color)
          }
        }
        .disabled(selectedSymbol == nil)

        Divider()

        Button("Random") {
          selectedSymbol?.chooseRandomSymbolAndColor()
        }
        .keyboardShortcut("r")
        .disabled(selectedSymbol == nil)
      }
    }
  }
}

extension FocusedValues {
  @Entry var selectedSymbol: Binding<Symbol>?
}
