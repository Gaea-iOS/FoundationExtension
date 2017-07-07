//
//  alert.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public func showAlert(in controller: UIViewController, title: String? = nil, message: String? = nil, items: [String], selected: ((String, Int) -> Void)? = nil) {
    
    let sheet = UIAlertController(title: title, message: message, preferredStyle: .alert)
    items.enumerated().forEach { value in
        let action = UIAlertAction(title: value.element, style: .default, handler: { _ in
            selected?(value.element, value.offset)
        })
        sheet.addAction(action)
    }
    controller.present(sheet, animated: true, completion: nil)
}

public func showActionSheet(in controller: UIViewController, title: String? = nil, message: String? = nil, items: [String], selected: ((String, Int) -> Void)? = nil) {
    
    let sheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    items.enumerated().forEach { value in
        let action = UIAlertAction(title: value.element, style: .default, handler: { _ in
            selected?(value.element, value.offset)
        })
        sheet.addAction(action)
    }
    controller.present(sheet, animated: true, completion: nil)
}
