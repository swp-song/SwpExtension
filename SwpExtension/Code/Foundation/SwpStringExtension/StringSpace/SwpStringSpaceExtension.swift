//
//  SwpStringSpaceExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension String {
    
    /// # trim trailing spaces
    public var swpTrim : String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    ///
    /// # trim trailing spaces
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpTrim(string : String) -> String {
        return string.swpTrim
    }
    
}

