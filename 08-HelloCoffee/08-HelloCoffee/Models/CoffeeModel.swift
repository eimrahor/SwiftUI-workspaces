//
//  CoffeeModel.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import Foundation
import Observation

@Observable
class CoffeeModel {
    let webservice: Webservice
    private(set) var orders: [Order] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func updateModel(_ order: Order) async throws {
        let updatedOrder = try await webservice.updateOrder(order)
        guard let index = orders.firstIndex(where: { $0.id == updatedOrder.id }) else {
            throw CoffeeOrderError.invalidOrderId
        }
        orders[index] = updatedOrder
    }
    
    func deleteOrder(_ id: Int) async throws {
        _ = try await webservice.deleteOrder(id: id)
        orders.removeAll { $0.id == id }
    }
    
    func populateOrders() async throws {
        orders = try await webservice.getOrders()
    }
    
    func placeOrder(_ order: Order) async throws {
        let newOrder = try await webservice.placeOrder(order: order)
        orders.append(newOrder)
    }
    
    func orderById(_ orderId: Int) -> Order? {
        guard let index = orders.firstIndex(where: { $0.id == orderId }) else {
            return nil
        }
        
        return orders[index]
    }
}
