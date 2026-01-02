//
//  NetworkService.swift

protocol NetworkService {
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        headers: [String: String]?
    ) async throws -> T
}
