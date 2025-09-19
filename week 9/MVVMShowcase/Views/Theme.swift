import SwiftUI

struct Theme {
    static let primaryColor = Color.blue
    static let secondaryColor = Color.green
    static let accentColor = Color.orange

    struct Fonts {
        static let title = Font.system(size: 28, weight: .bold, design: .rounded)
        static let body = Font.system(size: 18, weight: .regular, design: .rounded)
    }
}

extension View {
    func primaryTitle() -> some View {
        self.font(Theme.Fonts.title).foregroundColor(Theme.primaryColor)
    }

    func secondaryText() -> some View {
        self.font(Theme.Fonts.body).foregroundColor(.secondary)
    }

    func styledButton() -> some View {
        self.buttonStyle(.borderedProminent).tint(Theme.accentColor)
    }
}
