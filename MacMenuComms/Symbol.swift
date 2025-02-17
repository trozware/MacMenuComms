// Created on 17/2/2025.

import SwiftUI

struct Symbol {
  var name = "globe"
  var color = Color.blue

  mutating func chooseRandomSymbolAndColor() {
    let symbols = Symbol.names
      .filter { $0 != name }
    let colors = Symbol.colors
      .filter { $0 != color }

    name = symbols.randomElement() ?? "questionmark.diamond"
    color = colors.randomElement() ?? .orange
  }

  static let names = ["globe", "house", "display", "car.rear"]
  static let colors = [Color.blue, Color.red, Color.green, Color.yellow]
}

//  @Observable
//  class Symbol {
//    var name = "globe"
//    var color = Color.blue
//
//    func chooseRandomSymbolAndColor() {
//      let symbols = Symbol.names
//        .filter { $0 != name }
//      let colors = Symbol.colors
//        .filter { $0 != color }
//
//      name = symbols.randomElement() ?? "questionmark.diamond"
//      color = colors.randomElement() ?? .orange
//    }
//
//    static let names = ["globe", "house", "display", "car.rear"]
//    static let colors = [Color.blue, Color.red, Color.green, Color.yellow]
//  }
