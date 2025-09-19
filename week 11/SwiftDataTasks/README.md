# SwiftDataTasks (iOS 17+)

A minimal SwiftUI + SwiftData demo app showing:
- `@Model` types (`TaskItem`, `Tag`) with a many-to-many relation.
- CRUD with `@Environment(\.modelContext)` and `@Query`.
- In-memory preview container with seeded data.
- List, editor sheets, tagging, basic search & filtering.

## How to use in Xcode
1. Open Xcode 15+ and create a new **iOS App** project (SwiftUI lifecycle).
2. Name it `SwiftDataTasks` (or anything). Make sure **iOS 17** is your minimum deployment target.
3. In the Project Navigator, delete the default `ContentView.swift` and `YourAppNameApp.swift` if present.
4. Drag the `SwiftDataTasks` folder contents from this zip **into** your project (check “Copy items if needed”). Keep folder references or groups as you like.
5. Build & run on iOS 17+ simulator or device.

## Notes
- SwiftData auto-saves changes. You can explicitly `try? context.save()` after destructive actions.
- If you want iCloud sync, add an iCloud-enabled `ModelConfiguration` and entitlements.
