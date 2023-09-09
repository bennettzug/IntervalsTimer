//
//  IntervalTimer.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 7/19/23.
//

import Foundation
class IntervalTimer {
    var workMinutes: Int
    var workSeconds: Int
    var restMinutes: Int
    var restSeconds: Int
    var loops: Int
    var isInfinite: Bool
    var currentLoop: Int = 0
    var isRunning: Bool = false
    var timer: Timer?
    var startTime: Date?
    
    init(workMinutes: Int, workSeconds: Int, restMinutes: Int, restSeconds: Int, loops: Int, isInfinite: Bool) {
        self.workMinutes = workMinutes
        self.workSeconds = workSeconds
        self.restMinutes = restMinutes
        self.restSeconds = restSeconds
        self.loops = loops
        self.isInfinite = isInfinite
    }
    
    func startTimer() {
        isRunning = true
        currentLoop = 0
        startTime = Date()
        runTimer()
    }
    
    private func runTimer() {
        guard isRunning else { return }
        
        if currentLoop < loops || isInfinite {
            let totalTime = currentLoop % 2 == 0 ? (workMinutes * 60) + workSeconds : (restMinutes * 60) + restSeconds
            var remainingTime = totalTime
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                if let startTime = self.startTime {
                    let currentTime = Date()
                    let elapsedSeconds = Int(currentTime.timeIntervalSince(startTime))
                    remainingTime = max(totalTime - elapsedSeconds, 0)
                }
                
                // You can update your UI here to display the remaining time.
                
                if remainingTime <= 0 {
                    timer.invalidate()
                    self.currentLoop += 1
                    self.startTime = Date()  // Reset the start time for the next loop
                    self.runTimer()
                }
            }
        }
    }
    func stopTimer() {
            isRunning = false
            timer?.invalidate()
            // You can reset your UI here if necessary.
        }
    
}
