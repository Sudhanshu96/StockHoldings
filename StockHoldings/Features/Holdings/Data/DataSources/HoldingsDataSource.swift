//
//  HoldingsDataSource.swift

protocol HoldingsDataSource {
    func getHoldings() async throws -> [StockHoldingDTO]
}
