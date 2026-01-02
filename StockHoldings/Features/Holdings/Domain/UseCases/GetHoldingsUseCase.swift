//
//  GetHoldingsUseCase.swift

protocol GetHoldingsUseCase {
    func execute() async throws -> [StockHolding]
}

class GetHoldingsUseCaseImpl: GetHoldingsUseCase {
    private let repository: HoldingsRepository
    
    init(repository: HoldingsRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [StockHolding] {
        try await repository.fetchHoldings()
    }
}
