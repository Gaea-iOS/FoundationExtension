//
//  UIImage+FromColor.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

extension UIImage {
    
    public static func from(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(rect.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
}
