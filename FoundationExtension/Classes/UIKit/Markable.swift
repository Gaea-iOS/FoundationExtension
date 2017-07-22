//
//  Markable.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

private struct AssociatedObjectKey {
    static var markType = "AssociatedObjectKey_markType"
    static var markValue = "AssociatedObjectKey_markValue"
    static var markNumberColor = "AssociatedObjectKey_markNumberColor"
    static var markBackgroundColor = "AssociatedObjectKey_markBackgroundColor"
    static var markPosition = "AssociatedObjectKey_markPosition"
    static var markView = "AssociatedObjectKey_markView"
}

public enum MarkType {
    case dot
    case number
}

public enum MarkPosition {
    case topRight(CGPoint)
    case topLeft(CGPoint)
}

public protocol Markable: class {
    var markType: MarkType {get set}
    var markValue: String? {get set}
    var markNumberColor: UIColor? {get set}
    var markBackgroundColor: UIColor? {get set}
    var markPosition: MarkPosition {get set}
    var markAttachView: UIView? {get}
}

extension Markable {
    
    public var markType: MarkType {
        get {
            if let type = objc_getAssociatedObject(self, &AssociatedObjectKey.markType) as? MarkType {
                return type
            } else {
                return .dot
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markType, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markValue: String? {
        get {
            if let value = objc_getAssociatedObject(self, &AssociatedObjectKey.markValue) as? String {
                return value
            } else {
                return nil
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markValue, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markBackgroundColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &AssociatedObjectKey.markBackgroundColor) as? UIColor {
                return color
            } else {
                return .red
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markBackgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markNumberColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &AssociatedObjectKey.markNumberColor) as? UIColor {
                return color
            } else {
                return .white
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markNumberColor, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    public var markPosition: MarkPosition {
        get {
            if let position = objc_getAssociatedObject(self, &AssociatedObjectKey.markPosition) as? MarkPosition {
                return position
            } else {
                return .topRight(.zero)
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.markPosition, newValue, .OBJC_ASSOCIATION_RETAIN)
            update()
        }
    }
    
    fileprivate var markView: MarkView {
        if let view = objc_getAssociatedObject(self, &AssociatedObjectKey.markView) as? MarkView {
            return view
        } else {
            let view = MarkView()
            view.isHidden = true
            objc_setAssociatedObject(self, &AssociatedObjectKey.markView, view, .OBJC_ASSOCIATION_RETAIN)
            return view
        }
    }
    
    fileprivate func update() {
        
        guard let markAttachView = markAttachView else {return}
        markView.removeFromSuperview()
        markAttachView.addSubview(markView)
        markAttachView.bringSubview(toFront: markView)
        markAttachView.clipsToBounds = false
        
        let attachViewFrame = markAttachView.frame
        
        markView.backgroundColor = markBackgroundColor
        markView.label.textColor = markNumberColor
        
        let text: String? = {
            switch markType {
            case .dot:
                return nil
            case .number:
                return markValue
            }
        }()
        markView.label.text = text
        
        let size: CGSize = {
            
            switch markType {
            case .dot:
                let size = CGSize(width: 8, height: 8)
                return size
            case .number:
                let height: CGFloat = 14
                var size = markView.label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: height))
                size.width += 6
                size.width = max(size.width, height)
                size.height = height
                return size
            }
        }()
        
        let numberAdjugeOffset = CGPoint(x: 2, y: 2)
        
        let origin: CGPoint = {
            switch markPosition {
            case let .topRight(offset):
                switch markType {
                case .dot:
                    var origin = CGPoint(x: attachViewFrame.width, y: -(size.height / 2))
                    origin.x += offset.x
                    origin.y += offset.y
                    return origin
                case .number:
                    var origin = CGPoint(x: attachViewFrame.width - size.width / 2 + numberAdjugeOffset.x,
                                         y: -(size.height / 2) + numberAdjugeOffset.y)
                    origin.x += offset.x
                    origin.y += offset.y
                    return origin
                }
                
            case let .topLeft(offset):
                switch markType {
                case .dot:
                    var origin = CGPoint(x: -size.width, y: -(size.height / 2))
                    origin.x += offset.x
                    origin.y += offset.y
                    return origin
                case .number:
                    var origin = CGPoint(x: -(size.width / 2) - numberAdjugeOffset.x,
                                         y:  -(size.height / 2) + numberAdjugeOffset.y)
                    origin.x += offset.x
                    origin.y += offset.y
                    return origin
                }
            }
        }()
        
        let frame = CGRect(origin: origin, size: size)
        
        markView.frame = frame
        markView.layer.cornerRadius = frame.size.height / 2
        
        markView.isHidden = (markValue == nil ? true : false)
    }
    
}

class MarkView: UIView {
    
    private(set) lazy var label: UILabel = { [unowned self] in
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .center
        self.addSubview(label)
        self.clipsToBounds = true
        return label
        }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
