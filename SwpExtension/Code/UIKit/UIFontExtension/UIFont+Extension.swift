//
//  UIFont+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionClass where BaseClass : UIFont {
    
    ///
    /// # get font names
    /// - Returns: [String]
    @discardableResult public static func fontNames() -> [String] {
        return UIFont.familyNames
    }
    
    
    ///
    /// # get font name list
    /// - Returns: [String : [String]]
    @discardableResult public static func fontNameList() -> [String : [String]] {
        
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
    @discardableResult public static func font(name fontName : String? = nil, size fontSize : CGFloat = 15) -> UIFont {
        
        if let fontName = fontName {
            return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        return UIFont.systemFont(ofSize: fontSize)
    }
    
    
    ///
    /// # get AppleSDGothicNeo-Thin font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func fontAppleSDGothicNeoThin(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "AppleSDGothicNeo-Thin", size: size)
    }
    
    ///
    /// # get Avenir font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func fontAvenir(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "Avenir", size: size)
    }
    
    ///
    /// # get Avenir Light font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func fontAvenirLight(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "Avenir-Light", size: size)
    }
    
    ///
    /// # get Heiti SC font and setting font size
    /// - Parameter size: size
    /// - Returns: UIFont
    public static func fontHeitiSC(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "Heiti SC", size: size)
    }
    
    ///
    /// # get HelveticaNeue font and setting font size
    /// - Parameter size: size
    /// - Returns: UIFont
    public static func fontHelveticaNeue(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "HelveticaNeue", size: size)
    }
    
    ///
    /// # get HelveticaNeue font and setting font size
    /// - Parameter size: size
    /// - Returns: UIFont
    public static func fontHelveticaNeueBold(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "HelveticaNeue-Bold", size: size)
    }
    
    ///
    /// # get GillSans Italic font and setting font size
    /// - Parameter size: size
    /// - Returns:  UIFont
    public static func fontGillSansItalic(_ size : CGFloat = 15) -> UIFont {
        return UIFont.swp.font(name: "GillSans-Italic", size: size)
    }
    
}
