//
//  CapsuleButtonWithIconsStyle.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/20/23.
//

import SwiftUI

struct CapsuleButtonWithIconsStyle<LeadingIcon, TrailingIcon>: ButtonStyle where LeadingIcon: View, TrailingIcon: View {

    struct ColorScheme {
        let foregroundColor: Color
        let backgroundColor: Color
        let outlineColor: Color?
    }

    let enabledColorScheme: ColorScheme
    let pressedColorScheme: ColorScheme
    let hoveredColorScheme: ColorScheme
    let disabledColorScheme: ColorScheme

    let leadingIcon: LeadingIcon
    let trailingIcon: TrailingIcon

    func makeBody(configuration: Configuration) -> some View {
        StyleBody(
            configuration: configuration,
            enabledColorScheme: enabledColorScheme,
            pressedColorScheme: pressedColorScheme,
            hoveredColorScheme: hoveredColorScheme,
            disabledColorScheme: disabledColorScheme,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon
        )
    }

    private struct StyleBody: View {

        let configuration: Configuration
        let enabledColorScheme: ColorScheme
        let pressedColorScheme: ColorScheme
        let hoveredColorScheme: ColorScheme
        let disabledColorScheme: ColorScheme
        let leadingIcon: LeadingIcon
        let trailingIcon: TrailingIcon

        @Environment(\.isEnabled) private var isEnabled
        private var isPressed: Bool { configuration.isPressed }
        @State private var isHovered: Bool = false

        private let shape = Capsule()

        private var colorScheme: ColorScheme {
            if !isEnabled {
                return disabledColorScheme
            } else if isPressed {
                return pressedColorScheme
            } else if isHovered {
                return hoveredColorScheme
            } else {
                return enabledColorScheme
            }
        }

        var body: some View {
            HStack {
                leadingIcon
                configuration.label
                trailingIcon
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .foregroundColor(colorScheme.foregroundColor)
            .background(shape.fill(colorScheme.backgroundColor))
            .overlay(
                shape.strokeBorder(colorScheme.outlineColor ?? .clear)
            )
            .onHover { isHovered in
                self.isHovered = isHovered
            }
        }
    }
}

extension ButtonStyle where Self == CapsuleButtonWithIconsStyle<AnyView, AnyView> {
    static func primaryWithIcons<LeadingIcon: View, TrailingIcon: View>(leading: LeadingIcon, trailing: TrailingIcon) -> Self {
        .init(
            enabledColorScheme: .init(
                foregroundColor: .primaryEnabledForeground,
                backgroundColor: .primaryEnabledBackground,
                outlineColor: .primaryEnabledOutline
            ),
            pressedColorScheme: .init(
                foregroundColor: .primaryPressedForeground,
                backgroundColor: .primaryPressedBackground,
                outlineColor: .primaryPressedOutline
            ),
            hoveredColorScheme: .init(
                foregroundColor: .primaryHoveredForeground,
                backgroundColor: .primaryHoveredBackground,
                outlineColor: .primaryHoveredOutline
            ),
            disabledColorScheme: .init(
                foregroundColor: .primaryDisabledForeground,
                backgroundColor: .primaryDisabledBackground,
                outlineColor: nil
            ),
            leadingIcon: AnyView(erasing: leading),
            trailingIcon: AnyView(erasing: trailing)
        )
    }

    static func primaryWithIcons<LeadingIcon: View>(leading: LeadingIcon) -> Self {
        .primaryWithIcons(leading: leading, trailing: EmptyView())
    }

    static func primaryWithIcons<TrailingIcon: View>(trailing: TrailingIcon) -> Self {
        .primaryWithIcons(leading: EmptyView(), trailing: trailing)
    }

    static var primaryWithIcons: Self {
        .primaryWithIcons(leading: EmptyView(), trailing: EmptyView())
    }
}

struct CapsuleButtonWithIconsStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Button") {}
                .buttonStyle(.primaryWithIcons)
            Button("Button") {}
                .buttonStyle(.primaryWithIcons(
                    leading: Image(systemName: "lightbulb")
                ))
            Button("Button") {}
                .buttonStyle(.primaryWithIcons(
                    trailing: Image(systemName: "arrow.forward")
                ))
            Button("Button") {}
                .buttonStyle(.primaryWithIcons(
                    leading: Image(systemName: "lightbulb"),
                    trailing: Image(systemName: "arrow.forward")
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
