//
//  Array+Slice.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public extension Array {
    
    func slice(by byn: Int) -> [[Generator.Element]] {
        
        if count <= 0 {
            return []
        }
        
        if byn <= 0 || byn >= count {
            return [self]
        }
        
        if byn == 1 {
            return map({ (element) -> [Element] in
                return [element]
            })
        }
        
        var result: [[Element]] = []
        var group: [Element] = []
        
        for index in 0..<count {
            group.append(self[index])
            if index % byn == byn - 1 {
                result.append(group)
                group.removeAll()
            } else if index == count - 1 {
                result.append(group)
                group.removeAll()
            }
        }
        return result
    }
}
