//
//  NSAttributedString+Height.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public extension NSAttributedString {
    
    func height(`for` font: UIFont, preferredMaxLayoutWidth: CGFloat) -> CGFloat {
        
        let label = UILabel(frame: .zero)
        label.attributedText = self
        label.numberOfLines = 0
        label.font = font
        label.sizeToFit()
        label.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return label.frame.height
    }
}
