//
//  String+Height.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public extension String {

    func height(`for` font: UIFont, preferredMaxLayoutWidth: CGFloat) -> CGFloat {
    
        let label = UILabel(frame: .zero)
        label.text = self
        label.numberOfLines = 0
        label.font = font
        label.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        label.sizeToFit()
        return label.frame.height
    }
}
