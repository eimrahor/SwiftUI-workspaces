//
//  APIEndpoint.swift
//  05-Weatherly
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import Foundation

enum APIEndpoint {
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLon(Double,Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.apiKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.apiKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        return URL(string: baseURL + endpoint.path)!
    }
}
