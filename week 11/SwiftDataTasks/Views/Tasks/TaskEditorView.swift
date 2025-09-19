import SwiftUI
import SwiftData

struct TaskEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Bindable var task: TaskItem
    var onSaveNew: ((TaskItem) -> Void)? = nil

    @Query(sort: [SortDescriptor(\Tag.name)]) private var allTags: [Tag]
    @State private var selectedTagIDs: Set<UUID> = []

    var body: some View {
        Form {
            Section("Main") {
                TextField("Title", text: $task.title)
                    .font(.headline)
                TextField("Notes", text: Binding($task.notes, replacingNilWith: ""), axis: .vertical)
                Toggle("Completed", isOn: $task.isDone)
                DatePicker("Due", selection: Binding($task.dueAt, default: .now), displayedComponents: .date)
            }

            Section("Tags") {
                if allTags.isEmpty {
                    Text("No tags yet. Create some in Tags tab.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(allTags) { tag in
                        HStack {
                            Text(tag.name)
                            Spacer()
                            if selectedTagIDs.contains(tag.id) {
                                Image(systemName: "checkmark").foregroundStyle(.accent)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture { toggle(tag: tag) }
                    }
                }
            }
        }
        .navigationTitle(task.title.isEmpty ? "New Task" : "Edit Task")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") { saveAndClose() }
                    .disabled(task.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .onAppear { selectedTagIDs = Set(task.tags.map { $0.id }) }
    }

    private func toggle(tag: Tag) {
        if selectedTagIDs.contains(tag.id) {
            selectedTagIDs.remove(tag.id)
        } else {
            selectedTagIDs.insert(tag.id)
        }
    }

    private func saveAndClose() {
        // Apply selected tags
        task.tags = allTags.filter { selectedTagIDs.contains($0.id) }

        if let onSaveNew {
            onSaveNew(task)
        } else {
            try? context.save()
        }
        dismiss()
    }
}

// MARK: - Bindings helpers
extension Binding where Value == String? {
    init(_ source: Binding<String?>, replacingNilWith defaultValue: String) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { newValue in
                source.wrappedValue = newValue.isEmpty ? nil : newValue
            }
        )
    }
}

extension Binding where Value == Date? {
    init(_ source: Binding<Date?>, default defaultValue: Date) {
        self.init(
            get: { source.wrappedValue },
            set: { newValue in source.wrappedValue = newValue }
        )
    }
}

#Preview {
    NavigationStack {
        TaskEditorView(task: TaskItem(title: "Preview"))
    }
    .modelContainer(PreviewSampleData.container())
}
