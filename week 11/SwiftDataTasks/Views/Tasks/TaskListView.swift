import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(\.modelContext) private var context

    // Fetch all tasks; we'll do lightweight in-memory filtering to keep code simple.
    @Query(sort: [
        SortDescriptor(\TaskItem.isDone, order: .forward),
        SortDescriptor(\TaskItem.createdAt, order: .reverse)
    ]) private var tasks: [TaskItem]

    @State private var showComposer = false
    @State private var searchText = ""
    @State private var showOnlyOpen = true

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredTasks) { task in
                    NavigationLink {
                        TaskEditorView(task: task)
                    } label: {
                        TaskRowView(task: task)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            context.delete(task)
                            try? context.save()
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            task.isDone.toggle()
                            try? context.save()
                        } label: {
                            Label(task.isDone ? "Reopen" : "Done",
                                  systemImage: task.isDone ? "arrow.uturn.left.circle" : "checkmark.circle.fill")
                        }
                        .tint(.green)
                    }
                }
            }
            .overlay {
                if filteredTasks.isEmpty {
                    ContentUnavailableView.search
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Toggle(isOn: $showOnlyOpen) {
                        Text("Open only")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus.circle.fill").imageScale(.large)
                    }
                    .accessibilityLabel("Add Task")
                }
            }
            .navigationTitle("Tasks")
            .sheet(isPresented: $showComposer) {
                NavigationStack {
                    TaskEditorView(task: TaskItem(title: "")) { newTask in
                        context.insert(newTask)
                        try? context.save()
                    }
                }
            }
        }
    }

    private var filteredTasks: [TaskItem] {
        tasks.filter { t in
            (showOnlyOpen ? !t.isDone : true) &&
            (searchText.isEmpty ? true :
                t.title.localizedCaseInsensitiveContains(searchText) ||
                (t.notes?.localizedCaseInsensitiveContains(searchText) ?? false) ||
                t.tags.contains(where: { $0.name.localizedCaseInsensitiveContains(searchText) }))
        }
    }
}

#Preview {
    TaskListView()
        .modelContainer(PreviewSampleData.container())
}
