//
//  OrderDetailView.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 10.02.2025.
//

import SwiftUI

struct OrderDetailView: View {
    @Environment(CoffeeModel.self) private var model: CoffeeModel
    let orderId: Int
    @State private var isPresented: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    private func deleteOrder() async {
        do {
            try await model.deleteOrder(orderId)
            dismiss()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            if let order = model.orderById(orderId) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    Text(order.size.rawValue).opacity(0.5)
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    HStack {
                        Spacer()
                        Button("Delete Order", role: .destructive) {
                            Task {
                                await deleteOrder()
                            }
                        }
                        Button("Edit Order") {
                            isPresented = true
                        }.accessibilityIdentifier("editOrderButton")
                        Spacer()
                    }
                }.sheet(isPresented: $isPresented) {
                    AddCoffeeView(order: order)
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    OrderDetailView(orderId: 1)
        .environment(CoffeeModel(webservice: Webservice(baseURL: AppEnvironment.test.baseURL)))
}
