import SwiftUI

struct ContactList: View {
    @EnvironmentObject var contactData: ContactData

    var body: some View {
        NavigationView {
            List(contactData.contacts) { contact in
                NavigationLink {
                    ContactCard(contact: contact)
                } label: {
                    ContactRow(contact: contact)
                }
            }
            .navigationTitle("SSET Contact List")
        }
    }
}

#Preview {
    ContactList()
        .environmentObject(ContactData()) // so previews work
}
