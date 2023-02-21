//
//  ButtonLabelWithIcons.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/16/23.
//

import SwiftUI

struct ButtonLabelWithIcons<LeadingIcon: View, TrailingIcon: View>: View {
    let title: any StringProtocol
    let leadingIcon: LeadingIcon
    let trailingIcon: TrailingIcon

    var body: some View {
        HStack(spacing: 12) {
            leadingIcon
            Text(title)
            trailingIcon
        }
    }
}

// Convenience Button initializers to simplify
//   and standardize content
// Pros:
//   ✅ Can be used with a custom ButtonStyle
//   ✅ Styling and content are decoupled
//   ✅ Still just a plain old Button
//
// Cons:
//   ❌ Some boilerplate
extension Button {

    init<LeadingIcon: View, TrailingIcon: View>(
        _ title: any StringProtocol,
        leadingIcon: LeadingIcon,
        trailingIcon: TrailingIcon,
        action: @escaping () -> Void
    ) where Label == ButtonLabelWithIcons<LeadingIcon, TrailingIcon> {
        self.init(action: action) {
            ButtonLabelWithIcons(title: title, leadingIcon: leadingIcon, trailingIcon: trailingIcon)
        }
    }

    init<LeadingIcon: View>(
        _ title: any StringProtocol,
        leadingIcon: LeadingIcon,
        action: @escaping () -> Void
    ) where Label == ButtonLabelWithIcons<LeadingIcon, EmptyView> {
        self.init(title, leadingIcon: leadingIcon, trailingIcon: EmptyView(), action: action)
    }

    init<TrailingIcon: View>(
        _ title: any StringProtocol,
        trailingIcon: TrailingIcon,
        action: @escaping () -> Void
    ) where Label == ButtonLabelWithIcons<EmptyView, TrailingIcon> {
        self.init(title, leadingIcon: EmptyView(), trailingIcon: trailingIcon, action: action)
    }
}

struct ButtonLabelWithIcons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(
                "Leading Icon",
                leadingIcon: Image(systemName: "lightbulb")
            ) {}
            .buttonStyle(.primary)

            Button(
                "Trailing Icon",
                trailingIcon: Image(systemName: "arrow.forward")
            ) {}
            .buttonStyle(.primary)

            Button(
                "Both Icons",
                leadingIcon: Image(systemName: "lightbulb"),
                trailingIcon: Image(systemName: "arrow.forward")
            ) {}
            .buttonStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
