//
// Sample project to accompany article at
// https://troz.net/post/2025/mac_menu_data/
//
// by Sarah Reichelt
// https://linktr.ee/trozware
//

import SwiftUI

struct ContentView: View {
  @State private var symbol = Symbol()

  var body: some View {
    VStack(spacing: 30) {
      Image(systemName: symbol.name)
        .font(.system(size: 72))
        .foregroundStyle(symbol.color)
        .frame(width: 90, height: 90)
      Text("Showing \(symbol.name) in \(symbol.color.description).")

      SymbolPickerView(symbol: $symbol)
    }
    .padding()
    .frame(minWidth: 500)
    .focusedSceneValue(\.selectedSymbol, $symbol)
  }
}

#Preview {
  ContentView()
}
