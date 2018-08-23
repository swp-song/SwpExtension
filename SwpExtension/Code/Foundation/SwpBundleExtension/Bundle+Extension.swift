//
//  Bundle+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension Bundle {
    
    ///
    /// # get name space
    /// - Returns: String
    public static func SwpGetNameSpace() -> String {
        let bundleName = Bundle.SwpBundleName()
        return bundleName.count != 0 ? bundleName + "." : bundleName
    }
    
    
    ///
    /// # get bundle name
    /// - Returns: String
    public static func SwpBundleName() -> String {
        
        let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String
        if let bundleName = bundleName {
            return bundleName
        }
        return ""
    }
    
    ///
    /// # get app version
    /// - Returns: String
    public static func SwpGetAppVersion() -> String {
        
        #if DEBUG
        return Bundle.SwpGetBundleVersion()
        #else
        return Bundle.SwpGetBundleShortVersionString()
        #endif
    }
    
    
    ///
    /// # get app bundle version
    /// - Returns: String
    public static func SwpGetBundleVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    
    ///
    /// # get app bundle short version string
    /// - Returns: String
    public static func SwpGetBundleShortVersionString() -> String  {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    ///
    /// # get app bundle identifier
    /// - Returns: String
    public static func SwpGetBundleIdentifier() -> String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    
}
