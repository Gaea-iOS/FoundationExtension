//
//  DDButton.swift
//  FoundationExtension
//
//  Created by 王小涛 on 2019/1/16.
//

import UIKit

open class DDButton: UIButton {

    public enum ImagePosition {
        case left
        case right
        case top
    }

    open var imagePosition: ImagePosition = .left {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }

    open var spacing: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        guard let imageView = imageView,
            let titleLabel = titleLabel else {
                return
        }

        let half = spacing / 2

        switch imagePosition {
        case .left:
            titleOffset = CGPoint(x: half, y: 0)
            imageOffset = CGPoint(x: -half, y: 0)
        case .right:
            titleOffset = CGPoint(x: -(imageView.bounds.width + half), y: 0)
            imageOffset = CGPoint(x: titleLabel.bounds.width + half, y: 0)
        case .top:
            titleOffset = CGPoint(x: -(imageView.bounds.width / 2), y: imageView.bounds.height / 2 + half)
            imageOffset = CGPoint(x: titleLabel.bounds.width / 2, y: -(titleLabel.bounds.height / 2 + half))
        }
    }
}

extension DDButton {

    private var titleOffset: CGPoint {
        get {
            fatalError("\(#function) not implemented")
        }
        set {
            titleEdgeInsets = UIEdgeInsets(top: newValue.y, left: newValue.x, bottom: -newValue.y, right: -newValue.x)
        }
    }

    private var imageOffset: CGPoint {
        get {
            fatalError("\(#function) not implemented")
        }
        set {
            imageEdgeInsets = UIEdgeInsets(top: newValue.y, left: newValue.x, bottom: -newValue.y, right: -newValue.x)
        }
    }
}
