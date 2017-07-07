//
//  UIPickerView+Separator.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import UIKit

public extension UIPickerView {
    
    private struct UIPickerViewAssociatedKeys {
        static var isSeperatorHidden = "isSeperatorHidden"
    }
    
    var isSeperatorHidden: Bool {
        get {
            if let bool = objc_getAssociatedObject(self, &UIPickerViewAssociatedKeys.isSeperatorHidden) as? Bool {
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
            objc_setAssociatedObject(isSeperatorHidden, &UIPickerViewAssociatedKeys.isSeperatorHidden, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
