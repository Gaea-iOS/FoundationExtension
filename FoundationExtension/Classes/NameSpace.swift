//
//  NameSpace.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/12.
//
//

import Foundation

public struct FoundationExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol FoundationExtensionCompatible {
    associatedtype CompatibleType
    var fx: CompatibleType { get }
}

public extension FoundationExtensionCompatible {
    public var fx: FoundationExtension<Self> {
        get { return FoundationExtension(self) }
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
