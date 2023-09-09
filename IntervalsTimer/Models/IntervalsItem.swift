//
//  IntervalsItem.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/23/23.
//

import Foundation
import SwiftData

@Model
final class IntervalsItem {
    var workMinutes: Int
    var workSeconds: Int
    var restMinutes: Int
    var restSeconds: Int
    var loops: Int
    var loopsIsInfinite: Bool
    
    init(workMinutes: Int = 0,
         workSeconds: Int = 0,
         restMinutes: Int = 0,
         restSeconds: Int = 0,
         loops: Int = 0,
         loopsIsInfinite: Bool = false) {
        self.workMinutes = workMinutes
        self.workSeconds = workSeconds
        self.restMinutes = restMinutes
        self.restSeconds = restSeconds
        self.loops = loops
        self.loopsIsInfinite = loopsIsInfinite
    }
}
