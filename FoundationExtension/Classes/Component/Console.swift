//
//  Console.swift
//  SwiftyBeaverDemo
//
//  Created by 王小涛 on 2017/5/23.
//  Copyright © 2017年 王小涛. All rights reserved.
//

import Foundation

public struct Console {
    
    public enum LogLevel: Int, CustomStringConvertible {
        case error = 0
        case warning = 1
        case info = 2
        case debug = 3
        case verbose = 4
        
        public var description: String {
            switch self {
            case .verbose:
                return "[VERBOSE]"
            case .debug:
                return "[DEBUG]"
            case .info:
                return "[INFO]"
            case .warning:
                return "[WARNING]"
            case .error:
                return "[ERROR]"
            }
        }
        
        var colorString: String {
            switch self {
            case .verbose:
                return "💜"
            case .debug:
                return "💚"
            case .info:
                return "💙"
            case .warning:
                return "💛"
            case .error:
                return "❤️"
            }
        }
    }
    
    public static var maxLevel = LogLevel.debug

    public static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()
    
    public static func log(_ level: LogLevel, message: @autoclosure () -> Any) {
        switch level {
        case .verbose:
            verbose(message)
        case .debug:
            debug(message)
        case .info:
            info(message)
        case .warning:
            warning(message)
        case .error:
            error(message)
        }
    }
    
    private static func verbose(_ value: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log(.verbose, value, file, function, line)
    }
    private static func debug(_ value: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log(.debug, value, file, function, line)
    }
    private static func info(_ value: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log(.info, value, file, function, line)
    }
    private static func warning(_ value: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log(.warning, value, file, function, line)
    }
    private static func error(_ value: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log(.error, value, file, function, line)
    }
    
    private static func log(_ level: LogLevel, _ value: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        guard level.rawValue <= maxLevel.rawValue else { return }
        let time = timeFormatter.string(from: Date())
        let filename = file.components(separatedBy: "/").last!
        let message = "\(filename):\(line) \(function) ———— \(value())"
        print("\(time) \(level.colorString) \(level) \(message)")
    }
}
