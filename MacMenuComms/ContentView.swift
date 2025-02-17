// Created on 17/2/2025.

import SwiftUI

struct ContentView: View {
  @StateObject private var symbol = Symbol()

  var body: some View {
    VStack(spacing: 30) {
      Image(systemName: symbol.name)
        .font(.system(size: 72))
        .foregroundStyle(symbol.color)
        .frame(width: 90, height: 90)
      Text("Showing \(symbol.name) in \(symbol.color.description).")

      SymbolPickerView()
    }
    .padding()
    .frame(minWidth: 500)
    .environmentObject(symbol)
    .focusedSceneObject(symbol)
  }
}

#Preview {
  ContentView()
}
