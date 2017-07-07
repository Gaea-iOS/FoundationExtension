//
//  String+ToNumber.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public extension String {
    
    var intValue: Int? {
        return Int(self)
    }
    
    var int16Value: Int16? {
        return Int16(self)
    }
    
    var int32Value: Int32? {
        return Int32(self)
    }
    
    var int64Value: Int64? {
        return Int64(self)
    }
    
    var uintValue: UInt? {
        return UInt(self)
    }
    
    var uint16Value: UInt16? {
        return UInt16(self)
    }
    
    var uint32Value: UInt32? {
        return UInt32(self)
    }
    
    var uint64Value: UInt64? {
        return UInt64(self)
    }
    
    var doubleValue: Double? {
        return Double(self)
    }
    
    var floatValue: Float? {
        return Float(self)
    }
}
