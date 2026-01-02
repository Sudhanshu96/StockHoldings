//
//  HoldingsListSection.swift

import SwiftUI

struct HoldingsListSection: View {
    @ObservedObject var viewModel: HoldingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.holdings) { holding in
                HoldingCard(holding: holding)
            }
        }
    }
}
