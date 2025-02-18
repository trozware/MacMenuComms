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

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .commands {
      CommandMenu("Symbol") {
        if let selectedSymbol = Binding($selectedSymbol) {
          Picker("Symbol", selection: selectedSymbol.name) {
            ForEach(Symbol.names, id: \.self) { name in
              Text(name)
                .tag(name)
            }
          }
          .pickerStyle(.inline)

          Picker("Color", selection: Binding($selectedSymbol)?.color ?? .constant(Color.blue)) {
            ForEach(Symbol.colors, id: \.self) { color in
              Text(color.description)
                .tag(color)
            }
          }
          .pickerStyle(.inline)
        } else {
          Text("Symbol")
          Text("Color")
        }

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
