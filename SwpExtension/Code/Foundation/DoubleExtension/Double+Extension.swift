//
//  Double+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == Double {
    
    /// # create double type random number
    public static var random : Double {
        return Double.swp.random()
    }
    
    ///
    /// # create double type random number
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns: Double
    public static func random(_ lower : Double = 0, upper: Double = 1) -> Double {
        return Double.aRandomDouble(lower, upper: upper)
    }
}

