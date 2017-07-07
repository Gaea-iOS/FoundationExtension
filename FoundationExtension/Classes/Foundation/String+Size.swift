//
//  String+Size.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public extension String {

    func size(`in` constraintedSize: CGSize, font: UIFont) -> CGSize {
        let label = UILabel(frame: CGRect(origin: .zero, size: constraintedSize))
        label.text = self
        label.numberOfLines = 0
        label.font = font
        label.sizeToFit()
        let size = label.frame.size
        return size
    }
}
