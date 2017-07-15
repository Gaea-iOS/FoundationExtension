//
//  Bundle+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/15.
//
//

import Foundation

extension Bundle {
    
    public var applicationName: String? {
        if let name = object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return name
        } else {
            return bundleName
        }
    }
    
    public var bundleName: String? {
        return object(forInfoDictionaryKey: String(kCFBundleNameKey)) as? String
    }
    
    public var bundleVersion: String? {
        return object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String
    }
    
    public var bundleShortVersion: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    public var bundleExecuteable: String? {
        return object(forInfoDictionaryKey: String(kCFBundleExecutableKey)) as? String
    }
    
    public var bundleInfoDictionaryVersion: String? {
        
        return object(forInfoDictionaryKey: String(kCFBundleInfoDictionaryVersionKey)) as? String
    }
}
