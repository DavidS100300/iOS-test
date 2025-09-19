//
//  ContentView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

struct ContentView: View {
    let icons = ["apple","bar","cherry","clover","diamond","grape","heart","horseshoe","lemon","melon","money","orange"]

    @State private var reels = [6,3,1]
    @State var coins: Int = 100
    @State var betAmount: Int = 10
    @State var highscore: Int = 0

    @State private var animatingIcon: Bool = false
    @State private var showingInfoView: Bool = false
    @State private var showGameOverModal: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorRedRMIT"), Color("ColorPurpleRMIT")]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                LogoView(logoFileName: "rmit-casino-welcome-logo")

                // Scoreboards
                HStack {
                    HStack(spacing: 8) {
                        Text("Your\nMoney".uppercased())
                            .multilineTextAlignment(.leading)
                            .modifier(scoreLabelStyle())
                        Text("\(coins)").modifier(scoreNumberStyle())
                    }
                    .modifier(scoreCapsuleStyle())

                    Spacer()

                    HStack(spacing: 8) {
                        Text("\(highscore)").modifier(scoreNumberStyle())
                        Text("High\nScore".uppercased())
                            .multilineTextAlignment(.trailing)
                            .modifier(scoreLabelStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                }

                // Reels
                VStack(spacing: 0) {
                    ZStack {
                        Image("reel").resizable().modifier(ReelImageModifier())
                        Image(icons[reels[0]])
                            .resizable()
                            .modifier(IconImageModifier())
                            .rotationEffect(.degrees(animatingIcon ? 360 : 0))
                            .animation(.interpolatingSpring(stiffness: 70, damping: 10),
                                       value: animatingIcon)
                    }
                    HStack {
                        ZStack {
                            Image("reel").resizable().modifier(ReelImageModifier())
                            Image(icons[reels[1]]).resizable().modifier(IconImageModifier())
                        }
                        Spacer()
                        ZStack {
                            Image("reel").resizable().modifier(ReelImageModifier())
                            Image(icons[reels[2]]).resizable().modifier(IconImageModifier())
                        }
                    }
                }

                // Bet buttons
                HStack(spacing: 12) {
                    Button { setBet(10) } label: {
                        Text("Bet 10").modifier(BetButtonStyle(isSelected: betAmount == 10))
                    }
                    Button { setBet(20) } label: {
                        Text("Bet 20").modifier(BetButtonStyle(isSelected: betAmount == 20))
                    }
                    Button { resetGame() } label: {
                        Text("Reset").modifier(ResetButtonStyle())
                    }
                }

                // Spin button
                Button {
                    withAnimation { animatingIcon.toggle() }
                    playSound(sound: "spin", type: "mp3")
                    spinReels()
                    checkWinning()
                    isGameOver()
                } label: {
                    Image("spin").resizable().modifier(ReelImageModifier())
                }

                // Dice challenge
                NavigationLink(value: "dice") {
                    Text("🎲 Try Dice Challenge")
                        .foregroundColor(.white)
                        .font(.system(.headline, design: .rounded))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .background(Capsule().strokeBorder(lineWidth: 2).foregroundColor(.white))
                }
                .navigationDestination(for: String.self) { value in
                    if value == "dice" { DiceHomeView() }
                }
            }
            .overlay(alignment: .topTrailing) {
                Button { showingInfoView = true } label: {
                    Image(systemName: "info.circle")
                }
                .modifier(InfoButtonStyle())
                .padding(.horizontal)
            }
            .blur(radius: showGameOverModal ? 5 : 0)

            if showGameOverModal {
                GameOverView(showModal: $showGameOverModal, coins: $coins)
            }
        }
        .sheet(isPresented: $showingInfoView) { InfoView() }
        .onAppear {
            highscore = UserDefaults.standard.integer(forKey: "CasinoHighscore")
            playSound(sound: "drum-music", type: "mp3")
        }
    }

    // MARK: - Logic
    func spinReels() { reels = reels.map { _ in Int.random(in: 0...icons.count - 1) } }
    func setBet(_ amount: Int) { betAmount = amount; playSound(sound: "casino-chips", type: "mp3") }
    func checkWinning() {
        let isWin = reels.dropFirst().allSatisfy { $0 == reels.first }
        if isWin { playerWins() } else { playerLoses() }
        if coins > highscore { newHighScore() }
    }
    func playerWins() { coins += betAmount * 10; playHaptic(type: .success); playSound(sound: "win", type: "mp3") }
    func playerLoses() { coins -= betAmount; playHaptic(type: .error); playSound(sound: "lose", type: "mp3") }
    func newHighScore() {
        highscore = coins
        UserDefaults.standard.set(highscore, forKey: "CasinoHighscore")
        playSound(sound: "highscore", type: "mp3")
        playHaptic(type: .success)
    }
    func isGameOver() { if coins <= 0 { showGameOverModal = true; playSound(sound: "gameover", type: "mp3") } }
    func resetGame() { coins = 100; betAmount = 10; reels = [6,3,1]; playSound(sound: "ring-up", type: "mp3") }
}
