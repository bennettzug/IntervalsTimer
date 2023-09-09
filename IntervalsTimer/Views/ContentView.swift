//
//  ContentView.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/23/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var item = IntervalsItem()
    
    var body: some View {
        IntervalPickerView(item: item)
        
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: IntervalsItem.self)
}
