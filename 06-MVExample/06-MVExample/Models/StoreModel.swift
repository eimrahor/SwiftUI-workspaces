//
//  StoreModel.swift
//  06-MVExample
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import Foundation
import Observation

@Observable
class StoreModel {
    let webservice: Webservice
    var products: [Product] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async throws{
        products = try await webservice.getProducts()
    }
}

