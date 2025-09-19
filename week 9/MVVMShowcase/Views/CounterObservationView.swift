import SwiftUI
import Observation

@Observable
class CounterModel {
    var value: Int = 0
    func inc() { value += 1 }
    func dec() { value -= 1 }
    func reset() { value = 0 }
}

struct CounterObservationView: View {
    @State private var model = CounterModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(model.value)")
                .primaryTitle()
            HStack {
                Button("−") { model.dec() }.styledButton()
                Button("Reset") { model.reset() }.styledButton()
                Button("+") { model.inc() }.styledButton()
            }
        }
        .padding()
        .navigationTitle("Counter (Observation)")
    }
}
