//
//  SwpInt+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == Int {
    
    /// # create int type random number
    public static var random : Int {
        return Int.swp.random()
    }
    
    ///
    /// # create int type random number
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns: Int
    public static func random(_ lower : Int = 0, upper: Int = Int(Int32.max)) -> Int {
        return Int.aRandomInt(lower, upper: upper)
    }
    
}
