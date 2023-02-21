//
//  ButtonWithModifiersExample.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/20/23.
//

import SwiftUI

// Applying view modifiers to style a button
// Pros:
//   ✅ Easy to get started
//
// Cons:
//   ❌ Styling is not encapsulated and not reusable, not DRY
struct ButtonWithModifiersExample: View {
    var body: some View {
        Button("Button") {
            // ...
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .foregroundColor(Color.white1)
        .background(Capsule().fill(Color.blue1))
        .overlay(
            Capsule().strokeBorder(Color.white1)
        )
    }
}

struct ButtonWithModifiersExample_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonWithModifiersExample()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
