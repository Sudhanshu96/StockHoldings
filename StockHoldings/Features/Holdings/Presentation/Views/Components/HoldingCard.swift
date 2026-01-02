//
//  HoldingCard.swift

import SwiftUI

struct HoldingCard: View {
    
    // MARK: - Properties
    let holding: StockHolding
    let showSeparator: Bool
    
    // MARK: - Init
    init(holding: StockHolding, showSeparator: Bool = true) {
        self.holding = holding
        self.showSeparator = showSeparator
    }
    
    // MARK: - Main Body
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                
                VStack(alignment: .leading, spacing: 12) {
                    symbolView()
                    
                    netQuantityView()
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 12) {
                    ltpView()
                    
                    profitLossView()
                }
            }.padding()
            
            // Separator view
//            Color.gray.frame(height: 1)
            Divider()
                .opacity(showSeparator ? 0.5 : 0)
        }
        .background(Color(.systemBackground))
    }
    
    // MARK: - Symbol View
    @ViewBuilder private func symbolView() -> some View {
        Text(holding.symbol)
            .font(.subheadline)
            .fontWeight(.semibold)
    }
    
    // MARK: - LTP View
    @ViewBuilder private func ltpView() -> some View {
        HStack(spacing: 4) {
            Text("LTP:")
                .font(.caption2)
                .foregroundColor(.secondary)
            Text(holding.ltp.asCurrency())
                .font(.caption)
                .fontWeight(.medium)
        }
    }
    
    // MARK: - Profit/Loss View
    @ViewBuilder private func profitLossView() -> some View {
        VStack(alignment: .trailing, spacing: 4) {
            HStack(spacing: 4) {
                Text("P&L:")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Text(holding.profitLoss.asCurrency())
                    .font(.caption)
                    .foregroundColor(holding.isProfitable ? .green : .red)
            }
        }
    }
    
    // MARK: - Net Quantity View
    @ViewBuilder private func netQuantityView() -> some View {
        HStack(alignment: .center, spacing: 4) {
            Text("Net Qty:")
                .font(.caption2)
                .foregroundColor(.secondary)
            Text("\(holding.quantity)")
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}
