//
//  _4_Learn_State_BindingApp.swift
//  04-Learn@State@Binding
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

@main
struct _4_Learn_State_BindingApp: App {
    
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
