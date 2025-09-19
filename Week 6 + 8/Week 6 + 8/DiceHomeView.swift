//
//  DiceHomeView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct DiceHomeView: View {
    @State private var showHighscores = false
    var body: some View {
        VStack(spacing: 24) {
            Text("RMIT Dice Duel")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: "die.face.5.fill")
                .font(.system(size: 64))
                .foregroundColor(.white)
            NavigationLink { DiceGameView() } label: {
                Text("Play").frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Button { showHighscores = true } label: { Text("Highscores") }
                .buttonStyle(.bordered)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("ColorRedRMIT"), Color("ColorPurpleRMIT")]),
                           startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        .sheet(isPresented: $showHighscores) { HighscoresView() }
    }
}
