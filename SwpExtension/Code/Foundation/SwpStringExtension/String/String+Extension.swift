//
//  SwpStringSpaceExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
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
    ///   - size: size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage?
    public func qrCodeImage(_ size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: size, qrColor: qrColor, bgColor: bgColor)
    }
    
    
    ///
    /// # string create qrCode
    /// - Parameters:
    ///   - icon: icon
    ///   - iconSize: iconSize
    ///   - size: size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
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
    ///   - size: size
    ///   - textFont: textFont
    ///   - textColor: textColor
    /// - Returns: UIImage?
    public func barCodeImage(_ size : CGFloat = 400, textFont : UIFont, textColor : UIColor) -> UIImage? {
        return String.aCreateBarCodeImage(self.swp, size: size, textFont: textFont, textColor: textColor)
    }
    
}

