//
//  SwpExtensionBase.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

/// SwpExtensionClass
public final class SwpExtensionClass<BaseClass> {
    
    public let swp: BaseClass
    
    public init(_ swp: BaseClass) {
        self.swp = swp
    }
    
}


/// SwpExtensionStruct
public struct SwpExtensionStruct<BaseStruct> {
    
    public let swp : BaseStruct
    
    public init(_ swp : BaseStruct) {
        self.swp = swp
    }
    
}

