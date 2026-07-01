//
//  APIError.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case requersFailed(statusCode: Int, message: String?)
    case networkError(Error)
    case taskCancellation

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .invalidResponse:
            "Invalid Response"
        case .requersFailed(_, _):
            "Request failed"
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
