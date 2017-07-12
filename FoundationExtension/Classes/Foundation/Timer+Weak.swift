//
//  Timer+Weak.swift
//  Pods
//
//  Created by 王小涛 on 2017/5/5.
//
//

import Foundation

private class WeakTimerProxy {

    private weak var _target: AnyObject?
    
    private let _block: (Timer) -> Void

    init(target: AnyObject, block: @escaping (Timer) -> Void) {
        _target = target
        _block = block
    }

    @objc func timerDidfire(timer: Timer) {

        if let _ = _target {
            _block(timer)
        }else {
            timer.invalidate()
        }
    }
}


public extension Timer {
    
    static func with(timeInterval: TimeInterval, target: AnyObject, block: @escaping (Timer) -> Void, userInfo: Any?, repeats: Bool) -> Timer {
        let proxy = WeakTimerProxy(target: target, block: block)
        return Timer(timeInterval: timeInterval, target: proxy, selector: #selector(WeakTimerProxy.timerDidfire(timer:)), userInfo: userInfo, repeats: repeats)
    }

    @discardableResult
    static func after(interval: TimeInterval, target: AnyObject, block: @escaping (Timer) -> Void) -> Timer {
        
        let timer = Timer.with(timeInterval: interval, target: target, block: block, userInfo: nil, repeats: false)
        timer.start()
        return timer
    }
    
    @discardableResult
    static func every(interval: TimeInterval, target: AnyObject, block: @escaping (Timer) -> Void) -> Timer {
        
        let timer = Timer.with(timeInterval: interval, target: target, block: block, userInfo: nil, repeats: true)
        timer.start()
        return timer
    }
    
    /// Schedule this timer on the run loop
    ///
    /// By default, the timer is scheduled on the current run loop for the default mode.
    /// Specify `runLoop` or `modes` to override these defaults.

    func start(runLoop: RunLoop = RunLoop.current, modes: RunLoopMode...) {

        // Common Modes包含default modes,modal modes,event Tracking modes.
        // 从NSTimer的失效性谈起（一）：关于NSTimer和NSRunLoop
        // https://yq.aliyun.com/articles/17710

        let modes = modes.isEmpty ? [.commonModes] : modes

        for mode in modes {
            runLoop.add(self, forMode: mode)
        }
    }
}
