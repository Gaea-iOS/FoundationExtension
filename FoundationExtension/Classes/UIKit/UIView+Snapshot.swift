//
//  UIView+Snapshot.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UIView {
    
    var snapshotImage: UIImage {
        UIGraphicsBeginImageContext(bounds.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
}
