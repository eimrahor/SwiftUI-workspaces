//
//  NumberFormatter+Extensions.swift
//  09-BudgetsApp
//
//  Created by Emirhan İmrahor on 13.02.2025.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
