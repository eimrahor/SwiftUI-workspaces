//
//  String+Extensions.swift
//  07-HelloValidation
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
}
