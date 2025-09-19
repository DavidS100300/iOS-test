//
//  CircleRMITView.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct CircleRMITView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.4), lineWidth: 40)
                .frame(width: 260, height: 260)
            Circle()
                .stroke(.white.opacity(0.4), lineWidth: 90)
                .frame(width: 260, height: 260)
            Image("rmit-logo-white")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
    }
}

#Preview { CircleRMITView() }
