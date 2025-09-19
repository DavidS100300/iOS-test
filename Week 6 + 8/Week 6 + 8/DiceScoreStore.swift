//
//  DiceScoreStore.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import Foundation
import Combine

final class DiceScoreStore: ObservableObject {
    static let shared = DiceScoreStore()
    @Published var scores: [Int] = []
    private let key = "DiceHighscores"

    private init() { load() }

    func add(score: Int) {
        scores.append(score)
        scores.sort(by: >)
        save()
    }

    private func save() {
        UserDefaults.standard.set(scores, forKey: key)
    }

    private func load() {
        scores = UserDefaults.standard.array(forKey: key) as? [Int] ?? []
    }
}
