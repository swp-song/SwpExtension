//
//  UserDefaults+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension SwpExtensionClass where BaseClass : UserDefaults {
    
    
    
    public func setValue(_ value : Any, key : String) -> BaseClass {
        UserDefaults.standard.setValue(value, forKey: key)
        return self.swp
    }
    
    
    ///
    /// # set user defaults
    /// - Parameters:
    ///   - value:  value
    ///   - key:    key
    /// - Returns: UserDefaults
    @discardableResult public static func setValue(_ value : Any, key : String) -> UserDefaults {
        return UserDefaults.standard.swp.setValue(value, key: key)
    }
    
    ///
    /// # get user defaults
    /// - Parameter key: key
    /// - Returns:  Any?
    @discardableResult public static func value(key : String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    
    ///
    /// # remove user defaults
    /// - Parameter key: key
    /// - Returns: UserDefaults
    @discardableResult public static func removeObject(key : String) -> UserDefaults {
        UserDefaults.standard.removeObject(forKey: key)
        return UserDefaults.standard
    }
    
    
}
