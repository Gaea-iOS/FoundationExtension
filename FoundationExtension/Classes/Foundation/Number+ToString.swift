//
//  Number+ToString.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public enum NumberFormate: String {
    case twoDecimal = "%.2f"
    case oneDecimal = "%.1f"
}

public extension Double {
    func toString(with formate: NumberFormate) -> String {
        return String(format: formate.rawValue, self)
    }
}

public extension Float {
    func toString(with formate: NumberFormate) -> String {
        return String(format: formate.rawValue, self)
    }
}
