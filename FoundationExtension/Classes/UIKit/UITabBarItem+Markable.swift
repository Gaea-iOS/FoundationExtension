//
//  UITabBarItem+Markable.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UITabBarItem: Markable {
    public var markAttachView: UIView? {
        return swappableImageView
    }
}

extension UITabBarItem {
    
    fileprivate var swappableImageView: UIView? {
        return findFirstSubview(withClassName: "UITabBarSwappableImageView")
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


