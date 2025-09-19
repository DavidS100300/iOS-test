//
//  DiceView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct DiceView: View {
    let value: Int
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.2))
            Text("\(value)")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: 80, height: 80)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.6), lineWidth: 1))
        .shadow(radius: 6)
        .padding(4)
    }
}
