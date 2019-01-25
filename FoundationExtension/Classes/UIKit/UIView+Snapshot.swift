//
//  UIView+Snapshot.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UIView {
    
    public var snapshotImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
}
