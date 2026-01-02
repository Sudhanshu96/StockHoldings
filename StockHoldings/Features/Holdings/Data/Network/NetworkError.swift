//
//  NetworkError.swift

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
    case networkUnavailable
    case timeout
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL configuration"
        case .invalidResponse:
            return "Invalid response from server"
        case .httpError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .decodingError:
            return "Failed to decode response data"
        case .networkUnavailable:
            return "Network connection unavailable"
        case .timeout:
            return "Request timeout"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
