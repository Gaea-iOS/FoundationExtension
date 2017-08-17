//
//  UIDevice+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/8/14.
//
//

import Foundation
import UICKeyChainStore

extension UIDevice {

    public var deviceId: String {
        guard let deviceId = UICKeyChainStore.string(forKey: "DeviceUniqueIdentifier") else {
            let deviceId = UUID().uuidString
            UICKeyChainStore.setString(deviceId, forKey: "DeviceUniqueIdentifier")
            return deviceId
        }
        return deviceId
    }
}
