//
//  StockHoldingDTO.swift

import Foundation

struct StockHoldingDTO: Codable {
    let symbol: String
    let quantity: Int
    let avgPrice: Double
    let ltp: Double
    let close: Double
}

class MockHoldingsDataSource: HoldingsDataSource {
    private let shouldFail: Bool
    private let delay: TimeInterval
    
    init(shouldFail: Bool = false, delay: TimeInterval = 0.5) {
        self.shouldFail = shouldFail
        self.delay = delay
    }
    
    func getHoldings() async throws -> [StockHoldingDTO] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        
        if shouldFail {
            throw NetworkError.networkUnavailable
        }
        
        return [
//            StockHoldingDTO(symbol: "AAPL", companyName: "Apple Inc.", quantity: 50, averagePrice: 150.0, currentPrice: 178.50, sector: "Technology"),
//            StockHoldingDTO(symbol: "GOOGL", companyName: "Alphabet Inc.", quantity: 30, averagePrice: 140.0, currentPrice: 142.80, sector: "Technology"),
//            StockHoldingDTO(symbol: "MSFT", companyName: "Microsoft Corp.", quantity: 40, averagePrice: 320.0, currentPrice: 378.90, sector: "Technology"),
//            StockHoldingDTO(symbol: "TSLA", companyName: "Tesla Inc.", quantity: 25, averagePrice: 250.0, currentPrice: 242.80, sector: "Automotive"),
//            StockHoldingDTO(symbol: "JPM", companyName: "JPMorgan Chase", quantity: 35, averagePrice: 145.0, currentPrice: 158.30, sector: "Finance"),
//            StockHoldingDTO(symbol: "JNJ", companyName: "Johnson & Johnson", quantity: 45, averagePrice: 160.0, currentPrice: 155.20, sector: "Healthcare")
        ]
    }
}
