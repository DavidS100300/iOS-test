import SwiftUI

@main
struct MVVMShowcaseApp: App {
    @StateObject private var sharedTaskViewModel = TaskListViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack { CounterView() }
                    .tabItem { Label("Counter", systemImage: "plusminus.circle") }

                NavigationStack { TaskListView() }
                    .tabItem { Label("Tasks MVVM", systemImage: "list.bullet") }

                NavigationStack { TaskListView_Env() }
                    .environmentObject(sharedTaskViewModel)
                    .tabItem { Label("Tasks EnvObj", systemImage: "person.2") }

                NavigationStack { CounterObservationView() }
                    .tabItem { Label("Observation", systemImage: "eye") }
            }
        }
    }
}
