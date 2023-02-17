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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
