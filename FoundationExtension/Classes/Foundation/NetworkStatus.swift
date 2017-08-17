//
//  NetworkStatus.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/17.
//
//

import CoreTelephony
import ReachabilitySwift

extension Reachability {
    
    public enum NetworkConnectionType {
        case unknow
        case wifi
        case cellular2G
        case cellular3G
        case cellular4G
        case notReachable
    }
    
    public var currentNetworkStatus: NetworkConnectionType {
        
        let status = currentReachabilityStatus
        
        switch status {
        case .reachableViaWiFi:
            return .wifi
        case .reachableViaWWAN:
            return currentCellularNetworkStatus
        case .notReachable:
            return .notReachable
        }
    }
    
    private var currentCellularNetworkStatus: NetworkConnectionType {
        
        let networkStatus = CTTelephonyNetworkInfo()
        let currentStatus = networkStatus.currentRadioAccessTechnology
        
        if currentStatus == CTRadioAccessTechnologyGPRS
            || currentStatus == CTRadioAccessTechnologyEdge {
            return .cellular2G
        }
        
        if currentStatus == CTRadioAccessTechnologyWCDMA
            || currentStatus == CTRadioAccessTechnologyHSDPA
            || currentStatus == CTRadioAccessTechnologyHSUPA
            || currentStatus == CTRadioAccessTechnologyCDMA1x
            || currentStatus == CTRadioAccessTechnologyCDMAEVDORev0
            || currentStatus == CTRadioAccessTechnologyCDMAEVDORevA
            || currentStatus == CTRadioAccessTechnologyCDMAEVDORevB
            || currentStatus == CTRadioAccessTechnologyeHRPD {
            return .cellular3G;
        }
        
        if currentStatus == CTRadioAccessTechnologyLTE {
            return .cellular4G
        }
        
        return .unknow
    }
}

