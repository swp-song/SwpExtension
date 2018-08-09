//
//  SwpStringSpaceExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension String {
    
    /// # string，去除首尾空格
    public var swpTrim : String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    ///
    /// # SwpTrim，string，去除首尾空格
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpTrim(string : String) -> String {
        return string.swpTrim
    }
    
}

