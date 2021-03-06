//
//  UIBarButtonItem+Markable.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UIBarButtonItem: Markable {
    public var markAttachView: UIView? {
        return imageView
    }
}

extension UIBarButtonItem {
    
    fileprivate var imageView: UIView? {
//        return findFirstSubview(withClassName: "UIImageView")
        if let view = findFirstSubview(withClassName: "UIImageView") {
            return view
        } else {
            return findFirstSubview(withClassName: "_UIModernBarButton")
        }
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


