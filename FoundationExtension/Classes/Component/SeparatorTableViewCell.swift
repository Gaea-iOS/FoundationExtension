//
//  SeparatorTableViewCell.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import UIKit

open class SeparatorTableViewCell: UITableViewCell {
    
    public enum SeparatorPosition {
        case top
        case bottom
        case left
        case right
    }
    
    open var separatorPositions: [SeparatorPosition]?
    
    open var separatorWidth: CGFloat = 0.0
    
    open var separatorColor: UIColor?
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let positions = separatorPositions, positions.count > 0 else {return}
        guard let color = separatorColor else {return}
        guard separatorWidth > 0 else {return}
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(separatorWidth)
        context?.setStrokeColor(color.cgColor)
        context?.beginPath()
        
        if positions.contains(.top) {
            context?.move(to: .zero)
            context?.addLine(to: CGPoint(x: rect.width, y: 0))
            context?.strokePath()
        }
        
        if positions.contains(.left) {
            context?.move(to: .zero)
            context?.addLine(to: CGPoint(x: 0, y: rect.height))
            context?.strokePath()
        }
        
        if positions.contains(.bottom) {
            context?.move(to: CGPoint(x: 0, y: rect.height))
            context?.addLine(to: CGPoint(x: rect.width, y: rect.height))
            context?.strokePath()
        }
        
        if positions.contains(.right) {
            context?.move(to: CGPoint(x: rect.width, y: 0))
            context?.addLine(to: CGPoint(x: rect.width, y: rect.height))
            context?.strokePath()
        }
    }
}
