import SwiftUI

struct DragTimePickerView: View {
    @Binding var minutes: Int
    @Binding var seconds: Int
    @State private var minuteOffset: Int = 0
    @State private var secondOffset: Int = 0
    @State private var isBeingDragged: Bool = false
    
    let minuteStepSize: Int = 1 // The amount to increment or decrement the minutes
    let secondStepSize: Int = 10 // The amount to increment or decrement the seconds
    let incrementDistance: Int = 30 // Tuning variable for how quickly the values adjust
    
    var body: some View {
        HStack(spacing: 10) {
            pickerLabel(value: minutes)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isBeingDragged = true
                            let translation = Int(value.translation.height) / incrementDistance
                            let minuteCount = translation / minuteStepSize
                            minutes = (-1 * minuteCount * minuteStepSize) + minuteOffset
                            
                            // Clamp the minutes value within the desired range
                            minutes = min(max(minutes, 0), 20)
                        }
                        .onEnded { _ in
                            isBeingDragged = false
                            minuteOffset = minutes
                        }
                )
            Text(":").offset(y:-10.0)
            pickerLabel(value: seconds)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isBeingDragged = true
                            let translation = Int(value.translation.height) / incrementDistance * secondStepSize
                            let secondCount = translation / secondStepSize
                            seconds = (-1 * secondCount * secondStepSize) + secondOffset
                            
                            // Clamp the seconds value within the desired range
                            seconds = min(max(seconds, 0), 50)
                        }
                        .onEnded { _ in
                            isBeingDragged = false
                            secondOffset = seconds
                        }
                )
            Image(systemName: "chevron.up.chevron.down")
                .imageScale(.small)
                .foregroundColor(.secondary)
                .font(.system(size:30))
                .symbolEffect(.scale.up, isActive: isBeingDragged)
        }
        .font(.system(size: 80, weight: .heavy))
        .foregroundColor(.primary)
        .padding()
        .onChange(of: minutes) {
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
            // Update the minutes continuously during dragging
        }
        .onChange(of: seconds) {
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
            // Update the seconds continuously during dragging
        }
    }
    
    private func pickerLabel(value: Int) -> some View {
        
        Text(String(format: "%02d", value))
            .font(.system(size: 110, weight: .bold, design: .monospaced))
            .foregroundColor(.primary)
        
        
        
    }
}

#Preview {
    DragTimePickerView(minutes: .constant(0), seconds: .constant(0))
}

