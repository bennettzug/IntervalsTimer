//
//  TimePicker.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/23/23.
//

import SwiftUI

struct TimePicker: View {
    @Binding var timerMM: Int
    @Binding var timerSS: Int
    
    var body: some View {
        
        HStack {
            Picker("Minutes", selection: $timerMM) {
                ForEach(0..<11) { min in
                    Text(String(format: "%02d", Int(min)))
                }
            }
            Text(":")
                .foregroundStyle(Color.primary)
            Picker("Seconds", selection: $timerSS) {
                ForEach(0..<60) { sec in
                    if sec.isMultiple(of: 5) {
                        Text(String(format: "%02d", Int(sec)))
                        
                    }
                    
                }
            }
        }.pickerStyle(.wheel)
            .frame(width: 150)
            .font(.system(size:24, weight: .bold, design: .monospaced))
            .foregroundStyle(.tint)
    }
    
}

#Preview {
    TimePicker(timerMM: .c, timerSS: .constant(30))
}
