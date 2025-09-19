import Foundation
import SwiftData

@Model
final class TaskItem {
    @Attribute(.unique) var id: UUID
    var title: String
    var notes: String?
    var isDone: Bool
    var createdAt: Date
    var dueAt: Date?
    // Relationship: many-to-many with tags
    @Relationship(inverse: \Tag.tasks) var tags: [Tag]

    init(title: String,
         notes: String? = nil,
         isDone: Bool = false,
         createdAt: Date = .now,
         dueAt: Date? = nil,
         tags: [Tag] = []) {
        self.id = UUID()
        self.title = title
        self.notes = notes
        self.isDone = isDone
        self.createdAt = createdAt
        self.dueAt = dueAt
        self.tags = tags
    }
}

extension TaskItem {
    static let sample: [TaskItem] = [
        TaskItem(title: "Buy milk", notes: "2L whole milk"),
        TaskItem(title: "Finish assignment", notes: "SwiftData guide demo", dueAt: .now.addingTimeInterval(60*60*24)),
        TaskItem(title: "Gym", notes: "Leg day", isDone: true),
    ]
}
