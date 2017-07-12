//
//  Date+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/12.
//
//

import Foundation

struct TimeStamp {
    static let secondInMinute: TimeInterval = 60
    static let secondsInHour: TimeInterval = 60 * secondInMinute
    static let secondsInDay: TimeInterval = 24 * secondsInHour
    static let secondsInWeek: TimeInterval = 7 * secondsInDay
}

extension FoundationExtension where Base == Date {
        
    public var isToday: Bool {
        return base.fx.isEqualToIgnoringTime(Date())
    }
    
    public var isYesterday: Bool {
        return base.fx.isEqualToIgnoringTime(Date.yesterday())
    }
    
    public var isTomorrow: Bool {
        return base.fx.isEqualToIgnoringTime(Date.tomorrow())
    }
    
    public var isThisMonth: Bool {
        let date = Date()
        return base.year == date.year && base.month == date.month
    }
    
    public var isThisYear: Bool {
        return base.year == Date().year
    }
    
    public var isInFuture: Bool {
        return base.fx.isLaterThanIgnoringTime(Date())
    }
    
    public var isInPast: Bool {
        return base.fx.isEarlierThanIgnoringTime(Date())
    }
    
    public var beginning: Date {
        return Date(year: base.year, month: base.month, day: base.day)
    }
    
    public var ending: Date {
        return Date(year: base.year, month: base.month, day: base.day, hour: 23, minute: 59, second: 59)
    }
}

extension FoundationExtension where Base == Date {
    
    public func isEqualToIgnoringTime(_ date: Date) -> Bool {
        return base.year == date.year && base.month == date.month && base.day == date.day
    }

    public func isEarlierThanIgnoringTime(_ date: Date) -> Bool {
        return base.year < date.year
            || (base.year == date.year && base.month < date.month)
            || (base.year == date.year && base.month == date.month && base.day < date.day)
    }
    
    public func isLaterThanIgnoringTime(_ date: Date) -> Bool {
        return base.year > date.year
            || (base.year == date.year && base.month > date.month)
            || (base.year == date.year && base.month == date.month && base.day > date.day)
    }
}

extension FoundationExtension where Base == Date {
    
    public func addingSeconds(_ seconds: Int) -> Date {
        return (base + seconds.seconds)!
    }
    
    public func addingMinutes(_ minutes: Int) -> Date {
        return (base + minutes.minutes)!
    }
    
    public func addingHours(_ hours: Int) -> Date {
        return (base + hours.hours)!
    }
    
    public func addingDays(_ days: Int) -> Date {
        return (base + days.days)!
    }
    
    public func addingMonths(_ months: Int) -> Date {
        return (base + months.months)!
    }
    
    public func addingYears(_ years: Int) -> Date {
        return (base + years.years)!
    }
}

func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSinceReferenceDate == rhs.timeIntervalSinceReferenceDate
}

func >(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
}

func <(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSinceReferenceDate < rhs.timeIntervalSinceReferenceDate
}

func >=(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSinceReferenceDate >= rhs.timeIntervalSinceReferenceDate
}

func <=(lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSinceReferenceDate <= rhs.timeIntervalSinceReferenceDate
}

