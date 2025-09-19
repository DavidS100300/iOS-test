//
//  ShadowModifier.swift
//  Week 6 + 8
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: Color("ColorBlackTransparentRMIT"), radius: 10)
    }
}

struct scoreLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color("ColorWhiteRMIT"))
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
}

struct scoreNumberStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color("ColorWhiteRMIT"))
            .font(.system(size: 20, weight: .heavy, design: .rounded))
    }
}

struct scoreCapsuleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Capsule().foregroundColor(Color("ColorBlackTransparentRMIT")))
    }
}

struct ReelImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.scaledToFit().frame(minWidth: 140, maxWidth: 220).modifier(ShadowModifier())
    }
}

struct IconImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.scaledToFit().frame(minWidth: 50, maxWidth: 70).modifier(ShadowModifier())
    }
}

struct InfoButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title).accentColor(.white).padding()
    }
}

struct BetButtonStyle: ViewModifier {
    let isSelected: Bool
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(
                Capsule().foregroundStyle(isSelected ? AnyShapeStyle(.ultraThinMaterial) :
                    AnyShapeStyle(Color("ColorBlackTransparentRMIT")))
            )
            .overlay(Capsule().stroke(isSelected ? .white : .clear, lineWidth: 2))
    }
}

struct ResetButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(Capsule().foregroundColor(Color("ColorBlackTransparentRMIT")))
    }
}
