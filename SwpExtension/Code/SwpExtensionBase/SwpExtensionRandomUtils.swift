//
//  SwpExtensionRandomUtils.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

protocol SwpExtensionRandomUtils {
    
    ///
    /// # generate random int type numbers
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns:Int
    @discardableResult static func aRandomInt(_ lower : Int, upper: Int) -> Int
    
    ///
    /// # generate random double type numbers
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns:Double
    @discardableResult static func aRandomDouble(_ lower : Double, upper: Double) -> Double
    
}

extension SwpExtensionRandomUtils {
    
    ///
    /// # generate random int type numbers
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns:Int
    @discardableResult static func aRandomInt(_ lower : Int, upper: Int) -> Int {
        if lower > upper { return 0 }
        let aLower = lower < Int32.min ? Int(Int32.min) : lower
        let aUpper = upper > Int32.max ? Int(Int32.max) : upper
        return Int(arc4random_uniform(UInt32(aUpper - aLower))) + aLower
    }
    
    ///
    /// # generate random double type numbers
    /// - Parameters:
    ///   - lower: lower
    ///   - upper: upper
    /// - Returns:Double
    @discardableResult static func aRandomDouble(_ lower : Double, upper: Double) -> Double {
        if lower > upper { return 0 }
        let aLower = lower < Double(Int32.min) ? Double(Int32.min) : Double(lower)
        let aUpper = upper > Double(Int32.max) ? Double(Int32.max) : Double(upper)
        return (Double(arc4random()) / Double(UInt32.max)) * (aUpper - aLower) + lower
    }
    
}

extension Int     : SwpExtensionRandomUtils {}
extension Float   : SwpExtensionRandomUtils {}
extension CGFloat : SwpExtensionRandomUtils {}
extension Double  : SwpExtensionRandomUtils {}

