// Optional custom search bar (not used directly — SwiftUI .searchable is applied in TaskListView).
// You can reuse this if you prefer a custom UI.
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var prompt: String = "Search"

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(prompt, text: $text)
                .textFieldStyle(.plain)
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.plain)
            }
        }
        .padding(8)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    @Previewable @State var s = ""
    return VStack { SearchBar(text: $s) }.padding()
}
