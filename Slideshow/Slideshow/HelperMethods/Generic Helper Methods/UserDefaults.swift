//
//  UserDefaults.swift
//
//  Created by Ashutosh Pandey on 20/01/20.
//  Copyright © 2020 Ashutosh Pandey. All rights reserved.
//

import Foundation

enum UserDefaultKeys {
    static let deepLink_Key = "deepLink"
    static let fbUserId = "fbUserId"
    static let googleUserId = "googleUserId"
    static let fbUserName = "fbUserName"
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
}

@propertyWrapper
struct UserDefaultGroup<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            let userDefaults = UserDefaults.standard
            return userDefaults.object(forKey: key) as? T ?? defaultValue
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue, forKey: key)
            userDefaults.synchronize()
        }
    }
    
}

struct UserDefaultsConfig {
    private enum Constant {
        static let intConst: Int = -999
        static let stringConst: String = ""
        static let doubleConst: Double = -999.99
        static let floatConst: Float = -999.99
        static let defaultLat: Double = 0.00
        static let defaultLong: Double = 0.00
    }
    
    @UserDefault(UserDefaultKeys.deepLink_Key, defaultValue: "")
    static var isDeepLink: String
//
//
//    @UserDefault(UserDefaultKeys.BOT_ID_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var botId: String
//
//    @UserDefault(UserDefaultKeys.LOGIN_KEY.rawValue, defaultValue: 0)
//    static var login: Int
//
//    @UserDefault(UserDefaultKeys.CUSTOMER_ID_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var customerId: String
//
//    @UserDefault(UserDefaultKeys.CHANNEL_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var channel: String
//
//    @UserDefault(UserDefaultKeys.EMAIL_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var email: String
//
//    @UserDefault(UserDefaultKeys.NAME_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var name: String
//
//    @UserDefault(UserDefaultKeys.PHONE_KEY.rawValue, defaultValue: Constant.stringConst)
//    static var phoneNo: String
//
//    @UserDefault(UserDefaultKeys.PURIFIER_AREA.rawValue, defaultValue: Constant.stringConst)
//    static var purifierArea: String
//
//    @UserDefault(UserDefaultKeys.SHOW_BOOK_SERVICE.rawValue, defaultValue: 0)
//    static var showBookService: Int
//
////    @UserDefault(UserDefaultKeys.SHOW_RECHARGE.rawValue, defaultValue: 0)
//    static var showRecharge: Int

    static func clearDataOnLogout() {
        let standardUserDefaults = UserDefaults.standard
        standardUserDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
}
