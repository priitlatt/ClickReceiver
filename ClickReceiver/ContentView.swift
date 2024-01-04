//
//  ContentView.swift
//  ClickReceiver
//
//  Created by Priit Lätt on 04.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var click: Click

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(!click.coordinates.isEmpty ? "Click \(click.num) @ \(click.coordinates)" : "Click somewhere")
            Spacer()
        }
        .padding()
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
        )
        .background(click.num % 2 == 0 ? Color.white: Color.gray)
        .onTapGesture(perform: {
            if let data = UserDefaults.standard.data(forKey: "clickLocation") {
                if let coordinates = try? JSONDecoder().decode(String.self, from: data) {
                    click.coordinates = coordinates
                    click.num += 1
                }
            }
        })
    }
}
