//
//  _8_HelloCoffeeApp.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import SwiftUI

@main
struct _8_HelloCoffeeApp: App {
    
    @State private var coffeeModel: CoffeeModel
    
    init(){
        var config = Configuration()
        let webservice = Webservice(baseURL: config.environment.baseURL)
        coffeeModel = CoffeeModel(webservice: webservice)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coffeeModel)
        }
    }
}
