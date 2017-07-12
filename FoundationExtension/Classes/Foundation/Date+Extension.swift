//
//  Date+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/12.
//
//

import Foundation

fileprivate struct TimeStamp {
    static let secondInMinute: TimeInterval = 60
    static let secondsInHour: TimeInterval = 60 * secondInMinute
    static let secondsInDay: TimeInterval = 24 * secondsInHour
    static let secondsInWeek: TimeInterval = 7 * secondsInDay
}

extension Date {
    
    private var allComponents: Set<Calendar.Component> {
        return [
            .era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .weekdayOrdinal, .quarter, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .calendar, .timeZone
        ]
    }
    
    fileprivate var calendar: Calendar {
        return Calendar.current
    }
    
    fileprivate var dateComponents: DateComponents {
        return calendar.dateComponents(allComponents, from: self)
    }
    
    private init(era: Int?, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int, on calendar: Calendar) {
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
        self = Date(timeInterval: 0, since: date)
    }
    
    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, nanosecond: Int = 0) {
        self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, on: .current)
    }
    
    public init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }
}

extension Date {
    
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


extension Date {
    
    public var isToday: Bool {
        return calendar.isDateInToday(self)
    }
    
    public var isYesterday: Bool {
        return calendar.isDateInYesterday(self)
    }
    
    public var isTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }
    
    public var isWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }
    
    public var isThisMonth: Bool {
        return isInSameMonthAs(Date())
    }
    
    public var isThisYear: Bool {
        return isInSameYearAs(Date())
    }
    
    public var start: Date {
        return calendar.startOfDay(for: self)
    }
}

extension Date {
    
    public func isInSameYearAs(_ date: Date) -> Bool {
        return calendar.compare(self, to: date, toGranularity: .year) == .orderedSame
    }
    
    public func isInSameMonthAs(_ date: Date) -> Bool {
        return calendar.compare(self, to: date, toGranularity: .month) == .orderedSame
    }
    
    public func isInSameDayAs(_ date: Date) -> Bool {
        return calendar.compare(self, to: date, toGranularity: .day) == .orderedSame
        // return calendar.isDate(base, inSameDayAs: date)
    }
    
    public func isAfterDateIgnoringTime(date: Date) -> Bool {
        return calendar.compare(self, to: date, toGranularity: .day) == .orderedDescending
    }
    
    public func isBeforeDateIgoringTime(date: Date) -> Bool {
        return calendar.compare(self, to: date, toGranularity: .day) == .orderedAscending
    }
}

extension Date {
    
    public func days(toDate date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: self, to: date)
        return components.day ?? 0
    }
    
    public func days(fromDate date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date, to: self)
        return components.day ?? 0
    }
}

extension Date {

    public func changed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, nanosecond: Int? = nil) -> Date? {
        var dateComponents = self.dateComponents
        dateComponents.year = year ?? self.year
        dateComponents.month = month ?? self.month
        dateComponents.day = day ?? self.day
        dateComponents.hour = hour ?? self.hour
        dateComponents.minute = minute ?? self.minute
        dateComponents.second = second ?? self.second
        dateComponents.nanosecond = nanosecond ?? self.nanosecond
        
        return calendar.date(from: dateComponents)
    }
}

extension Date {
        
    public func addingDays(_ days: Int) -> Date {
        return calendar.date(byAdding: DateComponents(day: days), to: self)!
    }
    
    public func addingMonths(_ months: Int) -> Date {
        return calendar.date(byAdding: DateComponents(month: months), to: self)!
    }

    public func addingYears(_ years: Int) -> Date {
        return calendar.date(byAdding: DateComponents(year: years), to: self)!
    }
}

extension Date {
    
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
