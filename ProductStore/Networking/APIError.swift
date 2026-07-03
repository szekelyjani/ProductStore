//
//  APIError.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidData
    case invalidResponse
    case networkError(Error)
    case taskCancellation

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .invalidData:
            "Invalid Data"
        case .invalidResponse:
            "Invalid Response"
        case .networkError(_):
            "Network error"
        case .taskCancellation:
            "Task was cancelled."
        }
    }
}

struct ServerError: Decodable {
    let message: String
}
