//
//  ContentView.swift
//  Hiking
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = [
        Hike(name: "Everest", photo: "everest", miles: 5.5),
        Hike(name: "Sarıkamış", photo: "sarikamis", miles: 2),
        Hike(name: "Machu Picchu", photo: "machupicchu", miles: 1.5)
    ]
    
    var body: some View {
        NavigationStack {
            List(hikes) { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
                }
        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    let hike: Hike
    
    var body: some View {
        HStack(alignment: .center) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .frame(width: 150)
            VStack(alignment:.leading   ) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
            }
        }
    }
}
