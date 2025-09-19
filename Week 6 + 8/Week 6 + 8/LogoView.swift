//
//  LogoView.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct LogoView: View {
    let logoFileName: String
    var body: some View {
        Image(logoFileName)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 250, idealWidth: 280, maxWidth: 320)
            .modifier(ShadowModifier())
            .accessibilityLabel("RMIT Casino Logo")
    }
}
