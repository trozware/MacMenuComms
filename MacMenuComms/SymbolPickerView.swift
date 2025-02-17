// Created on 17/2/2025.

import SwiftUI

struct SymbolPickerView: View {
  @EnvironmentObject var symbol: Symbol

  var body: some View {
    HStack(alignment: .top) {
      VStack(spacing: 20) {
        Picker("Symbol", selection: $symbol.name) {
          ForEach(["globe", "house", "display", "car.rear"], id: \.self) { name in
            Text(name)
          }
        }

        Picker("Color", selection: $symbol.color) {
          ForEach([Color.blue, Color.red, Color.green, Color.yellow], id: \.self) { color in
            Text(color.description)
              .foregroundColor(color)
          }
        }

        Text(
          "You have selected \(symbol.name) in \(symbol.color.description)."
        )
      }
      .pickerStyle(.segmented)

      Button {
        symbol.chooseRandomSymbolAndColor()
      } label: {
        VStack {
          Image(systemName: "dice")
            .font(.title)
          Text("Random")
        }
        .padding()
      }
    }
  }
}

#Preview {
  SymbolPickerView()
    .environmentObject(Symbol())
}
