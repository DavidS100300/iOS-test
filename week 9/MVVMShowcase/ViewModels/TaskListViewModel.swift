import Foundation

final class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let key = "taskList"

    init() { load() }

    func addTask(title: String, description: String?) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        tasks.append(Task(title: title, description: description))
        save()
    }

    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        save()
    }

    func toggleDone(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks[index].isDone.toggle()
        save()
    }

    private func save() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let decoded = try? JSONDecoder().decode([Task].self, from: data)
        else { return }
        tasks = decoded
    }
}
