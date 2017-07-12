//
//  NameSpace.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/12.
//
//

import Foundation

public struct FoundationExtension<Base> {
    /// Base object to extend.
    public let base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has FoundationExtension extensions.
public protocol FoundationExtensionCompatible {
    /// Extended type
    associatedtype CompatibleType
    
    /// FoundationExtension extensions.
    static var fx: FoundationExtension<CompatibleType>.Type { get set }
    
    /// FoundationExtension extensions.
    var fx: FoundationExtension<CompatibleType> { get set }
}

extension FoundationExtensionCompatible {
    /// FoundationExtension extensions.
    public static var fx: FoundationExtension<Self>.Type {
        get {
            return FoundationExtension<Self>.self
        }
        set {
            // this enables using FoundationExtension to "mutate" base type
        }
    }
    
    /// FoundationExtension extensions.
    public var fx: FoundationExtension<Self> {
        get {
            return FoundationExtension(self)
        }
        set {
            // this enables using FoundationExtension to "mutate" base object
        }
    }
}

extension Double: FoundationExtensionCompatible {}
extension Float: FoundationExtensionCompatible {}
extension Int: FoundationExtensionCompatible {}
extension Int16: FoundationExtensionCompatible {}
extension Int32: FoundationExtensionCompatible {}
extension Int64: FoundationExtensionCompatible {}
extension UInt: FoundationExtensionCompatible {}
extension UInt16: FoundationExtensionCompatible {}
extension UInt32: FoundationExtensionCompatible {}
extension UInt64: FoundationExtensionCompatible {}

extension Date: FoundationExtensionCompatible {}
