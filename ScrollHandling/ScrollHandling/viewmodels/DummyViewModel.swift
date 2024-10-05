//
//  DummyViewModel.swift
//  ScrollHandling
//
//  Created by Ahmed Shaban on 04/10/2024.
//
import Foundation

class DummyViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var categories: [DummyCategory] = [
        DummyCategory(id: 1, name: "Category 1", products: [
            DummyProduct(id: 101, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 102, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 103, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 104, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 105, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 106, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)]),
            DummyProduct(id: 107, name: "Spring Rolls", description: "Crispy rolls", image: "spring_rolls", sizes: [DummySize(priceWithTax: 5.99)])

        ]),
        DummyCategory(id: 2, name: "Category 2", products: [
            DummyProduct(id: 201, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 202, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 203, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 204, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 205, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
        ]),
        DummyCategory(id: 3, name: "Category 3", products: [
            DummyProduct(id: 206, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 207, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 208, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 209, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 210, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
        ]),
        DummyCategory(id: 4, name: "Category 4", products: [
            DummyProduct(id: 211, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 212, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 213, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 214, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
            DummyProduct(id: 215, name: "Grilled Chicken", description: "Juicy grilled chicken", image: "grilled_chicken", sizes: [DummySize(priceWithTax: 12.99)]),
        ])
    ]
    
}
