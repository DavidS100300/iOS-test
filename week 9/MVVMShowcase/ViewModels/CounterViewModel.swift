import Foundation
import Combine

final class CounterViewModel: ObservableObject {
    @Published private(set) var counter = Counter(value: 0)

    func increment() { counter.value += 1 }
    func decrement() { counter.value -= 1 }
    func reset()     { counter.value = 0 }
}
