//
//  UIButton+IBDesignable.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

// @IBDesignable crashing agent
// https://stackoverflow.com/questions/31265906/ibdesignable-crashing-agent

import UIKit

public extension UIButton {
    
    private struct IBDesignableVarKeys {
        static var backgroundColorForNormal = "backgroundColorForNormal"
        static var backgroundColorForHighlighted = "backgroundColorForHighlighted"
        static var backgroundColorForSelected = "backgroundColorForSelected"
        static var backgroundColorForDisabled = "backgroundColorForDisabled"
    }
    
    @IBInspectable
    var backgroundColorForNormal: UIColor? {
        get {
            return objc_getAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForNormal) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .normal)
            } else {
                setBackgroundImage(nil, for: .normal)
            }
            objc_setAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForNormal, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    var backgroundColorForHighlighted: UIColor? {
        get {
            return objc_getAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForHighlighted) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .highlighted)
            } else {
                setBackgroundImage(nil, for: .highlighted)
            }
            objc_setAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForHighlighted, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    var backgroundColorForSelected: UIColor? {
        get {
            return objc_getAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForSelected) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .selected)
            } else {
                setBackgroundImage(nil, for: .selected)
            }
            objc_setAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForSelected, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    var backgroundColorForDisabled: UIColor? {
        get {
            return objc_getAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForDisabled) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .disabled)
            } else {
                setBackgroundImage(nil, for: .disabled)
            }
            objc_setAssociatedObject(self, &IBDesignableVarKeys.backgroundColorForDisabled, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
