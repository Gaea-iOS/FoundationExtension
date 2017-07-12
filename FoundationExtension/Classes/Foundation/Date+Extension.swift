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
    
    private var allComponents: Set<Calendar.Component> {
        return [
            .era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .weekdayOrdinal, .quarter, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .calendar, .timeZone
        ]
    }
    
    fileprivate var calendar: Calendar {
        return Calendar.current
    }
    
    fileprivate var dateComponents: DateComponents {
        return calendar.dateComponents(allComponents, from: base)
    }
    
    public init(era: Int?, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, on calendar: Calendar) {
        let now = Date()
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        dateComponents.era = era
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = nanosecond
        let date = calendar.date(from: dateComponents)!
        base = Date(timeInterval: 0, since: date)
    }
    
        public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
            self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, on: .current)
        }

        public init(year: Int, month: Int, day: Int) {
            self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        }
}

extension FoundationExtension where Base == Date {

    public var year: Int {
        return dateComponents.year!
    }
    
    public var month: Int {
        return dateComponents.month!
    }
    
    public var day: Int {
        return dateComponents.day!
    }
    
    public var hour: Int {
        return dateComponents.hour!
    }
    
    public var minute: Int {
        return dateComponents.minute!
    }
    
    public var second: Int {
        return dateComponents.second!
    }
    
    public var nanosecond: Int {
        return dateComponents.nanosecond!
    }
    
    public var weekday: Int {
        return dateComponents.weekday!
    }
    
    public var weekOfMonth: Int {
        return dateComponents.weekOfMonth!
    }
    
    public var weekOfYear: Int {
        return dateComponents.weekOfYear!
    }
}


extension FoundationExtension where Base == Date {
        
    public var isToday: Bool {
        return calendar.isDateInToday(base)
    }
    
    public var isYesterday: Bool {
        return calendar.isDateInYesterday(base)
    }
    
    public var isTomorrow: Bool {
        return calendar.isDateInTomorrow(base)
    }
    
    public var isWeekend: Bool {
        return calendar.isDateInWeekend(base)
    }
    
    public var isThisMonth: Bool {
        let now = Date()
        return year == now.fx.year && month == now.fx.month
    }
    
    public var isThisYear: Bool {
        return isInSameYearAs(Date())
    }
    
    public var start: Date {
        return calendar.startOfDay(for: base)
    }
}

extension FoundationExtension where Base == Date {

    func isInSameYearAs(_ date: Date) -> Bool {
        return year == date.fx.year
    }
    
    func isInSameMonthAs(_ date: Date) -> Bool {
        return year == date.fx.year && month == date.fx.month
    }
    
    func isAfterDateIgnoringTime(date: Date) -> Bool {
        return (year > date.fx.year)
            || (year == date.fx.year && month > date.fx.month)
            || (year == date.fx.year && month == date.fx.month && day > date.fx.day)
    }
    
    func isBeforeDateIgoringTime(date: Date) -> Bool {
        return (year < date.fx.year)
            || (year == date.fx.year && month < date.fx.month)
            || (year == date.fx.year && month == date.fx.month && day < date.fx.day)
    }
}

extension FoundationExtension where Base == Date {
    
    func days(toDate date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: base, to: date)
        return components.day ?? 0
    }
    
    func days(fromDate date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date, to: base)
        return components.day ?? 0
    }
}

extension FoundationExtension where Base == Date {
    
    public func isInSameDayAs(_ date: Date) -> Bool {
        return calendar.isDate(base, inSameDayAs: date)
    }
}

extension FoundationExtension where Base == Date {

    public static func days(inYear year: Int, month: Int) -> Int {
        
        let calendar = Calendar.current
        
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.date(from: startComps)!
        let endDate = calendar.date(from: endComps)!
        
        let diff = calendar.dateComponents([.day], from: startDate, to: endDate)
        return diff.day!
    }
}
