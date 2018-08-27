//
//  SwpExtensionProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/8/24.
//  Copyright © 2018年 swp-song. All rights reserved.
//

protocol SwpExtensionProtocol {}

extension SwpExtensionProtocol {
    
    public var swp : SwpExtensionClass<Self> {
        return SwpExtensionClass(self)
    }
}

extension UIView : SwpExtensionProtocol {}
