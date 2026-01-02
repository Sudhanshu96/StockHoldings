//
//  SummaryRowView.swift

import SwiftUI

struct SummaryRow: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(value)
                .font(.caption)
                .foregroundColor(color)
        }
    }
}
