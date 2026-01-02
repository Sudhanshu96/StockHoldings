//
//  HoldingsViewModel.swift

import SwiftUI

@MainActor
class HoldingsViewModel: ObservableObject {
    @Published var holdings: [StockHolding] = []
    @Published var portfolioSummary: PortfolioSummary?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var selectedSortOption: SortOption = .profitLoss
    
    private let getHoldingsUseCase: GetHoldingsUseCase
    private let getPortfolioSummaryUseCase: GetPortfolioSummaryUseCase
    
    enum SortOption: String, CaseIterable {
        case profitLoss = "Profit/Loss"
        case currentValue = "Current Value"
        case symbol = "Symbol"
    }
    
    init(
        getHoldingsUseCase: GetHoldingsUseCase,
        getPortfolioSummaryUseCase: GetPortfolioSummaryUseCase
    ) {
        self.getHoldingsUseCase = getHoldingsUseCase
        self.getPortfolioSummaryUseCase = getPortfolioSummaryUseCase
    }
    
    func loadHoldings() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedHoldings = try await getHoldingsUseCase.execute()
            holdings = sortHoldings(fetchedHoldings)
            portfolioSummary = getPortfolioSummaryUseCase.execute(holdings: holdings)
        } catch {
            errorMessage = "Failed to load holdings: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func sortHoldings(_ holdings: [StockHolding]) -> [StockHolding] {
        switch selectedSortOption {
        case .profitLoss:
            return holdings.sorted { $0.profitLoss > $1.profitLoss }
        case .currentValue:
            return holdings.sorted { $0.currentValue > $1.currentValue }
        case .symbol:
            return holdings.sorted { $0.symbol < $1.symbol }
        }
    }
    
    func changeSortOption(_ option: SortOption) {
        selectedSortOption = option
        holdings = sortHoldings(holdings)
    }
}
