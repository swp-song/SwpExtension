//
//  CGFloatExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == CGFloat {
    
    
    /// # create CGFloat type random number
    public static var random : CGFloat {
        return CGFloat.swp.random()
    }
    
    ///
    /// # create CGFloat type random number
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns: CGFloat
    public static func random(_ lower : CGFloat = 0, upper: CGFloat = 1) -> CGFloat {
        return CGFloat(CGFloat.aRandomDouble(Double(lower), upper: Double(upper)))
    }
    
}
