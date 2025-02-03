//
//  ContentView.swift
//  HelloWorld
//
//  Created by Emirhan İmrahor on 2.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("image")
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            Text("First Line")
                .foregroundStyle(.cyan)
                .font(.largeTitle)
            Text("Second Line")
                .foregroundStyle(.green)
            Text("Third Line")
                .padding([.top], 20)
            HStack {
                Text("Fourth")
                Text("Line")
                    .fontWeight(.bold)
            }
            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-vfkZRyQpMwiKtJP7LeyClGEiXzaTYm0bMjK3iR_y_9HHItQGb83Kp3PiM5fBw070k48EMAuc4aYPyKUeydR7eA")) { image in
                image.resizable()
                    .frame(width: 250,height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            } placeholder: {
                //Text("Loading...")
                ProgressView("Downloading...")
            }

        }
        .padding()
        .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}
