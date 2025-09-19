import Foundation
import SwiftData

@Model
final class Tag {
    @Attribute(.unique) var id: UUID
    var name: String
    var colorHex: String
    // inverse relationship: TaskItem.tags
    @Relationship var tasks: [TaskItem]

    init(name: String, colorHex: String = "#4F46E5", tasks: [TaskItem] = []) {
        self.id = UUID()
        self.name = name
        self.colorHex = colorHex
        self.tasks = tasks
    }
}

extension Tag {
    static let sample: [Tag] = [
        Tag(name: "School", colorHex: "#16A34A"),
        Tag(name: "Home", colorHex: "#2563EB"),
        Tag(name: "Urgent", colorHex: "#DC2626"),
    ]
}
