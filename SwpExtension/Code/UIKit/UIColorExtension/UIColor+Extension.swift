//
//  UIColor+Extension.swift
//  swp-song
//
//  Created by swp_song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

// MARK: - Public Convenience
extension UIColor {
    
    ///
    /// # r g b set color
    /// - Parameters:
    ///   - hex:    hex
    ///   - alpha:  alpha
    public convenience init(aRed: CGFloat, aGreen: CGFloat, aBlue: CGFloat, alpha: CGFloat = 1) {
        self.init(red: aRed / 255.0, green: aGreen / 255.0, blue: aBlue / 255.0, alpha: alpha)
    }
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:    hex
    ///   - alpha:  alpha
    public convenience init(_ hex : Int, alpha : CGFloat = 1) {
        self.init(aRed: ((CGFloat)((hex & 0xFF0000) >> 16)), aGreen: ((CGFloat)((hex & 0xFF00) >> 8)), aBlue: ((CGFloat)((hex & 0xFF))), alpha: alpha)
    }
    
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:    hex
    ///   - alpha:  alpha
    public convenience init(_ hex : String, alpha : CGFloat = 1) {
        guard let colorValue = UIColor.aColorValue(hex) else {
            self.init(aRed: 0, aGreen: 0, aBlue: 0, alpha: 0)
            return
        }
        self.init(aRed: colorValue.red, aGreen: colorValue.green, aBlue: colorValue.blue, alpha: alpha)
    }
    
}

// MARK: - Public
extension SwpExtensionClass where BaseClass : UIColor {
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:   hex
    ///   - alpha: alpha
    /// - Returns: UIColor
    public static func hexColor(_ hex : Int, alpha : CGFloat = 1) -> UIColor {
        return UIColor(hex, alpha: alpha)
    }
    
    ///
    /// # hex set color
    /// - Parameters:
    ///   - hex:   hex
    ///   - alpha: alpha
    /// - Returns: UIColor
    public static func hexColor(_ hex : String, alpha : CGFloat = 1) -> UIColor {
        return UIColor(hex, alpha: alpha)
    }
    
    ///
    /// # r g b set color
    /// - Parameters:
    ///   - red:    red
    ///   - green:  green
    ///   - blue:   blue
    ///   - alpha:  alpha
    /// - Returns:  UIColor
    public static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(aRed:red, aGreen:green, aBlue:blue, alpha:alpha)
    }
    
    ///
    /// # create random colors
    /// - Returns:  UIColor
    public static func randomColor(alpha : CGFloat = 1) -> UIColor {
        return rgbColor(red: CGFloat(arc4random_uniform(256)), green: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)), alpha:alpha)
    }
}

// MARK: - Private
private extension UIColor {
    
    private static func aColorValue(_ string : String) -> (red : CGFloat, green : CGFloat, blue : CGFloat)? {
        
        var aString : String = string.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if aString.count < 6 {
            return nil
        }
        
        if aString.hasPrefix("0X") {
            aString = (aString as NSString).substring(from: 2)
        }
        
        if aString.hasPrefix("#") {
            aString = (aString as NSString).substring(from: 1)
        }
        
        if aString.count != 6 {
            return nil
        }
        
        var range : NSRange = NSRange()
        range.location       = 0
        range.length         = 2;
        let rString : String = (aString as NSString).substring(with: range)
        range.location       = 2
        let gString : String = (aString as NSString).substring(with: range)
        range.location       = 4
        let bString : String = (aString as NSString).substring(with: range)
        
        var r : UInt32 = 0
        var b : UInt32 = 0
        var g : UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return (red : CGFloat(r), green : CGFloat(g), blue : CGFloat(b))
    }
    
}


extension SwpExtensionClass where BaseClass : UIColor {
    
    public var image : UIImage? {
        return UIImage.aColorCreateImage(self.swp)
    }
    
    public func image(_ frame : CGRect) -> UIImage? {
        return UIImage.aColorCreateImage(self.swp, frame: frame)
    }
}
