//
//  UIDevice+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/14.
//
//

import Foundation
import KeychainAccess

extension UIDevice {

    public var deviceId: String {
        assert(Bundle.main.bundleIdentifier != nil, "Bundle.main.bundleIdentifier must not be nil")
        let bundleId = Bundle.main.bundleIdentifier!
        let keychain = Keychain(service: bundleId)
        let deviceIdKey = "device_unique_identifier"

        guard let deviceId = keychain[deviceIdKey] else {
            let deviceId = UUID().uuidString
            keychain[deviceIdKey] = deviceId
            return deviceId
        }
        return deviceId
    }
}
