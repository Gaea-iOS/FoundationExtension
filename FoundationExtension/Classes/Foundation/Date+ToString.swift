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
    
    public var prettyString: String {
        let today = Date()
        let seconds = Int64(timeIntervalSinceNow)
        let subfix = seconds < 0 ? "前" : "后"
        if abs(seconds) < 60 {
            return "刚刚"
        } else if abs(seconds) < 60 * 60 {
            let minites = seconds / 60
            return "\(abs(minites))分钟" + subfix
        } else if abs(seconds) < 60 * 60 * 24 {
            let hours = seconds / (60 * 60)
            return "\(abs(hours))小时" + subfix
        } else {
            if seconds < 0 && isYesterday {
                return toString(by: "昨天 HH:mm")
            } else if seconds > 0 && isTomorrow {
                return toString(by: "明天 HH:mm")
            } else if abs(days(toDate: today)) < 4  {
                let n = abs(days(toDate: today))
                return toString(by: "\(n)天\(subfix) HH:mm")
            } else if isThisYear {
                return toString(by: "MM月dd日 HH:mm")
            } else {
                return toString(by: "yyyy年MM月dd日")
            }
        }
    }
}
