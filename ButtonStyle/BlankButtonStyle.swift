//
//  BlankButtonStyle.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/21/23.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct BlankButtonStyle: View {
    var body: some View {
        Button("Styled Button") {}
            .buttonStyle(MyButtonStyle())
    }
}

struct BlankButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        BlankButtonStyle()
    }
}













//struct MyButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(.horizontal, 24)
//            .padding(.vertical, 12)
//            .foregroundColor(.white1)
//            .background(Capsule().fill(
//                configuration.isPressed ? Color.blue2 : Color.blue1
//            ))
//    }
//}
