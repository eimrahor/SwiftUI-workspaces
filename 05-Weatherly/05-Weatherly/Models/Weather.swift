//
//  Weather.swift
//  05-Weatherly
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
