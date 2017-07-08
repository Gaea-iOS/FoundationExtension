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

extension Double {
    public func toString(with formate: NumberFormate) -> String {
        return String(format: formate.rawValue, self)
    }
}

extension Float {
    public func toString(with formate: NumberFormate) -> String {
        return String(format: formate.rawValue, self)
    }
}
