//
//  StockHolding.swift

import Foundation

struct StockHolding: Identifiable, Equatable {
    let id: UUID
    let symbol: String
    let quantity: Int
    let ltp: Double // Last Traded Price (current price)
    let avgPrice: Double // Average purchase price
    let close: Double // Previous close price
    
    var totalInvestment: Double {
        Double(quantity) * avgPrice
    }
    
    var currentValue: Double {
        Double(quantity) * ltp
    }
    
    var profitLoss: Double {
        currentValue - totalInvestment
    }
    
    var profitLossPercentage: Double {
        guard totalInvestment > 0 else { return 0 }
        return (profitLoss / totalInvestment) * 100
    }
    
    var isProfitable: Bool {
        profitLoss >= 0
    }
    
    var todayProfitLoss: Double {
        Double(quantity) * (ltp - close)
    }
    
    var todayProfitLossPercentage: Double {
        guard close > 0 else { return 0 }
        return ((ltp - close) / close) * 100
    }
}
