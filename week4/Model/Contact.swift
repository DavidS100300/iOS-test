//
//  Contact.swift
//  Week 4
//
//  Created by 鄭志宏 on 2025/9/19.
//


import Foundation
import SwiftUI
import CoreLocation

struct Contact: Identifiable, Codable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var imageName: String
    var coordinates: Coordinates

    // Computed helpers the views use
    var image: Image { Image(imageName) }
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
