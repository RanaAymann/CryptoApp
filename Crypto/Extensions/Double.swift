//
//  Double.swift
//  Crypto
//
//  Created by Rana Ayman on 17/10/2023.
//

import Foundation

extension Double {


    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }


    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return  currencyFormatter2.string(from: number) ?? "$0.00"
    }


    // converts a Double into Currency with 2-6 decimal places
    /// 12.3456 -> $12.3456

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        // default values
//        formatter.locale = .current
//        formatter.currencyCode = "usd"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    // converts a Double into Currency as a String with 2-6 decimal places
    /// 12.3456  -> " $12.3456"

    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return  currencyFormatter.string(from: number) ?? "$0.00"
    }

    // converts a Double into String representation
    /// 1.2345 -> "1.23"

    func asNumberString () -> String  {
        // "%.2f" means two decimal places
        return String(format:"%.2f",self)
    }


    // converts a Double into String representation with perecent symbol
    /// 1.2345 -> "1.23%"

    func asPercentString() -> String {
        return asNumberString() + "%"
    }

}

