//
//  GreetingView.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool

    var body: some View {
        ZStack {
            Color("rmit-blue").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Welcome")
                    .font(.system(size: 60, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                Text("""
                     The Contact List is long
                     The Circle is small!
                     """)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Spacer()
                CircleRMITView()
                Spacer()

                Button {
                    active = false
                } label: {
                    Capsule()
                        .fill(.white.opacity(0.4))
                        .padding(8)
                        .frame(height: 80)
                        .overlay(
                            Text("Get Started")
                                .font(.title2)
                                .foregroundColor(.white)
                        )
                }
            }
            .padding()
        }
    }
}

#Preview { GreetingView(active: .constant(true)) }
