//
//  UIFont+Extension.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UIFont {
    
    ///
    /// # get font names
    /// - Returns: [String]
    @discardableResult public static func SwpFontNames() -> [String] {
        return UIFont.familyNames
    }
    
    
    ///
    /// # get font name list
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
    /// # set the font, based on the font name
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
    /// # get AppleSDGothicNeo-Thin font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAppleSDGothicNeoThin(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "AppleSDGothicNeo-Thin", size: size)
    }
    
    ///
    /// # get Avenir font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAvenir(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Avenir", size: size)
    }
    
    ///
    /// # get Avenir Light font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontAvenirLight(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Avenir-Light", size: size)
    }
    
    ///
    /// # get Heiti SC font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHeitiSC(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "Heiti SC", size: size)
    }
    
    ///
    /// # get HelveticaNeue font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHelveticaNeue(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "HelveticaNeue", size: size)
    }
    
    ///
    /// # get HelveticaNeue font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontHelveticaNeueBold(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "HelveticaNeue-Bold", size: size)
    }
    
    ///
    /// # get GillSans Italic font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func SwpFontGillSansItalic(_ size : CGFloat = 15) -> UIFont {
        return UIFont.SwpFont(name: "GillSans-Italic", size: size)
    }
    
}
//
