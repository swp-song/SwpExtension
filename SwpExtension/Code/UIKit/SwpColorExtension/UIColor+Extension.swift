//
//  UIColor+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension UIColor {
    
    // MARK: - public
    
    ///
    /// - 十六进制颜色，Int 生成对应颜色
    /// - Parameters:
    ///   - hexColor:   Int
    ///   - alpha:      CGFloat
    /// - Returns:      UIColor
    public static func SwpColorHex(hexColor : Int, alpha : CGFloat = 1) -> UIColor {
        return UIColor.ColorHex(hexColor: hexColor, alpha: alpha)
    }
    
    
    ///
    /// - 十六进制字符串，生成对应颜色
    /// - Parameters:
    ///   - hexColor:   String
    ///   - alpha:      CGFloat
    /// - Returns:      UIColor
    public static func SwpColorHex(hexColor : String, alpha : CGFloat = 1) -> UIColor {
        return UIColor.ColorHex(hexColor: hexColor, alpha: alpha);
    }
    
    
    ///
    /// - R G B 生成颜色
    /// - Parameters:
    ///   - red:    CGFloat
    ///   - green:  CGFloat
    ///   - blue:   CGFloat
    ///   - alpha:  CGFloat
    /// - Returns:  UIColor
    public static func SwpColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor.ColorRGB(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    
    ///
    /// - 生成随机颜色
    /// - Returns:  UIColor
    public static func SwpColorRandom(alpha : CGFloat = 1) -> UIColor {
        return SwpColorRGB(red: CGFloat(arc4random_uniform(256)), green: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)), alpha:alpha)
    }
    
    // MARK: - private
    private static func ColorHex(hexColor : String, alpha : CGFloat = 1) -> UIColor {
        
        var aString : String = hexColor.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if aString.count < 6 {
            return UIColor.clear
        }
        
        if aString.hasPrefix("0X") {
            aString = (aString as NSString).substring(from: 2)
        }
        
        if aString.hasPrefix("#") {
            aString = (aString as NSString).substring(from: 1)
        }
        
        if aString.count != 6 {
            return UIColor.clear
        }
        
        
        
        var range : NSRange = NSRange()
        range.location      = 0
        range.length        = 2;
        
        let rString : String = (aString as NSString).substring(with: range)
        
        range.location      = 2
        let gString : String = (aString as NSString).substring(with: range)
        
        range.location      = 4
        let bString : String = (aString as NSString).substring(with: range)
        
        var r : UInt32 = 0
        var b : UInt32 = 0
        var g : UInt32 = 0
        
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor.ColorRGB(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: alpha)
    }
    
    
    
    private static func ColorHex(hexColor : Int, alpha : CGFloat) -> UIColor {
        return UIColor(red:((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.0, green:((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.0, blue:((CGFloat)((hexColor & 0xFF))) / 255.0, alpha: alpha)
    }
    
    private static func ColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
    }
    
}
