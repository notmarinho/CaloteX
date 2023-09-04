//
//  Formatters.swift
//  CaloteX
//
//  Created by Mateus Marinho on 03/09/23.
//

import Foundation

func toCurrency(_ amount: Double) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "pt_BR")
    formatter.numberStyle = .currency

    if let formattedString = formatter.string(from: NSNumber(value: amount)) {
        return formattedString
    }

    return ""
}

func dateFormatter(_ date: Date, format: String? = nil) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt_BR")
    if let format = format {
        formatter.dateFormat = format
    } else {
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
    }

    return formatter.string(from: date)
}
