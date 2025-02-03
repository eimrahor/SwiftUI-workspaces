//
//  ContentView.swift
//  04-Learn@State@Binding
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

struct LightBulbView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "lightbulb.fill")
                .font(.largeTitle)
                .foregroundStyle(isOn ? .yellow : .black)
            Button("Toggle") {
                isOn.toggle()
            }
        }
    }
}

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        LightBulbView(isOn: $isOn)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isOn ? .black : .white)
    }
}

#Preview {
    ContentView()
}
