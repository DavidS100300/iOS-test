//  MagicMeApp.swift
//  Week 3
//
//  Created by 鄭志宏 on 2025/9/19.
//
import SwiftUI

struct ContentView: View {
    // MARK: - Data (answers array)
    // Lifted from the guide’s categories: affirmative, negative, non-committal
    // (You can add/remove lines any time)
    private let allAnswers: [String] = [
        // Affirmative
        "Bet.",
        "No cap.",
        "It's giving... yes.",
        "Slay.",
        "That's fire.",
        "Manifesting this for you.",
        "The vibes are immaculate.",
        "Let's get it.",
        // Negative
        "It's giving... nope.",
        "That's a major L.",
        "Big yikes.",
        "I'm not the one.",
        "That's cringe.",
        "My sources say nah.",
        "The math ain't mathing.",
        "It's a no from me, dawg.",
        // Non-Committal
        "Vibe check.",
        "Ask again when my social battery is full.",
        "The rizz is unconfirmed.",
        "Reply hazy, try again... but make it ✨aesthetic✨.",
        "It's complicated, situationship-style.",
        "Let it cook.",
        "Main character energy is low.",
        "Check back after the next TikTok trend."
    ]

    // MARK: - State (current answer shown)
    @State private var currentAnswer: String = "Tap the orb for wisdom..."

    var body: some View {
        ZStack {
            // Background
            Color.mint.ignoresSafeArea()

            VStack {
                Spacer(minLength: 24)

                // MARK: - Avatar + Orb (tap target)
                ZStack {
                    // Avatar — shows if you add an image named "avatar-binz" to Assets
                    if let uiImage = UIImage(named: "avatar-binz") {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .clipShape(Circle())
                            .shadow(radius: 8)
                            .offset(y: -6)
                    } else {
                        // Fallback avatar using SF Symbol if asset missing
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .foregroundStyle(.white.opacity(0.85))
                            .shadow(radius: 8)
                            .offset(y: -6)
                    }

                    // Magic orb — shows if you add an image named "magic-ball-empty"
                    if let orb = UIImage(named: "magic-ball-empty") {
                        Image(uiImage: orb)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .allowsHitTesting(false)
                    } else {
                        // Fallback orb using a circle if asset missing
                        Circle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [.white.opacity(0.9), .purple.opacity(0.7), .indigo.opacity(0.8)]),
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: 140
                                )
                            )
                            .frame(width: 250, height: 250)
                            .overlay(Circle().stroke(.white.opacity(0.6), lineWidth: 4))
                            .shadow(radius: 12)
                            .allowsHitTesting(false)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        currentAnswer = allAnswers.randomElement() ?? currentAnswer
                    }
                }
                .padding(.bottom, 24)

                Spacer(minLength: 8)

                // MARK: - Name & Title
                VStack(spacing: 4) {
                    Text("Santoso David")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)

                    Text("iOS Developer")
                        .font(.headline)
                        .foregroundColor(.red)
                }

                Spacer(minLength: 8)

                // MARK: - Contact Cards
                VStack(spacing: 12) {
                    contactRow(icon: "phone.fill", text: "0917952798")
                    contactRow(icon: "envelope.fill", text: "s3824107@rmit.edu.vn")
                }
                .frame(maxWidth: 280)

                Spacer(minLength: 8)

                // MARK: - Hobbies List
                VStack(alignment: .leading, spacing: 14) {
                    hobbyRow(icon: "gamecontroller.fill", text: "Gaming")
                    hobbyRow(icon: "music.note", text: "Listening to Music")
                    hobbyRow(icon: "film.fill", text: "Watching Movies")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .foregroundColor(.blue)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                .frame(maxWidth: 320)

                Spacer(minLength: 8)

                // MARK: - Answer display
                Text(currentAnswer)
                    .font(.title3.weight(.medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(height: 56)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.black.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.bottom, 24)

                Spacer(minLength: 8)
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Reusable subviews
    private func contactRow(icon: String, text: String) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(height: 52)
            .overlay(
                HStack(spacing: 10) {
                    Image(systemName: icon)
                        .foregroundColor(.red)
                    Text(text)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
            )
            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
    }

    private func hobbyRow(icon: String, text: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.body)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15")
    }
}


#Preview {
    ContentView()
}
