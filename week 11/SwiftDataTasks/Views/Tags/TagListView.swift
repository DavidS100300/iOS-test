import SwiftUI
import SwiftData

struct TagListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: [SortDescriptor(\Tag.name)]) private var tags: [Tag]

    @State private var showComposer = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(tags) { tag in
                    NavigationLink {
                        TagEditorView(tag: tag)
                    } label: {
                        HStack {
                            Circle()
                                .fill(Color(uiColor: UIColor(hex: tag.colorHex)))
                                .frame(width: 12, height: 12)
                            Text(tag.name)
                            Spacer()
                            Text("\(tag.tasks.count)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { tags[$0] }.forEach(context.delete)
                    try? context.save()
                }
            }
            .navigationTitle("Tags")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showComposer = true
                    } label: { Image(systemName: "plus.circle.fill") }
                }
            }
            .sheet(isPresented: $showComposer) {
                NavigationStack {
                    TagEditorView(tag: Tag(name: "")) { newTag in
                        context.insert(newTag)
                        try? context.save()
                    }
                }
            }
        }
    }
}

#Preview {
    TagListView()
        .modelContainer(PreviewSampleData.container())
}
