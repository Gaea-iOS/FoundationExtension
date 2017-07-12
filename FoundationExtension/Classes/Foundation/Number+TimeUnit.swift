//
//  Number+TimeUnit.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public enum TimeStampUnit {
    case second(TimeInterval)
    case millisecond(TimeInterval)
}

extension TimeStampUnit {
    
    public func toDate() -> Date {
        switch self {
        case let .second(timestamp):
            return Date(timeIntervalSince1970: timestamp)
        case let .millisecond(timestamp):
            return Date(timeIntervalSince1970: timestamp / 1000)
        }
    }
    
    public func toDateString<T: RawRepresentable>(by formate: T) -> String? where T.RawValue == String {
        return toDate().toString(by: formate.rawValue)
    }
}

extension TimeInterval {
    public var seconds: TimeStampUnit {
        return .second(self)
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(self)
    }
}

extension Float {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension Int {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension Int16 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension Int32 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension Int64 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension UInt {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension UInt16 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension UInt32 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

extension UInt64 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(self))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(self))
    }
}

