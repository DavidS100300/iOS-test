import SwiftUI
import Firebase

@main
struct FirebasePersistenceAppApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
