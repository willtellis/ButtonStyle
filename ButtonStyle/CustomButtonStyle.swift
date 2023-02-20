//
//  CustomButtonStyle.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/20/23.
//

import SwiftUI

// Creating a custom ButtonStyle to apply to a Button
// Pros:
//   ✅ Encapsulated, reusable, and DRY styling
//   ✅ Access to button pressed state
//   ✅ Styling and content are decoupled
//   ✅ Can use existing button initializers
//
// Cons:
//   ❌ Easy. Almost too easy 🤨
struct CustomButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed

        configuration.label
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .foregroundColor(
                isPressed ? Color.primaryPressedForeground : Color.primaryEnabledForeground
            )
            .background(Capsule().fill(
                isPressed ? Color.primaryPressedBackground : Color.primaryEnabledBackground
            ))
            .overlay(Capsule().strokeBorder(
                isPressed ? Color.primaryPressedOutline : Color.primaryEnabledOutline
            ))
    }
}

struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Button") {}
            Button {} label: {
                HStack {
                    Text("Button")
                    Image(systemName: "checkmark.seal")
                }
            }

        }
        .buttonStyle(CustomButtonStyle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
