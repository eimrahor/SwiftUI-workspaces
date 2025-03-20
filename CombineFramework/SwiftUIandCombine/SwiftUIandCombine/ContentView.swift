//
//  ContentView.swift
//  SwiftUIandCombine
//
//  Created by Emirhan İmrahor on 18.02.2025.
//

import SwiftUI
import Observation
import Combine

@Observable
class ContentViewModel {
    var value: Int = 0
    private var cancellable: AnyCancellable?
    
    init() {
       let publisher = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect().map {
                _ in self.value + 1
            }
        
        cancellable = publisher.assign(to: \.value, on: self)
    }
}

struct ContentView: View {
    
    @State private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.value)")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
