//
//  CapsuleButtonStyle.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/16/23.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {

    struct ColorScheme {
        let foregroundColor: Color
        let backgroundColor: Color
        let outlineColor: Color?
    }

    let enabledColorScheme: ColorScheme
    let pressedColorScheme: ColorScheme
    let hoveredColorScheme: ColorScheme
    let disabledColorScheme: ColorScheme

    func makeBody(configuration: Configuration) -> some View {
        StyleBody(
            configuration: configuration,
            enabledColorScheme: enabledColorScheme,
            pressedColorScheme: pressedColorScheme,
            hoveredColorScheme: hoveredColorScheme,
            disabledColorScheme: disabledColorScheme
        )
    }

    private struct StyleBody: View {

        let configuration: Configuration
        let enabledColorScheme: ColorScheme
        let pressedColorScheme: ColorScheme
        let hoveredColorScheme: ColorScheme
        let disabledColorScheme: ColorScheme

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
            configuration.label
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

extension ButtonStyle where Self == CapsuleButtonStyle {
    static var primary: Self {
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
            )
        )
    }
}



struct CapsuleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                Button("Primary") {
                    // ...
                }
                .buttonStyle(.primary)
                Button("Primary") {
                    // ...
                }
                .buttonStyle(.primary)
                .disabled(true)
                Button {
                    // ...
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "lightbulb")
                        Text("Primary")
                        Image(systemName: "arrow.forward")
                    }
                }
                .buttonStyle(.primary)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}
