//
//  ClickLocation.swift
//  ClickReceiver
//
//  Created by Priit Lätt on 04.01.2024.
//

import SwiftUI

class Click: ObservableObject {
    @Published var coordinates = ""
    @Published var count = 0
    
    func reset() {
        UserDefaults.standard.removeObject(forKey: "clickLocation")
        self.coordinates = ""
        self.count = 0
    }
    
    func update() {
        if let data = UserDefaults.standard.data(forKey: "clickLocation") {
            if let coordinates = try? JSONDecoder().decode(String.self, from: data) {
                self.coordinates = coordinates
                self.count += 1
            }
        }
    }
    
    func getText() -> String {
        if self.count > 0 {
            return "Tap \(self.count) @ \(self.coordinates)"
        }
        return "Tap somewhere"
    }
    
    func getColor() -> Color {
        let reminder = self.count % 4
        switch  reminder{
        case 0: return Color.white
        case 1: return Color.green
        case 2: return Color.yellow
        default: return Color.red
        }
    }
}
