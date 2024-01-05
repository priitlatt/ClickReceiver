//
//  ContentView.swift
//  ClickReceiver
//
//  Created by Priit Lätt on 04.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var click: Click
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(click.getText())
            Spacer()
            Button("Reset", action: click.reset)
        }
        .padding()
        .onChange(of: scenePhase) { previousPhase, newPhase in
            if newPhase == .background { click.reset() }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
        )
        .background(click.getColor())
        .onTapGesture(perform: click.update)
    }
}
