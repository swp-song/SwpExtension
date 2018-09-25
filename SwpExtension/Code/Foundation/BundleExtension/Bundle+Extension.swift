//
//  Bundle+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == Bundle {
    
    
    /// # get app name space
    public var nameSpace : String {
        return self.aNameSpace()
    }
    
    /// # get app bundle name
    public var bundleName : String {
        return self.aBundleName()
    }
    
    /// # get app bundle version
    public var bundleVersion : String {
        return self.aBundleVersion()
    }
    
    /// # get app bundle short version string
    public var bundleShortVersionString : String {
        return self.aBundleShortVersionString()
    }
    
    /// # get app bundle identifier
    public var bundleIdentifier : String {
        return self.aBundleIdentifier()
    }
    
    ///
    /// # get name space
    /// - Returns: String
    @discardableResult public static func nameSpace() -> String {
        return Bundle.main.swp.nameSpace
    }
    
    ///
    /// # get bundle name
    /// - Returns: String
    @discardableResult public static func bundleName() -> String {
        return Bundle.main.swp.bundleName
    }
    
    
    ///
    /// # get app version
    /// - Returns: String
    @discardableResult public static func appVersion() -> String {
        
        #if DEBUG
        return Bundle.swp.bundleVersion()
        #else
        return Bundle.swp.bundleShortVersionString()
        #endif
    }
    
    
    ///
    /// # get app bundle version
    /// - Returns: String
    @discardableResult public static func bundleVersion() -> String {
        return Bundle.main.swp.bundleVersion
    }
    
    
    ///
    /// # get app bundle short version string
    /// - Returns: String
    @discardableResult public static func bundleShortVersionString() -> String  {
        return Bundle.main.swp.bundleShortVersionString
    }
    
    ///
    /// # get app bundle identifier
    /// - Returns: String
    @discardableResult public static func bundleIdentifier() -> String {
        return Bundle.main.swp.bundleIdentifier
    }
    
}


// MARK: - Private
private extension SwpExtensionStruct where BaseStruct == Bundle {
    
    ///
    /// # get app name space
    /// - Returns: String
    private func aNameSpace() -> String {
        
        let bundleName = self.aBundleName()
        if bundleName.count == 0 {
            return ""
        }
        return bundleName + "."
    }
    
    ///
    /// # get app bundle name
    /// - Returns: String
    private func aBundleName() -> String {
        
        guard let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String else {
            return ""
        }
        return bundleName
    }
    
    ///
    /// # get app bundle version
    /// - Returns: String
    private func aBundleVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    ///
    /// # get app bundle short version string
    /// - Returns: String
    private func aBundleShortVersionString() -> String  {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    ///
    /// # get app bundle identifier
    /// - Returns: String
    private func aBundleIdentifier() -> String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
}

