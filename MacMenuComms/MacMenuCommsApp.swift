// Created on 17/2/2025.

import SwiftUI

@main
struct MacMenuCommsApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .commands {
      CommandMenu("Symbol") {
        Menu("Symbol") {
          ForEach(["globe", "house", "display", "car.rear"], id: \.self) { name in
            Button(name) {
              // action to change icon
            }
          }
        }

        Menu("Color") {
          ForEach([Color.blue, Color.red, Color.green, Color.yellow], id: \.self) { color in
            Button(color.description) {
              // action to shange color
            }
          }
        }

        Divider()

        Button("Random") {
          // action to choose random icon & color
        }
        .keyboardShortcut("r")
      }
    }
  }
}
