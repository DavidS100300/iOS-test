import Foundation

struct Task: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var isDone: Bool = false
}
