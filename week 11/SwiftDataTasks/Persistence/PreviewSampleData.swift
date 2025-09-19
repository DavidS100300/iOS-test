import Foundation
import SwiftData

/// A throwaway in-memory container for previews/tests with seeded data.
struct PreviewSampleData {
    static func container() -> ModelContainer {
        let schema = Schema([TaskItem.self, Tag.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: config)

        let context = container.mainContext

        // Create sample tags
        let tags = Tag.sample
        tags.forEach { context.insert($0) }

        // Create sample tasks and attach tags
        let t1 = TaskItem(title: "Buy milk", notes: "2L whole milk", tags: [tags[1]])
        let t2 = TaskItem(title: "Finish assignment", notes: "SwiftData guide demo", dueAt: .now.addingTimeInterval(60*60*24), tags: [tags[0]])
        let t3 = TaskItem(title: "Gym", notes: "Leg day", isDone: true, tags: [tags[2]])
        [t1,t2,t3].forEach { context.insert($0) }

        return container
    }
}
