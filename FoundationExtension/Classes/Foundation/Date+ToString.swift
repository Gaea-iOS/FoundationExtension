//
//  Date+ToString.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

private let dateFormatter = DateFormatter()

extension Date {
    
    public func toString(by formate: String) -> String {
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: self)
    }
    
    public var timeIntervalInMillisecondSince1970: Int64 {
        let timeIntervalInSecond = timeIntervalSince1970
        return Int64(timeIntervalInSecond) * 1000
    }
}
