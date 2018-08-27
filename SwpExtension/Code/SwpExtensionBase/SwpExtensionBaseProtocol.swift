//
//  SwpExtensionBaseProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/8/24.
//  Copyright © 2018年 swp-song. All rights reserved.
//

protocol SwpExtensionClassProtocol { }

extension SwpExtensionClassProtocol {
    
    public var swp : SwpExtensionClass<Self> {
        return SwpExtensionClass(self)
    }
}

extension UIView : SwpExtensionClassProtocol {}





protocol SwpExtensionStructProtocol { }

extension SwpExtensionStructProtocol {
    
    public var swp : SwpExtensionStruct<Self> {
        return SwpExtensionStruct(self)
    }
}

extension String : SwpExtensionStructProtocol { }






