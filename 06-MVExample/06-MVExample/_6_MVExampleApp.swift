//
//  _6_MVExampleApp.swift
//  06-MVExample
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import SwiftUI

@main
struct _6_MVExampleApp: App {
    
    @State private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(storeModel)
        }
    }
}
