//
//  MenuItemCellView.swift
//  ScrollHandling
//
//  Created by Ahmed Shaban on 04/10/2024.
//

import SwiftUI

struct MenuItemCellView: View {
    let product: DummyProduct
    @ObservedObject var vm: DummyViewModel

    var body: some View {
        HStack {
            Text(product.name)
                .font(.headline)
                .padding()
            Spacer()
            Text(String(format: "$%.2f", product.sizes.first?.priceWithTax ?? 0))
                .font(.subheadline)
        }
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
