//
//  DeviceOrientationPublisherAppApp.swift
//  DeviceOrientationPublisherApp
//
//  Created by Emirhan İmrahor on 18.02.2025.
//

import SwiftUI
import Combine

@main
struct DeviceOrientationPublisherAppApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print(currentOrientation)
            }.store(in: &cancellables)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
