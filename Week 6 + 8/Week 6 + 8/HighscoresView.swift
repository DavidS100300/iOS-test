//
//  HighscoresView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct HighscoresView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var store = DiceScoreStore.shared

    var body: some View {
        NavigationStack {
            List {
                if store.scores.isEmpty {
                    Text("No highscores yet.")
                } else {
                    ForEach(Array(store.scores.enumerated()), id: \.offset) { (idx, val) in
                        HStack { Text("#\(idx+1)"); Spacer(); Text("\(val)") }
                    }
                }
            }
            .navigationTitle("Highscores")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}
