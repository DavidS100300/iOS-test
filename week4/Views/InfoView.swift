//
//  InfoView.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct InfoView: View {
    var text: String
    var imageName: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(height: 52)
            .overlay(
                HStack(spacing: 12) {
                    Image(systemName: imageName)
                        .imageScale(.medium)
                        .foregroundStyle(Color("rmit-red"))
                    Text(text)
                        .foregroundStyle(Color("rmit-blue"))
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 16)
            )
            .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color("rmit-blue").ignoresSafeArea()
        VStack(spacing: 12) {
            InfoView(text: "0123456789", imageName: "phone.fill")
            InfoView(text: "tom.huynh@rmit.edu.vn", imageName: "envelope.fill")
        }
    }
}
