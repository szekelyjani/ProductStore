//
//  ProductStore.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 01..
//

import Combine
import Foundation

@MainActor
final class ProductStore: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var errorMessage: String?

    func getProducts() async {
        do {
            products = try await NetworkManager.shared.getAppetizers()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
