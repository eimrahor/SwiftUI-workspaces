//
//  ContentView.swift
//  05-Weatherly
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()

    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do {
            let location = try await geocodingClient.coordinateByCity(city)
            weather = try await weatherClient.weatherByLocation(location)
        } catch {
            print(error)
        }
        
    }
    
    var body: some View {
        VStack {
            TextField("Enter a city", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            
            Spacer()
            if let weather {
                Text(MeasurementFormatter.temperature(weather.temp))
                    .font(.system(size: 100))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
