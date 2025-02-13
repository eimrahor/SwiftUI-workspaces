//
//  AppEnvironment.swift
//  08-HelloCoffee
//
//  Created by Emirhan İmrahor on 5.02.2025.
//

import Foundation

enum Endpoints {
    case allOrders
    case placeOrder
    case deleteOrder(Int)
    case updateOrder(Int)
    
    var path: String {
        switch self {
        case .allOrders:
            return "/orders"
        case .placeOrder:
            return "/new-order"
        case .deleteOrder(let id):
            return "/orders/\(id)"
        case .updateOrder(let id):
            return "/orders/\(id)"
        }
    }
}

struct Configuration {
    
    lazy var environment: AppEnvironment = {
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}

enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
        case .dev:
            return URL(string:"https://island-bramble.glitch.me/test")!
        case .test:
            return URL(string:"https://island-bramble.glitch.me/test")!
        }
    }
}
