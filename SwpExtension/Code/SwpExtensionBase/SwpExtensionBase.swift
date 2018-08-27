//
//  SwpExtensionBase.swift
//  swp_song
//
//  Created by swp-song on 2018/8/24.
//  Copyright © 2018年 swp-song. All rights reserved.
//

public final class SwpExtensionClass<BaseClass> {
    
    public let swp: BaseClass
    
    public init(_ swp: BaseClass) {
        self.swp = swp
    }

}

public struct SwpExtensionStruct<BaseStruct> {
    
    public let swp : BaseStruct
    
    public init(_ swp : BaseStruct) {
        self.swp = swp
    }
    
}


