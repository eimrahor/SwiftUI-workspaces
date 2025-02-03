//
//  ContentView.swift
//  03-Learn
//
//  Created by Emirhan İmrahor on 3.02.2025.
//

import SwiftUI

struct ContentView: View {
    //@State private var count: Int = 0
    
    //@State private var isOn: Bool = false
    
//    @State private var name: String = ""
//    @State private var friends: [String] = []
    
    @State private var friends: [String] = ["john", "Mary", "Steven", "Steve", "Jerry"]
    @State private var filteredFriends: [String] = []
    @State private var search = ""
    
    var body: some View {
//        Text("\(count)")
//            .font(.largeTitle)
//        Button("increment", action: {
//            count += 1
//        })
        
//        VStack {
//            Toggle(isOn: $isOn) {
//                Text(isOn ? "ON" : "OFF")
//                    .foregroundStyle(.white)
//            }.fixedSize()
//        }.frame(maxWidth: .infinity,maxHeight: .infinity)
//            .background(isOn ? Color.yellow : .black)
        
//        TextField("Enter name", text: $name)
//            .textFieldStyle(.roundedBorder)
//            .padding()
//            .onSubmit {
//                friends.append(name)
//                name = ""
//            }
//        List(friends, id: \.self) { friend in
//            Text(friend)
//        }
//        Spacer()
        
        VStack {
            List(filteredFriends, id: \.self) { friend in
                Text(friend)
            }.listStyle(.plain)
                .searchable(text: $search)
                .onChange(of: search) {
                    if search.isEmpty {
                        filteredFriends = friends
                    } else {
                        filteredFriends = friends.filter { $0.contains(search)}
                    }
                }
        }.padding()
        .onAppear() {
            filteredFriends = friends
        }
        .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
