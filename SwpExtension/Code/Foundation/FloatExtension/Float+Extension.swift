//
//  Float+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == Float {
    
    /// # create float type random number
    public static var random : Float {
        return Float.swp.random()
    }
    
    ///
    /// # create float type random number
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns: Float
    public static func random(_ lower : Float = 0, upper: Float = 1) -> Float {
        return Float(Float.aRandomDouble(Double(lower), upper: Double(upper)))
    }
    
}

