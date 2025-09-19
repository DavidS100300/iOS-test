//
//  DiceGameView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct DiceGameView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var playerDice: (Int, Int) = (1, 1)
    @State private var aiDice: (Int, Int) = (1, 1)
    @State private var score: Int = 100
    @State private var highThisRun: Int = 100

    @State private var isRolling = false
    @State private var rollElapsed: TimeInterval = 0
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(score)").font(.title2).foregroundColor(.white)
            Text("Best this game: \(highThisRun)").foregroundColor(.white)

            HStack {
                DiceView(value: playerDice.0, color: .blue)
                DiceView(value: playerDice.1, color: .blue)
                Spacer(minLength: 24)
                DiceView(value: aiDice.0, color: .red)
                DiceView(value: aiDice.1, color: .red)
            }
            .padding(.horizontal)

            if isRolling { ProgressView("Rolling...").tint(.white) }

            HStack(spacing: 12) {
                Button("Play") { startRoll() }
                    .buttonStyle(.borderedProminent)
                    .disabled(isRolling)
                Button("End Game") { endGame() }
                    .buttonStyle(.bordered)
                    .disabled(isRolling)
            }

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("ColorRedRMIT"), Color("ColorPurpleRMIT")]),
                           startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        .onDisappear { timer?.invalidate() }
        .navigationTitle("Dice Duel")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Game Flow
    func startRoll() {
        playSound(sound: "spin", type: "mp3")
        isRolling = true
        rollElapsed = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { t in
            rollElapsed += 0.1
            randomizeDice()
            if rollElapsed >= 1.5 {
                t.invalidate()
                isRolling = false
                finishRound()
            }
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    func randomizeDice() {
        playerDice = (Int.random(in: 1...6), Int.random(in: 1...6))
        aiDice = (Int.random(in: 1...6), Int.random(in: 1...6))
    }

    func finishRound() {
        let playerSum = playerDice.0 + playerDice.1
        let aiSum = aiDice.0 + aiDice.1
        if playerSum > aiSum {
            score += 10
            playHaptic(type: .success)
            playSound(sound: "win", type: "mp3")
        } else {
            score -= 10
            playHaptic(type: .error)
            playSound(sound: "lose", type: "mp3")
        }
        if score > highThisRun { highThisRun = score }
        if score <= 0 { endGame() }
    }

    func endGame() {
        DiceScoreStore.shared.add(score: highThisRun)
        dismiss()
    }
}
