import SwiftUI
import SwiftData

struct TagEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Bindable var tag: Tag
    var onSaveNew: ((Tag) -> Void)? = nil

    @State private var colorHexText: String = ""

    var body: some View {
        Form {
            Section("Main") {
                TextField("Name", text: $tag.name)
                TextField("Color hex (e.g. #2563EB)", text: $colorHexText)
                    .onChange(of: colorHexText) { _, new in
                        tag.colorHex = new
                    }
            }
            Section("Preview") {
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color(uiColor: UIColor(hex: tag.colorHex)))
                        .frame(width: 20, height: 20)
                    Text(tag.name.isEmpty ? "Tag" : tag.name)
                        .padding(.horizontal, 10).padding(.vertical, 6)
                        .background(Color(uiColor: UIColor(hex: tag.colorHex)))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
            }
        }
        .onAppear { colorHexText = tag.colorHex }
        .navigationTitle(tag.name.isEmpty ? "New Tag" : "Edit Tag")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    if let onSaveNew {
                        onSaveNew(tag)
                    } else {
                        try? context.save()
                    }
                    dismiss()
                }
                .disabled(tag.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TagEditorView(tag: Tag(name: "Home", colorHex: "#2563EB"))
    }
    .modelContainer(PreviewSampleData.container())
}
