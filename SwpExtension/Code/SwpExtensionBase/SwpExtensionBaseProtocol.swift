//
//  SwpExtensionBaseProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/8/24.
//  Copyright © 2018年 swp-song. All rights reserved.
//


/// SwpExtensionClassProtocol
protocol SwpExtensionClassProtocol { }


// MARK: - SwpExtensionClassProtocol
extension SwpExtensionClassProtocol {
    
    public var swp : SwpExtensionClass<Self> {
        return SwpExtensionClass(self)
    }
    
    public static var swp : SwpExtensionClass<Self>.Type {
        return SwpExtensionClass.self
    }
    
}

extension UIView : SwpExtensionClassProtocol {}
extension UIColor : SwpExtensionClassProtocol {}
extension UIFont : SwpExtensionClassProtocol {}
extension UserDefaults : SwpExtensionClassProtocol {}


/// SwpExtensionStructProtocol
protocol SwpExtensionStructProtocol { }


// MARK: - SwpExtensionStructProtocol
extension SwpExtensionStructProtocol {
    
    
    public var swp : SwpExtensionStruct<Self> {
        return SwpExtensionStruct(self)
    }
    
    public static var swp : SwpExtensionStruct<Self>.Type {
        return SwpExtensionStruct.self
    }
    
}

extension String : SwpExtensionStructProtocol { }
extension Bundle : SwpExtensionStructProtocol { }






