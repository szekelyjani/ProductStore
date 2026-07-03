//
//  NetworkManager.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    private let baseURL = "https://dummyjson.com/products"
    private init() { }

    func getProducts() async throws -> [Product] {
        guard let url = URL(string: baseURL) else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        do {
            let response = try JSONDecoder().decode(ProductResponse.self, from: data)
            return response.products
        } catch {
            throw APIError.invalidData
        }
    }
}
