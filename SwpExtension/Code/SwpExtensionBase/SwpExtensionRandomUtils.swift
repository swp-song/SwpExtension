//
//  SwpExtensionRandomProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/6.
//  Copyright © 2018年 swp-song. All rights reserved.
//


//import UIKit


protocol SwpExtensionRandomUtils {
    
    
    @discardableResult func aRandomInt(_ lower : Int, upper: Int) -> Int
    
    @discardableResult func aRandomDouble(_ lower : Double, upper: Double) -> Double
    
    
}

extension SwpExtensionRandomUtils {
    
    @discardableResult func aRandomInt(_ lower : Int, upper: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upper - lower))) + lower
    }
    
    
    @discardableResult func aRandomDouble(_ lower : Double, upper: Double, aDouble : Swift.Double) -> Double {
        return (Double( arc4random()) / Double(UInt32.max) ) * ( upper - lower ) + lower
    }
    
}


