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
    @Published private(set) var isLoading = false

    func getProducts() async {
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            products = try await NetworkManager.shared.getProducts()
        } catch {
            if let apiError = error as? APIError {
                errorMessage = apiError.errorDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
