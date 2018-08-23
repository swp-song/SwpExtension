//
//  UIColor+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension UIColor {
    
    // MARK: - Public
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:   Int
    ///   - alpha: alpha
    /// - Returns: UIColor
    public static func SwpColorHex(_ hex : Int, alpha : CGFloat = 1) -> UIColor {
        return UIColor.ColorHex(hex, alpha: alpha)
    }
    
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:   hex
    ///   - alpha: alpha
    /// - Returns: UIColor
    public static func SwpColorHex(_ hex : String, alpha : CGFloat = 1) -> UIColor {
        return UIColor.ColorHex(hex, alpha: alpha);
    }
    
    
    ///
    /// # r g b set color
    /// - Parameters:
    ///   - red:    red
    ///   - green:  green
    ///   - blue:   blue
    ///   - alpha:  alpha
    /// - Returns:  UIColor
    public static func SwpColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor.ColorRGB(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    ///
    /// # create random colors
    /// - Returns:  UIColor
    public static func SwpColorRandom(alpha : CGFloat = 1) -> UIColor {
        return SwpColorRGB(red: CGFloat(arc4random_uniform(256)), green: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)), alpha:alpha)
    }
    
    // MARK: - Private
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:    hex
    ///   - alpha:  alpha
    /// - Returns:  UIColor
    private static func ColorHex(_ hex : String, alpha : CGFloat = 1) -> UIColor {
        
        var aString : String = hex.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
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
    
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:    hex
    ///   - alpha:  alpha
    /// - Returns:  UIColor
    private static func ColorHex(_ hex : Int, alpha : CGFloat) -> UIColor {
        return UIColor(red:((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green:((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue:((CGFloat)((hex & 0xFF))) / 255.0, alpha: alpha)
    }
    
    
    ///
    /// # r g b set color
    /// - Parameters:
    ///   - red:    red
    ///   - green:  green
    ///   - blue:   blue
    ///   - alpha:  alpha
    /// - Returns:  UIColor
    private static func ColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
    }
    
}
