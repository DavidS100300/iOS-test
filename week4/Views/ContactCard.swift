//
//  ContactCard.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct ContactCard: View {
    var contact: Contact

    var body: some View {
        ZStack {
            Color("rmit-blue")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                MapView(myLocation: contact.locationCoordinate)
                    .frame(height: 250)

                CircleView(image: contact.image)
                    .offset(y: -100)
                    .padding(.bottom, -100)

                Text(contact.name)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                    .padding(.top, 16)

                Image("rmit-logo-white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 225)
                    .padding(.top, 4)

                Group {
                    InfoView(text: contact.phone, imageName: "phone.fill")
                    InfoView(text: contact.email, imageName: "envelope.fill")
                }
                .padding(.top, 8)

                Spacer(minLength: 16)
            }
        }
        .toolbarBackground(Color("rmit-blue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar) // white back button
    }
}

#Preview {
    // Requires contacts + assets
    EmptyView()
}
