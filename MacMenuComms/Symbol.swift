// Created on 17/2/2025.

import SwiftUI

class Symbol: ObservableObject {
  @Published var name = "globe"
  @Published var color = Color.blue

  func chooseRandomSymbolAndColor() {
    let symbols = ["globe", "house", "display", "car.rear"]
      .filter { $0 != name }
    let colors: [Color] = [.blue, .red, .green, .yellow]
      .filter { $0 != color }

    name = symbols.randomElement() ?? "questionmark.diamond"
    color = colors.randomElement() ?? .orange
  }
}
