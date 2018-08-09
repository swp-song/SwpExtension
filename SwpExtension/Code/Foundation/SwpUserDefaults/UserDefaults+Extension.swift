//
//  UserDefaults+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UserDefaults {
    
    
    ///
    /// # 存入 UserDefaults
    /// - Parameters:
    ///   - value:  value
    ///   - key:    key
    /// - Returns:  UserDefaults
    public static func SwpSetValue(_ value : Any, key : String) -> UserDefaults {
        UserDefaults.standard.setValue(value, forKey: key)
        return UserDefaults.standard
    }
    
    
    ///
    /// # UserDefaults 取出
    /// - Parameter key:
    /// - Returns:  Any?
    public static func SwpValue(key : String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    
    ///
    /// # 删除 UserDefaults
    /// - Parameter key:
    /// - Returns:  UserDefaults
    public static func swpRemoveObject(key : String) -> UserDefaults {
        UserDefaults.standard.removeObject(forKey: key)
        return UserDefaults.standard
    }
    
    
}
