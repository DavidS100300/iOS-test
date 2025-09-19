//
//  RootView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            ContentView()
                .navigationTitle("RMIT Casino")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
