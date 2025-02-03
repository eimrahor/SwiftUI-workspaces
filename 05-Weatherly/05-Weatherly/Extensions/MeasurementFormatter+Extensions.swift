//
//  MeasurementFormatter+Extensions.swift
//  05-Weatherly
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import Foundation

extension MeasurementFormatter {
    static func temperature(_ value: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        let temperature = Measurement(value: value, unit: UnitTemperature.kelvin)
        let celsiusTemperature = temperature.converted(to: .celsius)
        return formatter.string(from: celsiusTemperature)
    }
}
