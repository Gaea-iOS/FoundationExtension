//
//  String+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/9/3.
//
//

import Foundation

extension String {
    
    var length: Int {
        return (self as NSString).length
    }
    
    func trimmingWhitespacesAndNewlines() -> String {
        let characterSet: CharacterSet = .whitespacesAndNewlines
        return trimmingCharacters(in: characterSet)
    }
}

extension String {

    var isEmptyOrInvisibleString: Bool {
        return trimmingWhitespacesAndNewlines().isEmpty
    }
}
