// Created on 17/2/2025.

import SwiftUI

@main
struct MacMenuCommsApp: App {
  @FocusedBinding(\.selectedSymbol) var selectedSymbol

  @State private var symbolName = "globe"
  @State private var symbolColor: Color = .blue

  var body: some Scene {
    WindowGroup {
      ContentView()
        .onChange(of: selectedSymbol?.name) { _, newValue in
          symbolName = newValue ?? "globe"
        }
        .onChange(of: symbolName) { _, newValue in
          selectedSymbol?.name = newValue
        }
        .onChange(of: selectedSymbol?.color) { _, newValue in
          symbolColor = newValue ?? .blue
        }
        .onChange(of: symbolColor) { _, newValue in
          selectedSymbol?.color = newValue
        }
    }
    .commands {
      CommandMenu("Symbol") {
        Picker("Symbol", selection: $symbolName) {
          ForEach(Symbol.names, id: \.self) { name in
            Text(name)
              .tag(name)
          }
        }
        .disabled(selectedSymbol == nil)

        Picker("Color", selection: $symbolColor) {
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
