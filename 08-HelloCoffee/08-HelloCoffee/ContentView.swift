//
//  ContentView.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented:Bool = false
    @Environment(CoffeeModel.self) private var coffeeModel: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await coffeeModel.populateOrders()
        } catch {
            print(error)
        }
    }
    
    private func deleteOrder(_ index: IndexSet) {
        index.forEach { index in
            let order = coffeeModel.orders[index]
            guard let orderID = order.id else { return }
            Task {
                do {
                    try await coffeeModel.deleteOrder(orderID)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(coffeeModel.orders) { order in
                        NavigationLink(value: order.id) {
                            OrderCellView(order: order)
                        }
                    }.onDelete(perform: deleteOrder)
                }
                .navigationDestination(for: Int.self, destination: { orderId in
                    OrderDetailView(orderId: orderId)
                })
                .task {
                    await populateOrders()
                }.sheet(isPresented: $isPresented, content: {
                    AddCoffeeView()
                })
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add New Order") {
                            isPresented = true
                        }.accessibilityIdentifier("addNewOrderButton")
                    }
                }
            }
        }
    }
}

#Preview {
    var config = Configuration()
    ContentView()
        .environment(CoffeeModel(webservice: Webservice(baseURL: config.environment.baseURL)))
}
