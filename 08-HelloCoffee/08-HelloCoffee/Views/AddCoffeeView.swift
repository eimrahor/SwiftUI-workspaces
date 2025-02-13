//
//  AddCoffeeView.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import SwiftUI

struct AddCoffeeErrors {
    var name: String = ""
    var coffeeName: String = ""
    var price: String = ""
}

struct AddCoffeeView: View {
    var order: Order? = nil
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    @State private var errors: AddCoffeeErrors = AddCoffeeErrors()
    @Environment(CoffeeModel.self) private var coffeeModel: CoffeeModel
    @Environment(\.dismiss) private var dismiss
    
    var isValid: Bool {
        errors = AddCoffeeErrors()
        
        if name.isEmpty {
            errors.name = "Name is required"
        }
        
        if coffeeName.isEmpty {
            errors.coffeeName = "Coffee name is required"
        }
        
        if price.isEmpty {
            errors.price = "Price is required"
        } else if !price.isNumeric {
            errors.price = "Price needs to be a number"
        } else if price.isLessThan(1) {
            errors.price = "Price needs to be more than 0"
        }
        
        return errors.name.isEmpty && errors.coffeeName.isEmpty && errors.price.isEmpty 
    }
    
    private func placeOrder(_ order: Order) async {
        do {
            try await coffeeModel.placeOrder(order)
            dismiss()
        } catch {
            print(error)
        }
    }
    
    private func updateOrder(_ editOrder: Order) async {
        do {
            try await coffeeModel.updateModel(editOrder)
        } catch {
            print(error)
        }
    }
    
    private func populateExistingOrder() {
        if let order {
            name = order.name
            coffeeName = order.coffeeName
            price = String(order.total)
            coffeeSize = order.size
        }
    }
    
    private func saveOrUpdate() async {
        if let order {
            var editOrder = order
            editOrder.name = name
            editOrder.coffeeName = coffeeName
            editOrder.total = Double(price) ?? 0.0
            editOrder.size = coffeeSize
            
            await updateOrder(editOrder)
        } else {
            let order = Order(name: name, coffeeName: coffeeName, total: Double(price) ?? 0.0, size: coffeeSize)
            await placeOrder(order)
            
        }
        
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .accessibilityIdentifier("name")
                Text(errors.name).visible(!errors.name.isEmpty)
                    .font(.caption)
                
                TextField("Coffee name", text: $coffeeName)
                    .accessibilityIdentifier("coffeeName")
                Text(errors.coffeeName).visible(!errors.coffeeName.isEmpty)
                    .font(.caption)
                
                TextField("Price", text: $price)
                    .accessibilityIdentifier("price")
                Text(errors.price).visible(!errors.coffeeName.isEmpty)
                    .font(.caption)
                
                Picker("Select size", selection: $coffeeSize) {
                    ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                        Text(size.rawValue).tag(size)
                    }
                }.pickerStyle(.segmented)
                
                Button(order == nil ? "Place Order" : "Update Order") {
                    if isValid {
                        Task {
                            await saveOrUpdate()
                        }
                    }
                }.centerHorizontally()
                    .accessibilityIdentifier("placeOrderButton")
            }.onAppear(perform: {
                populateExistingOrder()
            })
            .navigationTitle(Text(order == nil ? "Add Coffee" : "Update Coffee"))
        }
    }
}

#Preview {
    AddCoffeeView()
        .environment(CoffeeModel(webservice: Webservice(baseURL: AppEnvironment.dev.baseURL)))
}
