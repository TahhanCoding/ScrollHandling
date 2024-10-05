//
//  Models.swift
//  ScrollHandling
//
//  Created by Ahmed Shaban on 04/10/2024.
//

import Foundation

struct DummyCategory: Identifiable, Hashable {
    let id: Int
    let name: String
    let products: [DummyProduct]
}

struct DummyProduct: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let sizes: [DummySize]
    
    func totalQuantity(in cart: [Int]) -> Int {
        // Dummy logic for total quantity
        return cart.contains(id) ? 1 : 0
    }
}

struct DummySize: Hashable {
    let priceWithTax: Double
}
