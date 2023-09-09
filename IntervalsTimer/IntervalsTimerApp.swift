//
//  IntervalsTimerApp.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/23/23.
//

import SwiftUI
import SwiftData

@main
struct IntervalsTimerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: IntervalsItem.self)
    }
}
