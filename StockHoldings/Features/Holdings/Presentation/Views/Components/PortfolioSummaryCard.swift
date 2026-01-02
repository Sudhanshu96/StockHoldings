//
//  PortfolioSummaryCard.swift

import SwiftUI

struct PortfolioSummaryCard: View {
    
    // MARK: - Properties
    @Binding private var isExpanded: Bool
    @Binding private var portfolioSummaryViewHeight: CGFloat
    let summary: PortfolioSummary
    
    // MARK: - Init
    init(isExpanded: Binding<Bool>,
         portfolioSummaryViewHeight: Binding<CGFloat>,
         summary: PortfolioSummary) {
        self._isExpanded = isExpanded
        self._portfolioSummaryViewHeight = portfolioSummaryViewHeight
        self.summary = summary
    }
    
    // MARK: - Main body
    var body: some View {
        VStack(spacing: 12) {
            
            if isExpanded {
                expandedView()
                
                Divider()
            }
            
            HStack {
                
                Text("Profit & Loss")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Image(systemName: isExpanded ? "chevron.down" : "chevron.up")
                    .font(.caption2)
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 0) {
                    Text(summary.totalProfitLoss.asCurrency())
                        .font(.caption)
                        .foregroundColor(summary.isProfitable ? .green : .red)
                    
                    Text(" (\(summary.totalProfitLossPercentage.asPercentage())%)")
                        .font(.caption2)
                        .foregroundColor(summary.isProfitable ? .green : .red)
                }
            }
        }
        .padding()
        .padding(.bottom, 24)
        .background(Color.init(hex: "F1F1F1"))
        .cornerRadius(4)
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        portfolioSummaryViewHeight = geo.size.height
                    }
            }
        )
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func expandedView() -> some View {
        VStack(spacing: 18) {
            SummaryRow(
                title: "Current Value",
                value: summary.currentValue.asCurrency(),
                color: .black
            )
            
            SummaryRow(
                title: "Total Investment",
                value: summary.totalInvestment.asCurrency(),
                color: .black
            )
            
            SummaryRow(
                title: "Today's Profit & Loss",
                value: summary.totalInvestment.asCurrency(),
                color: .black
            )
            
        }
    }
}
