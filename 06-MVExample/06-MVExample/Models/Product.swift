//
//  Product.swift
//  06-MVExample
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
