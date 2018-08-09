//
//  UIFont+Extension.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UIFont {
    ///
    /// # 获取字体名称
    /// - Returns: [String]
    @discardableResult public static func SwpFontNames() -> [String] {
        return UIFont.familyNames
    }
    
    
    ///
    /// # 获取字体名称
    /// - Returns: [String : [String]]
    @discardableResult public static func SwpFontNameList() -> [String : [String]] {
        
        var dictionary : [String : [String]] = [:]
        
        for familyName in UIFont.familyNames {
            
            let fontNames : [String] = UIFont.fontNames(forFamilyName: familyName)
            
            if (fontNames.count != 0) {
                dictionary[familyName] = fontNames
                continue
            }
            
            let temp : [String] = [familyName]
            dictionary[familyName] = temp
        }
        return dictionary
    }
    
    ///
    /// # 设置字体，name = nil, Returns SystemFont, size default = 15
    /// - Parameters:
    ///   - fontName: fontName
    ///   - fontSize: fontSize
    /// - Returns: UIFont
    @discardableResult public static func SwpFont(name fontName : String? = nil, size fontSize : CGFloat = 15) -> UIFont {
        
        if let fontName = fontName {
            return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        return UIFont.systemFont(ofSize: fontSize)
    }
    
    
    ///
    /// # AppleSDGothicNeo-Thin Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAppleSDGothicNeoThin(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "AppleSDGothicNeo-Thin", size: size)
    }
    
    ///
    /// # Avenir Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAvenir(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Avenir", size: size)
    }
    
    ///
    /// # Avenir-Light Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAvenirLight(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Avenir-Light", size: size)
    }
    
    ///
    /// # Heiti SC Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHeitiSC(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Heiti SC", size: size)
    }
    
    ///
    /// # HelveticaNeue Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHelveticaNeue(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "HelveticaNeue", size: size)
    }
    
    ///
    /// # HelveticaNeue-Bold Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHelveticaNeueBold(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "HelveticaNeue-Bold", size: size)
    }
    
    ///
    /// # GillSans-Italic Font
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontGillSansItalic(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "GillSans-Italic", size: size)
    }
    
}
//
