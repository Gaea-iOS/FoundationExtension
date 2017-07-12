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

extension FoundationExtension where Base == TimeInterval {
    public var seconds: TimeStampUnit {
        return .second(base)
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(base)
    }
}

extension FoundationExtension where Base == Float {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == Int {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == Int16 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == Int32 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == Int64 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == UInt {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == UInt16 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == UInt32 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

extension FoundationExtension where Base == UInt64 {
    public var seconds: TimeStampUnit {
        return .second(TimeInterval(base))
    }
    public var milliseconds: TimeStampUnit {
        return .millisecond(TimeInterval(base))
    }
}

