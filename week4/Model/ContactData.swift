//
//  ContactData.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import Foundation

class ContactData: ObservableObject {
    @Published var contacts: [Contact] = []

    init() {
        loadContacts()
    }

    func loadContacts() {
        guard let fileURL = Bundle.main.url(forResource: "contacts", withExtension: "json") else {
            fatalError("Couldn't find contacts.json in bundle.")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            contacts = try JSONDecoder().decode([Contact].self, from: data)
        } catch {
            fatalError("Failed to decode contacts.json: \(error)")
        }
    }
}
