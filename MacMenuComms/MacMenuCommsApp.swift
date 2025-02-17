// Created on 17/2/2025.

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
        Menu("Symbol") {
          ForEach(Symbol.names, id: \.self) { name in
            Button(name == selectedSymbol?.name ? "✔︎ \(name)" : name) {
              selectedSymbol?.name = name
            }
          }
        }
        .disabled(selectedSymbol == nil)

        Menu("Color") {
          ForEach(Symbol.colors, id: \.self) { color in
            Button(color == selectedSymbol?.color ? "✔︎ \(color.description)" : color.description) {
              selectedSymbol?.color = color
            }
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
