//
//  PrimaryButton.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/16/23.
//

import SwiftUI

// Custom View wrapping a button Button to simplify
//   and standardize content and style
// Pros:
//   ✅ Styling and content are contained in a simple API
//   ✅ Still just a plain old Button
//
// Cons:
//   ❌ Cannot be used with another ButtonStyle
//   ❌ Not a plain old Button
//   ❌ Lots of duplicated code to provide another button type
struct PrimaryButton<LeadingIcon: View, TrailingIcon: View>: View {
    let title: any StringProtocol
    let leadingIcon: LeadingIcon
    let trailingIcon: TrailingIcon
    let action: () -> Void

    init(
        _ title: any StringProtocol,
        leadingIcon: LeadingIcon,
        trailingIcon: TrailingIcon,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.action = action
    }

    init(
        _ title: any StringProtocol,
        leadingIcon: LeadingIcon,
        action: @escaping () -> Void
    ) where TrailingIcon == EmptyView {
        self.init(title, leadingIcon: leadingIcon, trailingIcon: EmptyView(), action: action)
    }

    init(
        _ title: any StringProtocol,
        trailingIcon: TrailingIcon,
        action: @escaping () -> Void
    ) where LeadingIcon == EmptyView {
        self.init(title, leadingIcon: EmptyView(), trailingIcon: trailingIcon, action: action)
    }

    init(
        _ title: any StringProtocol,
        action: @escaping () -> Void
    ) where LeadingIcon == EmptyView, TrailingIcon == EmptyView {
        self.init(title, leadingIcon: EmptyView(), trailingIcon: EmptyView(), action: action)
    }

    var body: some View {
        Button(
            title,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action
        )
        .buttonStyle(.primary)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton("Primary") {
                // ...
            }
            PrimaryButton("Primary", leadingIcon: Image(systemName: "lightbulb")) {
                // ...
            }
            PrimaryButton("Primary", trailingIcon: Image(systemName: "arrow.forward")) {
                // ...
            }
            PrimaryButton(
                "Primary",
                leadingIcon: Image(systemName: "lightbulb"),
                trailingIcon: Image(systemName: "arrow.forward")
            ) {
                // ...
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
