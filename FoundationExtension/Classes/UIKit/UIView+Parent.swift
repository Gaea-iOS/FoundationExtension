//
//  UIView+Parent.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import UIKit

extension UIView {
    
    public var parentViewController: UIViewController? {
        get {
            var nextResponder = self.next
            while nextResponder != nil  {
                if let nextResponder = nextResponder as? UIViewController {
                    return nextResponder
                }
                nextResponder = nextResponder?.next
            }
            return nil
        }
    }
    
    public var parentTableView: UITableView? {
        get {
            var superview = self.superview
            while superview != nil {
                if let superview = superview as? UITableView {
                    return superview
                }
                superview = superview?.superview
            }
            return nil
        }
    }
    
    public var parentCollectionView: UICollectionView? {
        get {
            var superview = self.superview
            while superview != nil {
                if let superview = superview as? UICollectionView {
                    return superview
                }
                superview = superview?.superview
            }
            return nil
        }
    }
}
