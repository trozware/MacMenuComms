// Created on 17/2/2025.

import SwiftUI

struct ContentView: View {
  @Environment(\.appearsActive) private var appearsActive

  @State private var symbolName: String = "globe"
  @State private var symbolColor: Color = .blue

  let menuSelectedNotification = NotificationCenter.default
    .publisher(for: .menuSelected)
    .receive(on: RunLoop.main)

  var body: some View {
    VStack(spacing: 30) {
      Image(systemName: symbolName)
        .font(.system(size: 72))
        .foregroundStyle(symbolColor)
        .frame(width: 90, height: 90)
      Text("Showing \(symbolName) in \(symbolColor).")

      SymbolPickerView(
        chosenName: $symbolName,
        chosenColor: $symbolColor
      )
    }
    .padding()
    .frame(minWidth: 500)
    .onReceive(menuSelectedNotification) { notification in
      guard appearsActive else { return }

      if let name = notification.object as? String {
        symbolName = name
      } else if let color = notification.object as? Color {
        symbolColor = color
      }
    }
  }
}

#Preview {
  ContentView()
}
