//
//  ClickLocation.swift
//  ClickReceiver
//
//  Created by Priit Lätt on 04.01.2024.
//

import SwiftUI

class Click: ObservableObject {
    @Published var coordinates = ""
    @Published var num = 0
}
