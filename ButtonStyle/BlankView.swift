//
//  BlankView.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/21/23.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        Button("Button") {}
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}












//struct BlankView: View {
//    var body: some View {
//        Button("Button") {}
//            .padding(.horizontal, 24)
//            .padding(.vertical, 12)
//            .background(Capsule().fill(Color.blue1))
//            .foregroundColor(Color.white1)
//    }
//}
