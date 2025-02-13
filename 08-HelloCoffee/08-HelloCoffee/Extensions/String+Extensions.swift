//
//  String+Extensions.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import Foundation

extension String {
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    func isLessThan(_ num: Double) -> Bool {
        if !self.isNumeric {
            return false
        }
        
        guard let value = Double(self) else { return false }
        return value < num
    }
}
