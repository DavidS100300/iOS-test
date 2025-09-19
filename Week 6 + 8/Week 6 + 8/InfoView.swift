//
//  InfoView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color("ColorBlueRMIT").ignoresSafeArea()
            VStack(spacing: 10) {
                LogoView(logoFileName: "rmit-casino-welcome-logo")
                Spacer()
                Form {
                    Section(header: Text("How To Play")) {
                        Text("Just spin the reels to play.")
                        Text("Match all icons to win.")
                        Text("Winning pays 10× your bet.")
                        Text("Use Reset to start over.")
                    }
                    Section(header: Text("Application Information")) {
                        LabeledContent("App Name", value: "RMIT Casino")
                        LabeledContent("Course", value: "COSC3062")
                        LabeledContent("Year Published", value: "2025")
                        LabeledContent("Location", value: "Saigon South Campus")
                    }
                }
                .font(.system(.body, design: .rounded))
            }
            .padding(.top, 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    audioPlayer?.stop()
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle").font(.title)
                }
                .foregroundColor(.white)
                .padding(.top, 30)
                .padding(.trailing, 20)
            }
            .onAppear { playSound(sound: "drum-music", type: "mp3") }
        }
    }
}
