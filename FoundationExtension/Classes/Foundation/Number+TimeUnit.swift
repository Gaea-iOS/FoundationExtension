//
//  Number+TimeUnit.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public enum TimeUnit {
    case second(TimeInterval)
    case millisecond(TimeInterval)
}

public extension TimeUnit {
    
    func toDate() -> Date {
        switch self {
        case let .second(timestamp):
            return Date(timeIntervalSince1970: timestamp)
        case let .millisecond(timestamp):
            return Date(timeIntervalSince1970: timestamp / 1000)
        }
    }
    
    func toDateString<T: RawRepresentable>(by formate: T) -> String? where T.RawValue == String {
        return toDate().toString(by: formate.rawValue)
    }
}

public extension TimeInterval {
    var seconds: TimeUnit {
        return .second(self)
    }
    var milliseconds: TimeUnit {
        return .millisecond(self)
    }
}

public extension Int {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension Int16 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension Int32 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension Int64 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension UInt {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension UInt16 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension UInt32 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension UInt64 {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}

public extension Float {
    var seconds: TimeUnit {
        return .second(TimeInterval(self))
    }
    var milliseconds: TimeUnit {
        return .millisecond(TimeInterval(self))
    }
}
