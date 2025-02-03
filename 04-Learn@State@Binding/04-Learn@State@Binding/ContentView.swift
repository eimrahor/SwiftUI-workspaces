//
//  ContentView.swift
//  04-Learn@State@Binding
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI
import Observation

@Observable
class AppState {
    var isOn: Bool = false
}

struct LightBulbView: View {
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        @Bindable var appState = appState
        
        VStack {
            Image(systemName: "lightbulb.fill")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow : .black)
            
            Toggle(appState.isOn ? "On" : "Off", isOn: $appState.isOn)
                .fixedSize()
                .foregroundStyle(.tint)
//            Button("Toggle") {
//                appState.isOn.toggle()
//            }
        }
    }
}

struct ContentView: View {
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        LightBulbView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appState.isOn ? .black : .white)
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
