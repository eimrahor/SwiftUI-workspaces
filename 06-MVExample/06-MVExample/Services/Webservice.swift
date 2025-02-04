//
//  Webservice.swift
//  06-MVExample
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import Foundation

enum NetworkError : Error {
    case badURL
    case badResponse
}

class Webservice {
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products
    }
}
