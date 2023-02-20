//
//  ButtonStyleFeatures.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/20/23.
//

import SwiftUI

// The .buttonStyle(...) view modifier is a function
//   that sets the style for buttons within its view
//   to a button style with a custom appearance and
//   custom interaction behavior.
//
// Apple provides us with built-in ButtonStyles
// Pros:
//   ✅ Work cross-platform
//   ✅ Easy to use right out of the box
//
// Cons:
//   ❌ Not what's in our design
struct ButtonStyleFeatures_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Button("Button") {}
                .buttonStyle(.borderless)

            Button("Button") {}
                .buttonStyle(.bordered)

            Button("Button") {}
                .buttonStyle(.borderedProminent)

            Button("Button", role: .destructive) {}
                .buttonStyle(.borderless)

            Button("Button", role: .destructive) {}
                .buttonStyle(.bordered)

            Button("Button", role: .destructive) {}
                .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
