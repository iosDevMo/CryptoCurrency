//
//  Double.swift
//  CryptoCurrency
//
//  Created by mohamdan on 22/11/2023.
//

import Foundation
extension Double{
    private var currencyFormatter : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter
    }
    private var numberFormatter : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter
    }
    func toCurrency ()-> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    func toPercentString ()-> String {
        guard let numberString = numberFormatter.string(for: self) else {return ""}
        return numberString + "%"
    }
}

