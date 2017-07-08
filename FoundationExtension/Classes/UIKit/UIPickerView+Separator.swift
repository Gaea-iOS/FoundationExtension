//
//  UIPickerView+Separator.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import UIKit

extension UIPickerView {
    
    private struct AssociatedKeys {
        static var isSeperatorHidden = "AssociatedKeys_isSeperatorHidden"
    }
    
    public var isSeperatorHidden: Bool {
        get {
            if let bool = objc_getAssociatedObject(self, &AssociatedKeys.isSeperatorHidden) as? Bool {
                return bool
            } else {
                return false
            }
        }
        set {
            subviews.forEach {
                if $0.bounds.height < 1 {
                    $0.isHidden = newValue
                }
            }
            objc_setAssociatedObject(isSeperatorHidden, &AssociatedKeys.isSeperatorHidden, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
