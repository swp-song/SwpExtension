//
//  Bundle+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension Bundle {
    
    ///
    /// - 获取 App 命名空间
    /// - Returns:
    public static func SwpGetNameSpace() -> String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
    ///
    /// - 获取 App 版本号
    /// - Returns:  String
    public static func SwpGetAppVersion() -> String {
        
        #if DEBUG
        return Bundle.SwpGetBundleVersion()
        #else
        return Bundle.SwpGetBundleShortVersionString()
        #endif
    }
    
    
    ///
    /// - 获取 App CFBundleVersion 版本号
    /// - Returns:  String
    public static func SwpGetBundleVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    
    ///
    /// - 获取 App CFBundleShortVersionString 版本号
    /// - Returns:  String
    public static func SwpGetBundleShortVersionString() -> String  {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    /**
     *  @author swp_song
     *
     *  @brief  swpGetBundleIdentifier( 加载字体设置字体大小 )
     *
     *  @return String
     */
    public static func SwpGetBundleIdentifier() -> String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    
}
