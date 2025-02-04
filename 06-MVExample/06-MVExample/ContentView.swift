//
//  ContentView.swift
//  06-MVExample
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(StoreModel.self) private var storeModel: StoreModel
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        @Bindable var storeModel = storeModel
        
        VStack {
            List(storeModel.products) { product in Text(product.title)
            }
            .task {
                await populateProducts()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(StoreModel(webservice: Webservice()))
}
