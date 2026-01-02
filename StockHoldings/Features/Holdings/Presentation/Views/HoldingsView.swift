//
//  HoldingsView.swift

import SwiftUI

struct HoldingsView: View {
    // MARK: - Properties
    @StateObject private var viewModel: HoldingsViewModel
    @State private var showPortfolioSummaryDetails: Bool = false
    @State private var portfolioSummaryViewHeight: CGFloat = 0
    
    // MARK: - Init
    init(viewModel: HoldingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Main Body
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView("Loading Holdings...")
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error, retry: {
                        Task { await viewModel.loadHoldings() }
                    })
                } else {
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            HoldingsListSection(viewModel: viewModel)
                                .padding(.bottom, portfolioSummaryViewHeight)
                        }
                        
                        if let summary = viewModel.portfolioSummary {
                            VStack {
                                Spacer()
                                PortfolioSummaryCard(isExpanded: $showPortfolioSummaryDetails,
                                                     portfolioSummaryViewHeight: $portfolioSummaryViewHeight,
                                                     summary: summary)
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                                .shadow(color: .black.opacity(0.3), radius: 4, x: -1, y: -1)
                                .onTapGesture {
                                    showPortfolioSummaryDetails.toggle()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .ignoresSafeArea(edges: .bottom)
                        }
                    }
                }
            }
            .navigationTitle("My Holdings")
        }
        .task {
            await viewModel.loadHoldings()
        }
    }
}

struct ErrorView: View {
    let message: String
    let retry: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Oops!")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(message)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: retry) {
                Text("Retry")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
