import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var newTitle = ""
    @State private var newDesc = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks.indices, id: \.self) { index in
                    Button { viewModel.toggleDone(at: index) } label: {
                        TaskRowView(task: $viewModel.tasks[index])
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: viewModel.delete)

                Section("Add Task") {
                    VStack {
                        TextField("Title", text: $newTitle)
                        TextField("Description", text: $newDesc)
                        Button("Add") {
                            viewModel.addTask(title: newTitle, description: newDesc)
                            newTitle = ""; newDesc = ""
                        }
                        .styledButton()
                        .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                }
            }
            .navigationTitle("Tasks (MVVM)")
            .toolbar { EditButton() }
        }
    }
}
