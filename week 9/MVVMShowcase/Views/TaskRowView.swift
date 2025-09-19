import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title).primaryTitle()
                if let desc = task.description, !desc.isEmpty {
                    Text(desc).secondaryText()
                }
            }
            Spacer()
            if task.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Theme.secondaryColor)
            }
        }
        .padding(.vertical, 4)
    }
}
