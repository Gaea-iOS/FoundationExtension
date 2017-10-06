//
//  PlaceholderTextView.swift
//  FoundationExtension
//
//  Created by 王小涛 on 2017/10/6.
//

import UIKit

public class PlaceholderTextView: UITextView {
    
    @IBInspectable public var placeholder: String? {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var placeholderColor: UIColor?
    @IBInspectable public var placeholderOffset: CGPoint = CGPoint(x: 5, y: 10)
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewTextDidChangeNotification(sender:)), name: .UITextViewTextDidChange, object: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewTextDidChangeNotification(sender:)), name: .UITextViewTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func textViewTextDidChangeNotification(sender: NSNotification) {
        setNeedsDisplay()
    }
    
    override public func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        guard text.lengthOfBytes(using: String.Encoding.utf8) == 0 else {
            return
        }
        
        guard let placeholder = placeholder else {
            return
        }
        
        let constraintSize = CGSize(width: rect.width-20, height: rect.height)
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: font ?? UIFont.systemFont(ofSize: 15)]
        let size = placeholder.boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        let height = size.height
        let placeholderRect = CGRect(x: placeholderOffset.x, y: placeholderOffset.y, width: bounds.width, height: height)
        
        (placeholder as NSString).draw(in: placeholderRect, withAttributes: attributes)
    }
}
