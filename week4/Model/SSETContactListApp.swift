import SwiftUI

@main
struct SSETContactListApp: App {
    @StateObject private var contactData = ContactData()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(contactData)  // inject into entire app
        }
    }
}
