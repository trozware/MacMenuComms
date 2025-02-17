// Created on 17/2/2025.

import SwiftUI

@main
struct MacMenuCommsApp: App {
  @FocusedObject var symbol : Symbol?

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .commands {
      CommandMenu("Symbol") {
        Menu("Symbol") {
          ForEach(["globe", "house", "display", "car.rear"], id: \.self) { name in
            Button(name) {
              symbol?.name = name
            }
          }
        }

        Menu("Color") {
          ForEach([Color.blue, Color.red, Color.green, Color.yellow], id: \.self) { color in
            Button(color.description) {
              symbol?.color = color
            }
          }
        }

        Divider()

        Button("Random") {
          symbol?.chooseRandomSymbolAndColor()
        }
        .keyboardShortcut("r")
      }
    }
  }
}
