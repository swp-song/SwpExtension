//
//  SwpExtensionBaseProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

/// SwpExtensionClassProtocol
public protocol SwpExtensionClassProtocol { }

// MARK: - SwpExtensionClassProtocol
public extension SwpExtensionClassProtocol {
    
    public var swp : SwpExtensionClass<Self> {
        return SwpExtensionClass(self)
    }
    
    public static var swp : SwpExtensionClass<Self>.Type {
        return SwpExtensionClass.self
    }

}

extension UIView    : SwpExtensionClassProtocol {}
extension UIColor   : SwpExtensionClassProtocol {}
extension UIFont    : SwpExtensionClassProtocol {}
extension UIImage   : SwpExtensionClassProtocol {}
extension UIScreen  : SwpExtensionClassProtocol {}
extension UserDefaults : SwpExtensionClassProtocol {}

/// SwpExtensionStructProtocol
public protocol SwpExtensionStructProtocol { }

// MARK: - SwpExtensionStructProtocol
public extension SwpExtensionStructProtocol {
    
    public var swp : SwpExtensionStruct<Self> {
        return SwpExtensionStruct(self)
    }
    
    public static var swp : SwpExtensionStruct<Self>.Type {
        return SwpExtensionStruct.self
    }
    
}

extension Int           : SwpExtensionStructProtocol { }
extension Double        : SwpExtensionStructProtocol { }
extension Float         : SwpExtensionStructProtocol { }
extension CGFloat       : SwpExtensionStructProtocol { }
extension String        : SwpExtensionStructProtocol { }
extension UnicodeScalar : SwpExtensionStructProtocol { }
extension Bundle        : SwpExtensionStructProtocol { }



