import SwiftUI
import SwiftData

@main
struct SwiftDataTasksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Shared container for the whole app
        .modelContainer(sharedModelContainer)
    }
}

// MARK: - Model Container
let sharedModelContainer: ModelContainer = {
    let schema = Schema([TaskItem.self, Tag.self])
    let config = ModelConfiguration("Default")
    do {
        let container = try ModelContainer(for: schema, configurations: [config])
        return container
    } catch {
        fatalError("Failed to create ModelContainer: \(error)")
    }
}()
