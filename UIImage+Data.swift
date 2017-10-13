//
//  UIImage+Data.swift
//  FoundationExtension
//
//  Created by 王小涛 on 2017/10/13.
//

import Foundation

extension UIImage {
    public var data: Data? {
        if let data = UIImageJPEGRepresentation(self, 1.0) {
            return data
        } else {
            return UIImagePNGRepresentation(self)
        }
    }
}
