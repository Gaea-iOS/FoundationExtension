//
//  UIBarButtonItem+MarkValue.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UIBarButtonItem {
    private struct AssociatedObjectKey {
        static var markType = "AssociatedObjectKey_markType"
        static var markValue = "AssociatedObjectKey_markValue"
        static var markNumberColor = "AssociatedObjectKey_markNumberColor"
        static var markBackgroundColor = "AssociatedObjectKey_markBackgroundColor"
        static var markOffset = "AssociatedObjectKey_markOffset"
        static var markView = "AssociatedObjectKey_markView"
    }
    
    public var markType: MarkType {
        get {
            if let type = objc_getAssociatedObject(self, &AssociatedObjectKey.markType) as? MarkType {
                return type
            } else {
                return .dot
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markType, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markValue: Int {
        get {
            if let number = objc_getAssociatedObject(self, &AssociatedObjectKey.markValue) as? Int {
                return number
            } else {
                return 0
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markValue, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markBackgroundColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &AssociatedObjectKey.markBackgroundColor) as? UIColor {
                return color
            } else {
                return .red
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markBackgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markNumberColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &AssociatedObjectKey.markNumberColor) as? UIColor {
                return color
            } else {
                return .white
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markNumberColor, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markOffset: CGPoint {
        get {
            if let offset = objc_getAssociatedObject(self, &AssociatedObjectKey.markOffset) as? CGPoint {
                return offset
            } else {
                return .zero
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markOffset, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    fileprivate var markView: MarkView {
        if let view = objc_getAssociatedObject(self, &AssociatedObjectKey.markView) as? MarkView {
            return view
        } else {
            let view = MarkView()
            view.isHidden = true
            imageView?.addSubview(view)
            imageView?.bringSubview(toFront: view)
            imageView?.clipsToBounds = false
            objc_setAssociatedObject(self, &AssociatedObjectKey.markView, view, .OBJC_ASSOCIATION_RETAIN)
            return view
        }
    }
}

extension UIBarButtonItem {
    
    fileprivate func update() {
        
        guard let imageViewFrame = imageView?.frame else {return}
        
        markView.backgroundColor = markBackgroundColor
        markView.label.textColor = markNumberColor
        
        var text: String? {
            switch markType {
            case .dot:
                return nil
            case .number:
                return String(markValue)
            }
        }
        markView.label.text = text
        
        var frame: CGRect {
            switch markType {
            case .dot:
                let size = CGSize(width: 8, height: 8)
                var origin = CGPoint(x: imageViewFrame.width + 2, y: -2)
                origin.x += markOffset.x
                origin.y += markOffset.y
                return CGRect(origin: origin, size: size)
            case .number:
                let height: CGFloat = 14
                var size = markView.label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: height))
                size.width += 6
                size.width = max(size.width, height)
                size.height = height
                var origin = CGPoint(x: imageViewFrame.width - size.width / 2 + 2, y: -2)
                origin.x += markOffset.x
                origin.y += markOffset.y
                return CGRect(origin: origin, size: size)
            }
        }
        markView.frame = frame
        markView.layer.cornerRadius = frame.size.height / 2
            
        markView.isHidden = markValue > 0 ? false : true
    }
}

extension UIBarButtonItem {
    
    fileprivate var imageView: UIView? {
        return findFirstSubview(withClassName: "UIImageView")
    }
    
    private func findFirstSubview(withClassName className: String) -> UIView? {
        let subviews = self.subviews
        for subview in subviews {
            let subviewClassName = NSStringFromClass(type(of: subview))
            if subviewClassName == className {
                return subview
            }
        }
        return nil
    }
    
    private var view: UIView? {
        return value(forKey: "view") as? UIView
    }
    
    private var subviews: [UIView] {
        let subviews: [UIView] = view.flatMap { $0.subviews } ?? []
        return subviews
    }
}


