//
//  WeatherClient.swift
//  05-Weatherly
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import Foundation

struct WeatherClient {
    func weatherByLocation(_ location: Location?) async throws -> Weather {
        let (data,response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .weatherByLatLon(location?.lat ?? 0.0, location?.lon ?? 0.0)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weather.main
    }
}
