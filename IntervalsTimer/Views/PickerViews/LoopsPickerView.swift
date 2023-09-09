//
//  LoopsPicker.swift
//  IntervalsTimer
//
//  Created by Bennett Zug on 6/23/23.
//

import SwiftUI

struct LoopsPickerView: View {
    @Binding var loops: Int
    @Binding var isInfinite: Bool
    var body: some View {
        HStack {
            
            Image(systemName: "infinity").font(.system(size: 100, weight: .bold)).foregroundStyle(isInfinite ? .primary : .secondary)
                .onTapGesture {
                    isInfinite = true
                }
            
            
            
            //DragNumberPicker(count: $loops)
            
            
            DragNumberPickerView(count: $loops, isActive: !isInfinite)
                .onTapGesture {
                    isInfinite = false
                }
        }
            
            
        
    }
}

#Preview {
    LoopsPickerView(loops: .constant(5), isInfinite: .constant(false))
}
