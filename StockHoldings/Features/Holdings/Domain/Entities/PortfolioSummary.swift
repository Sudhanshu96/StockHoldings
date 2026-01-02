//
//  PortfolioSummary.swift

struct PortfolioSummary {
    let holdings: [StockHolding]
    
    var totalInvestment: Double {
        holdings.reduce(0) { $0 + $1.totalInvestment }
    }
    
    var currentValue: Double {
        holdings.reduce(0) { $0 + $1.currentValue }
    }
    
    var totalProfitLoss: Double {
        currentValue - totalInvestment
    }
    
    var totalProfitLossPercentage: Double {
        guard totalInvestment > 0 else { return 0 }
        return (totalProfitLoss / totalInvestment) * 100
    }
    
    var isProfitable: Bool {
        totalProfitLoss >= 0
    }
}
