//
//  NewIntervalPicker.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/26/23.
//

import SwiftUI
import SwiftData


struct IntervalPickerView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var item: IntervalsItem
//    private var intervalTimer = IntervalTimer(workMinutes: workMinutes, workSeconds: workSeconds, restMinutes: restMinutes, restSeconds: restSeconds, loops: loops, isInfinite: loopsIsInfinite)
    @State private var isTimerRunning = false
    
    var body: some View {
        VStack(spacing:20) {
            
            VStack(spacing: -20) {
                Text("Work Time").monospaced().textCase(.uppercase)
                DragTimePickerView(minutes: $item.workMinutes, seconds: $item.workSeconds)
            }
            Divider()
            VStack(spacing:-20) {
                Text("Rest Time").monospaced().textCase(.uppercase)
                DragTimePickerView(minutes: $item.restMinutes, seconds: $item.restSeconds)
            }
            Divider()
            VStack(spacing: -20) {
                Text("Loops").monospaced().textCase(.uppercase)
                LoopsPickerView(loops: $item.loops, isInfinite: $item.loopsIsInfinite)
            }
            
            Button(action: {
//                if isTimerRunning {
//                    intervalTimer.stopTimer()
//                } else {
//                    startTimer()
//                }
                isTimerRunning.toggle()
            }) {
                Image(systemName: isTimerRunning ? "stop.fill" : "play.fill") // Toggle play/stop icon based on timer state
                    .font(.system(size: 80))
            }
        }.offset(y:20)
            .onDisappear {
//                intervalTimer.stopTimer() // Stop the timer when the view disappears (e.g., navigating away)
            }
    }
    
//    func startTimer() {
//        intervalTimer = IntervalTimer(workMinutes: item.workMinutes,
//                                      workSeconds: item.workSeconds,
//                                      restMinutes: item.restMinutes,
//                                      restSeconds: item.restSeconds,
//                                      loops: item.loops,
//                                      isInfinite: item.loopsIsInfinite)
//        
//        intervalTimer.startTimer()
//    }
}
