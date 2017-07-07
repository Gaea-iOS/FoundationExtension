//
//  delay.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation

public typealias Task = (_ cancel: Bool) -> Void

@discardableResult
public func delay(time: TimeInterval, task: @escaping () -> Void) -> Task? {
    
    func dispatch_later(block: @escaping () -> Void) {
        let delay = DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(time * 1000))
        DispatchQueue.main.asyncAfter(deadline: delay) {
            block()
        }
    }
    
    var closure: (() -> Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure, !cancel {
            DispatchQueue.main.async(execute: internalClosure)
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
}

public func cancel(task: Task?) {
    task?(true)
}
