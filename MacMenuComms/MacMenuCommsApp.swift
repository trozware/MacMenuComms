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
              NotificationCenter.default.post(name: .menuSelected, object: name)
            }
          }
        }

        Menu("Color") {
          ForEach([Color.blue, Color.red, Color.green, Color.yellow], id: \.self) { color in
            Button(color.description) {
              NotificationCenter.default.post(name: .menuSelected, object: color)
            }
          }
        }

        Divider()

        Button("Random") {
          NotificationCenter.default.post(name: .menuSelected, object: nil)
        }
        .keyboardShortcut("r")
      }
    }
  }
}

extension Notification.Name {
  static let menuSelected = Notification.Name("menuSelected")
}
