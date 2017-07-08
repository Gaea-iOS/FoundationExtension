//
//  UIButton+Markable.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

extension UIButton: Markable {
    public var markAttachView: UIView? {
        return imageView
    }
}
