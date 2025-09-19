//
//  ContactRow.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import SwiftUI

struct ContactRow: View {
    var contact: Contact

    var body: some View {
        HStack(spacing: 12) {
            contact.image
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(contact.name)
                .font(.headline)
            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    VStack {
        // Requires sample assets and contacts.json
    }
}
