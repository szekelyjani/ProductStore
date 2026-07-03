//
//  Order.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import Combine
import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Product] = []

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }

    func add(_ product: Product) {
        items.append(product)
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
