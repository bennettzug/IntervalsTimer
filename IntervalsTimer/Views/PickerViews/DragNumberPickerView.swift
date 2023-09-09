import SwiftUI

struct DragNumberPickerView: View {
    @Binding var count: Int
    @State private var offset: Int = 0
    var isActive: Bool = true
    @State private var isBeingDragged: Bool = false
    
    let stepSize: Int = 1 // The amount to increment or decrement the count
    let incrementDistance: Int = 30 // Tuning variable for how quickly the count adjusts
    
    var body: some View {
        HStack {
            Text(String(format: "%02d", count))
            Image(systemName: "chevron.up.chevron.down")
                .imageScale(.small)
                .foregroundColor(.secondary)
                .font(.system(size:30))
                .symbolEffect(.scale.up, isActive: isBeingDragged)
        }
        .font(.system(size: 110, weight: .bold))
        .monospaced()
        .foregroundColor(isActive ? .primary : .secondary)
        .padding()
        .gesture(
            isActive ?
            DragGesture()
                .onChanged { value in
                    isBeingDragged = true
                    let translation = Int(value.translation.height) / incrementDistance
                    let stepCount = translation / stepSize
                    count = (-1 * stepCount * stepSize) + offset
                    count = max(count, 0)
                    
                }
                .onEnded {_ in
                    offset = count
                    isBeingDragged = false
                } : nil
            
        )
        .onChange(of: count) {
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
            // Update the count continuously during dragging
        }
        
        
    }
}

#Preview {
    DragNumberPickerView(count: .constant(0), isActive: true)
}
