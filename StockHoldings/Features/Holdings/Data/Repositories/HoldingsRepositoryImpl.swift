//
//  HoldingsRepositoryImpl.swift

import Foundation

protocol HoldingsRepository {
    func fetchHoldings() async throws -> [StockHolding]
}

class HoldingsRepositoryImpl: HoldingsRepository {
    private let dataSource: HoldingsDataSource
    
    init(dataSource: HoldingsDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchHoldings() async throws -> [StockHolding] {
        let dtos = try await dataSource.getHoldings()
        return dtos.map { dto in
            StockHolding(
                id: UUID(),
                symbol: dto.symbol,
                quantity: dto.quantity,
                ltp: dto.ltp,
                avgPrice: dto.avgPrice,
                close: dto.close
            )
        }
    }
}
