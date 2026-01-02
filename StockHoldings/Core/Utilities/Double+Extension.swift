//
//  Double+Extension.swift

import Foundation

extension Double {
    func asCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₹"
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "₹0.00"
    }
    
    func asPercentage() -> String {
        String(format: "%.2f", self)
    }
}
