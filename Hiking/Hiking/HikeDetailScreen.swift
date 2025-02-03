//
//  HikeDetailScreen.swift
//  Hiking
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

struct HikeDetailScreen: View {
    let hike: Hike
    @State private var zoomed = false
    
    var body: some View {
        Image(hike.photo)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .onTapGesture {
                withAnimation {
                    zoomed.toggle()
                }
            }
        Text(hike.name)
        Text("\(hike.miles.formatted()) miles")
        Spacer()
            .navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HikeDetailScreen(hike: Hike(name: "Everest", photo: "everest", miles: 5.5))
    }
}
