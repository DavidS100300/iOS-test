//
//  WelcomeView.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true

    var body: some View {
        if isWelcomeActive {
            GreetingView(active: $isWelcomeActive)
        } else {
            ContactList()
        }
    }
}

#Preview { WelcomeView() }
