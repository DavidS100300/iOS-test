import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            TaskListView()
                .tabItem { Label("Tasks", systemImage: "checklist") }

            TagListView()
                .tabItem { Label("Tags", systemImage: "tag") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}

private struct SettingsView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            Form {
                Section("Utilities") {
                    Button("Insert Sample Data") {
                        insertSamples()
                    }
                    .buttonStyle(.borderedProminent)

                    Button(role: .destructive, action: deleteAll) {
                        Text("Delete All Data")
                    }
                }
                Section("About") {
                    Text("SwiftDataTasks demo app")
                    Text("iOS 17+ • SwiftData • SwiftUI")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Settings")
        }
    }

    private func insertSamples() {
        let tags = Tag.sample
        tags.forEach { context.insert($0) }
        TaskItem.sample.forEach { context.insert($0) }
        try? context.save()
    }

    private func deleteAll() {
        try? context.delete(model: TaskItem.self)
        try? context.delete(model: Tag.self)
        try? context.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewSampleData.container())
}
