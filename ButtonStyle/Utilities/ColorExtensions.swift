//
//  ColorExtensions.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/3/23.
//

import SwiftUI

extension Color {
    static var blue1: Self { .init("Blue1") }
    static var blue2: Self { .init("Blue2") }
    static var blue3: Self { .init("Blue3") }
    
    static var gray1: Self { .init("Gray1") }
    static var gray2: Self { .init("Gray2") }

    static var white1: Self { .init("White1") }

    static var primaryEnabledForeground: Self { .white1 }
    static var primaryEnabledBackground: Self { .blue1 }
    static var primaryEnabledOutline: Self { .white1 }

    static var primaryPressedForeground: Self { .blue1 }
    static var primaryPressedBackground: Self { .blue2 }
    static var primaryPressedOutline: Self { .blue1 }

    static var primaryHoveredForeground: Self { .white1 }
    static var primaryHoveredBackground: Self { .blue3 }
    static var primaryHoveredOutline: Self { .white1 }

    static var primaryDisabledForeground: Self { .gray2 }
    static var primaryDisabledBackground: Self { .gray1 }
}
