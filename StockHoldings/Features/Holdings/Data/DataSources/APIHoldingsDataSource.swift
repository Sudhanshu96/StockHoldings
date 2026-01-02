//
//  APIHoldingsDataSource.swift

class APIHoldingsDataSource: HoldingsDataSource {
    private let networkService: NetworkService
    private let apiKey: String?
    
    init(networkService: NetworkService, apiKey: String? = nil) {
        self.networkService = networkService
        self.apiKey = apiKey
    }
    
    func getHoldings() async throws -> [StockHoldingDTO] {
        var headers: [String: String] = [:]
        
        if let apiKey = apiKey {
            headers["Authorization"] = "Bearer \(apiKey)"
        }
        
        do {
            let response: HoldingsAPIResponse = try await networkService.request(
                endpoint: "/api/v1/holdings",
                method: .get,
                headers: headers
            )
            
            return response.data.userHolding
            
        } catch {
            throw error
        }
    }
}
