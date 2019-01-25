//
//  Array+Extension.swift
//  FoundationExtension
//
//  Created by 王小涛 on 2019/1/17.
//

import Foundation

extension Array {

    public func first(_ n: Int) -> Array {
        return enumerated()
            .filter { $0.offset < n }
            .map { $0.element }
    }

    public func last(_ n: Int) -> Array {
        return enumerated()
            .filter { $0.offset >= count - n }
            .map { $0.element }
    }
}
