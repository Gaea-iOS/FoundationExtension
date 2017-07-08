//
//  String+ToNumber.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

extension String {
    
    public var intValue: Int? {
        return Int(self)
    }
    
    public var int16Value: Int16? {
        return Int16(self)
    }
    
    public var int32Value: Int32? {
        return Int32(self)
    }
    
    public var int64Value: Int64? {
        return Int64(self)
    }
    
    public var uintValue: UInt? {
        return UInt(self)
    }
    
    public var uint16Value: UInt16? {
        return UInt16(self)
    }
    
    public var uint32Value: UInt32? {
        return UInt32(self)
    }
    
    public var uint64Value: UInt64? {
        return UInt64(self)
    }
    
    public var doubleValue: Double? {
        return Double(self)
    }
    
    public var floatValue: Float? {
        return Float(self)
    }
}
