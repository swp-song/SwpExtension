//
//  SwpStringSpaceExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == String {
    
    /// # trim trailing spaces
    public var trim : String {
        return self.swp.trimmingCharacters(in: .whitespaces)
    }
    
    ///
    /// # trim trailing spaces
    /// - Parameter string: string
    /// - Returns: String
    public static func trim(_ string : String) -> String {
        return string.swp.trim
    }
    
}

