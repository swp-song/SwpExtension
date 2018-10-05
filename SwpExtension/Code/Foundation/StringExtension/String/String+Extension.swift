//
//  String+Extension.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

// MARK: - string trim spaces
extension SwpExtensionStruct where BaseStruct == String {
    
    /// # trim trailing spaces
    public var trim : String {
        return self.swp.trimmingCharacters(in: .whitespaces)
    }
    
    ///
    /// # trim trailing spaces
    /// - Parameter string: string
    /// - Returns: String
    public static func trim(_ string : String) -> String {
        return string.swp.trim
    }
}

// MARK: - create qrCode
extension SwpExtensionStruct where BaseStruct == String {
    
    /// # string create qrCode
    public var qrCodeImage : UIImage? {
        return self.qrCodeImage(200)
    }
    
    ///
    /// # string create qrCode
    /// - Parameters:
    ///   - size:       size
    ///   - qrColor:    qrColor
    ///   - bgColor:    bgColor
    /// - Returns: UIImage?
    public func qrCodeImage(_ size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: size, qrColor: qrColor, bgColor: bgColor)
    }
    
    ///
    /// # string create qrCode
    /// - Parameters:
    ///   - icon:       icon
    ///   - iconSize:   iconSize
    ///   - size:       size
    ///   - qrColor:    qrColor
    ///   - bgColor:    bgColor
    /// - Returns: UIImage?
    public func qrCodeImage(_ icon : UIImage, iconSize : CGFloat = 35, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: size, icon: icon, iconSize: iconSize, qrColor: qrColor, bgColor: bgColor)
    }
}

// MARK: - create barCode image
extension SwpExtensionStruct where BaseStruct == String {
    
    /// # create barCode image
    public var barCodeImage : UIImage? {
        return self.barCodeImage(400)
    }
    
    ///
    /// # create barCode image
    /// - Parameter size: size
    /// - Returns: UIImage?
    public func barCodeImage(_ size : CGFloat = 400) -> UIImage? {
        return String.aCreateBarCodeImage(self.swp, size: size)
    }
    
    ///
    /// # create barCode image
    /// - Parameters:
    ///   - size:       size
    ///   - textFont:   textFont
    ///   - textColor:  textColor
    /// - Returns: UIImage?
    public func barCodeImage(_ size : CGFloat = 400, textFont : UIFont, textColor : UIColor) -> UIImage? {
        return String.aCreateBarCodeImage(self.swp, size: size, textFont: textFont, textColor: textColor)
    }
    
}

// MARK: - check the string contains emoji
extension SwpExtensionStruct where BaseStruct == String {
    
    /// # check the string contains emoji, contains return true.
    public var isEmoji : Bool {
        return self.isEmoji(self.swp)
    }
    
    ///
    /// # check the string contains emoji, contains return true.
    /// - Parameter string: string
    /// - Returns: Bool
    public static func isEmoji(_ string : String) -> Bool {
        return string.swp.isEmoji
    }
    
    ///
    /// # check the string contains emoji, contains return true.
    /// - Parameter string: string
    /// - Returns: Bool
    private func isEmoji(_ string : String) -> Bool {
        
        var isEmoji = false
        
        string.unicodeScalars.forEach { (scalar) in
            if scalar.swp.isEmoji {
                isEmoji = true
                return
            }
        }
        return isEmoji
    }
    
}

// MARK: - get string row width & height
extension SwpExtensionStruct where BaseStruct == String {
    
    ///
    /// # string, get row height, known row width
    /// - Parameters:
    ///   - font:       font
    ///   - rowWidth:   rowWidth
    /// - Returns: CGFloat
    @discardableResult public func rowHeight(_ font : UIFont, rowWidth : CGFloat) -> CGFloat {
        return self.rowSize(font, size: CGSize(width: rowWidth, height: CGFloat(MAXFLOAT))).height
    }
    
    ///
    /// # string, get row width, known row height
    /// - Parameters:
    ///   - font:       font
    ///   - rowHeight:  rowHeight
    /// - Returns: CGFloat
    @discardableResult public func rowWidth(_ font : UIFont, rowHeight : CGFloat) -> CGFloat {
        return self.rowSize(font, size: CGSize(width: CGFloat(MAXFLOAT), height: rowHeight)).width
    }
    
    ///
    /// # string, get row size
    /// - Parameters:
    ///   - font:   font
    ///   - size:   rowWidth
    /// - Returns: CGSize
    @discardableResult private func rowSize(_ font : UIFont, size : CGSize) -> CGSize {
        let style : [NSAttributedString.Key : Any]? = [.font : font]
        let rect  : CGRect = (self.swp as NSString).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: style, context: nil)
        return rect.size
    }
    
}
