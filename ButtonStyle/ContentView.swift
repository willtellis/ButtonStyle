//
//  ContentView.swift
//  ButtonStyle
//
//  Created by Will Ellis on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Primary") {}
                .buttonStyle(.primary)

            Button("Secondary") {}
                .buttonStyle(.secondary)

            Button("Destructive") {}
                .buttonStyle(.destructive)

            Button("Disabled") {}
                .buttonStyle(.primary)
                .disabled(true)

            Button("Leading Icon") {}
                .buttonStyle(
                    .primaryWithIcons(leading: Image(systemName: "lightbulb"))
                )

            Button("Trailing Icon") {}
                .buttonStyle(
                    .primaryWithIcons(trailing: Image(systemName: "arrow.forward"))
                )

            Button("Trailing Icon") {}
                .buttonStyle(
                    .primaryWithIcons(
                        leading: Image(systemName: "lightbulb"),
                        trailing: Image(systemName: "arrow.forward")
                    )
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
