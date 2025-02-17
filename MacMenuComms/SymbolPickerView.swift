// Created on 17/2/2025.

import SwiftUI

struct SymbolPickerView: View {
  @Environment(\.appearsActive) private var appearsActive

  @Binding var chosenName: String
  @Binding var chosenColor: Color

  let menuSelectedNotification = NotificationCenter.default
    .publisher(for: .menuSelected)
    .receive(on: RunLoop.main)

  var body: some View {
    HStack(alignment: .top) {
      VStack(spacing: 20) {
        Picker("Symbol", selection: $chosenName) {
          ForEach(["globe", "house", "display", "car.rear"], id: \.self) { name in
            Text(name)
          }
        }

        Picker("Color", selection: $chosenColor) {
          ForEach([Color.blue, Color.red, Color.green, Color.yellow], id: \.self) { color in
            Text(color.description)
              .foregroundColor(color)
          }
        }

        Text(
          "You have selected \(chosenName) as the symbol and \(chosenColor.description) as the color."
        )
      }
      .pickerStyle(.segmented)

      Button {
        chooseRandoms()
      } label: {
        VStack {
          Image(systemName: "dice")
            .font(.title)
          Text("Random")
        }
        .padding()
      }
    }
    .onReceive(menuSelectedNotification) { notification in
      guard appearsActive else { return }

      if notification.object == nil {
        chooseRandoms()
      }
    }
  }

  func chooseRandoms() {
    let symbols = ["globe", "house", "display", "car.rear"]
      .filter { $0 != chosenName }
    let colors: [Color] = [.blue, .red, .green, .yellow]
      .filter { $0 != chosenColor }

    chosenName = symbols.randomElement() ?? "questionmark.diamond"
    chosenColor = colors.randomElement() ?? .orange
  }
}

#Preview {
  @Previewable @State var chosenName: String = "globe"
  @Previewable @State var chosenColor: Color = .blue
  SymbolPickerView(chosenName: $chosenName, chosenColor: $chosenColor)
}
