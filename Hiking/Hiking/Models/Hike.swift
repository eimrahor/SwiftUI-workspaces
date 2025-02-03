//
//  Hike.swift
//  Hiking
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import Foundation

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let miles: Double
}
