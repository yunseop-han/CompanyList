//
//  Int+Extra.swift
//  CompanyList
//
//

import Foundation

extension Int {
    func formatString(_ format: NumberFormatter.Style = .decimal) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))
    }
}
