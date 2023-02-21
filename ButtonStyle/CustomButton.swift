//
//  MyButton.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/20/23.
//

import SwiftUI

// Wrapping Button with our own view
// Pros:
//   ✅ Encapsulated, reusable, and DRY styling
//
// Cons:
//   ❌ Tight coupling of styling and content
//   ❌ No access to button pressed state
//   ❌ Have to duplicate Button boilerplate (e.g.,
//      initializers, generic Label type)
struct CustomButton<Label: View>: View {
    private let label: () -> Label
    private let action: () -> Void

    var body: some View {
        Button(action: action, label: label)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .foregroundColor(Color.white1)
            .background(Capsule().fill(Color.blue1))
            .overlay(
                Capsule().strokeBorder(Color.white1)
            )
    }

    init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
}

extension CustomButton where Label == Text {
    init(_ title: String, action: @escaping () -> Void) {
        self.label = {
            Text(title)
        }
        self.action = action
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomButton("Custom") {}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
