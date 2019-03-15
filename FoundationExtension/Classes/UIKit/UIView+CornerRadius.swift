//
//  UIView+CornerRadius.swift
//  FoundationExtension
//
//  Created by 王小涛 on 2019/3/15.
//

import UIKit

extension UIView {

    /**
     *  设置部分圆角(相对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     *  @param rect    需要设置的圆角view的rect，一般传bounds即可
     */

    func addRoundedCorners(_ corners: UIRectCorner, radii: CGSize, viewRect: CGRect) {
        let rounded = UIBezierPath(roundedRect: viewRect, byRoundingCorners: corners, cornerRadii: radii)
        let shape = CAShapeLayer()
        shape.path = rounded.cgPath
        layer.mask = shape
    }
}
