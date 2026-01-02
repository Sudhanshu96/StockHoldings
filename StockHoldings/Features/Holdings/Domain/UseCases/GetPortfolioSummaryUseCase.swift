//
//  GetPortfolioSummaryUseCase.swift

protocol GetPortfolioSummaryUseCase {
    func execute(holdings: [StockHolding]) -> PortfolioSummary
}

class GetPortfolioSummaryUseCaseImpl: GetPortfolioSummaryUseCase {
    func execute(holdings: [StockHolding]) -> PortfolioSummary {
        PortfolioSummary(holdings: holdings)
    }
}
