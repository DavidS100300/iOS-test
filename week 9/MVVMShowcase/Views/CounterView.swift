import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Text("Count: \(viewModel.counter.value)")
                .primaryTitle()

            HStack(spacing: 12) {
                Button("−") { viewModel.decrement() }.styledButton()
                Button("Reset") { viewModel.reset() }.styledButton()
                Button("+") { viewModel.increment() }.styledButton()
            }
        }
        .padding()
        .navigationTitle("Counter (MVVM)")
    }
}
