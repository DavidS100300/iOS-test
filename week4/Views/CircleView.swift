//
//  CircleView.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct CircleView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color("rmit-red"), lineWidth: 3))
            .shadow(color: Color("rmit-blue").opacity(0.4), radius: 10, x: 0, y: 4)
    }
}

#Preview {
    // Add a placeholder image named "tom-huynh" to Assets for this to work
    CircleView(image: Image("tom-huynh"))
}
