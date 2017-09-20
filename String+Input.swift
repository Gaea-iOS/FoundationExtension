//
//  String+Input.swift
//  Pods
//
//  Created by 王小涛 on 2017/9/2.
//
//

import Foundation

extension Optional where Wrapped == String {
    
    var isEmptyOrInvisibleString: Bool {
        switch self {
        case .none:
            return false
        case let .some(value):
            return value.isEmptyOrInvisibleString
        }
    }
    
    var isValidPhone: Bool {
        switch self {
        case .none:
            return false
        case let .some(value):
            return value.isValidPhone
        }
    }
}

extension String {
    
    var isValidPhone: Bool {
        let regular = try! NSRegularExpression(pattern: "^1\\d{10}$")
        return regular.numberOfMatches(in: self, range: NSMakeRange(0, length)) > 0
    }
}

extension Optional where Wrapped == String {
    
    var string: String {
        switch self {
        case .none:
            return ""
        case let .some(value):
            return value
        }
    }
}

extension Optional where Wrapped == Int {
    
    var int: Int {
        switch self {
        case .none:
            return 0
        case let .some(value):
            return value
        }
    }
}
