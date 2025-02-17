// Created on 17/2/2025.

import SwiftUI

struct ContentView: View {
  @State private var symbolName: String = "globe"
  @State private var symbolColor: Color = .blue

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
  }
}

#Preview {
  ContentView()
}
