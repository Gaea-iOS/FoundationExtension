//
//  ImageTextAttachment.swift
//  FTLabel
//
//  Created by Luke on 12/1/15.
//  Copyright © 2015 geeklu.com. All rights reserved.
//

import Foundation

public enum ImageTextAttachmentVerticalAlignment {
    case bottom
    case center
}

/// 参考https://stackoverflow.com/questions/22647439/what-is-the-relationship-between-a-font-glyph-ascender-and-descender-in-ios

/// 使用ImageTextAttachment时最好配合FTLabel来用。
/// 原因是：如果使用UILabel，大部分情况下和用FTLabel的情况是等价的，但是有一种情况下会有bug，就是当numberOfLines = 1时(其他情况如numberOfLines = 0，numberOfLines = 2，都不会，亲测)，下面方法中的textContainer为nil，这样子无法拿到fontDesender，导致计算出来的y为0。
/// func attachmentBounds(for textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect

open class ImageTextAttachment: NSTextAttachment {
    
    open var imageSize: CGSize = .zero
    
    // 当imageSize为.zero时生效
    open var isImageScallToFitFontLineHeight: Bool = true
    
    open var attachmentTextVerticalAlignment: ImageTextAttachmentVerticalAlignment = .center
    
    open override func attachmentBounds(for textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        
        guard let image = image else {
            return super.attachmentBounds(for: textContainer, proposedLineFragment: lineFrag, glyphPosition: position, characterIndex: charIndex)
        }
        
        var attachmentSize: CGSize = .zero
        
        if !imageSize.equalTo(.zero) {
            attachmentSize = imageSize
        } else if isImageScallToFitFontLineHeight && image.size.height != 0 {
            let width = lineFrag.height * image.size.width / image.size.height
            attachmentSize = CGSize(width: width, height: lineFrag.height)
        } else {
            attachmentSize = image.size
        }

        var y: CGFloat = {
            let font = textContainer?.layoutManager?.textStorage?.attribute(NSFontAttributeName, at: charIndex, effectiveRange: nil) as? UIFont
            let fontDescender = font?.descender ?? 0
            return fontDescender
        }()

        switch self.attachmentTextVerticalAlignment {
        case .bottom:
            break
        case .center:
            y += (lineFrag.height - attachmentSize.height) / 2
        }
        
        return CGRect(origin: CGPoint(x: 0, y: y), size: attachmentSize)
    }
}
