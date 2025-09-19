//
//  GameOverView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct GameOverView: View {
    @Binding var showModal: Bool
    @Binding var coins: Int

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                Image("rmit-casino-welcome-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 120)
                Text("You lost all money!\nYou are not the god of gambler!\nGood luck next time!")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Button {
                    showModal = false
                    coins = 100
                    playSound(sound: "ring-up", type: "mp3")
                } label: {
                    Text("New Game".uppercased())
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            Capsule().strokeBorder(lineWidth: 2)
                                .foregroundColor(Color("ColorRedRMIT"))
                        )
                }
            }
            .padding()
            .frame(minWidth: 280, maxWidth: 320, minHeight: 280, maxHeight: 350)
            .background(Color("ColorBlueRMIT"))
            .cornerRadius(20)
            .shadow(color: Color("ColorBlackTransparentRMIT"), radius: 15)
            Spacer()
        }
        .transition(.opacity)
        .ignoresSafeArea(edges: .vertical)
    }
}
