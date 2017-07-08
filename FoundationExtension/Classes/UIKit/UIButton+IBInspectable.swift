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

extension UIButton {
    
    private struct AssociatedObject {
        static var backgroundColorForNormal = "AssociatedObject_backgroundColorForNormal"
        static var backgroundColorForHighlighted = "AssociatedObject_backgroundColorForHighlighted"
        static var backgroundColorForSelected = "AssociatedObject_backgroundColorForSelected"
        static var backgroundColorForDisabled = "AssociatedObject_backgroundColorForDisabled"
    }
    
    @IBInspectable
    public var backgroundColorForNormal: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObject.backgroundColorForNormal) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .normal)
            } else {
                setBackgroundImage(nil, for: .normal)
            }
            objc_setAssociatedObject(self, &AssociatedObject.backgroundColorForNormal, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    public var backgroundColorForHighlighted: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObject.backgroundColorForHighlighted) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .highlighted)
            } else {
                setBackgroundImage(nil, for: .highlighted)
            }
            objc_setAssociatedObject(self, &AssociatedObject.backgroundColorForHighlighted, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    public var backgroundColorForSelected: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObject.backgroundColorForSelected) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .selected)
            } else {
                setBackgroundImage(nil, for: .selected)
            }
            objc_setAssociatedObject(self, &AssociatedObject.backgroundColorForSelected, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable
    public var backgroundColorForDisabled: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObject.backgroundColorForDisabled) as? UIColor
        }
        set {
            if let color = newValue {
                setBackgroundImage(UIImage.from(color), for: .disabled)
            } else {
                setBackgroundImage(nil, for: .disabled)
            }
            objc_setAssociatedObject(self, &AssociatedObject.backgroundColorForDisabled, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
