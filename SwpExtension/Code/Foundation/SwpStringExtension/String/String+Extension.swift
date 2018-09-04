//
//  SwpStringSpaceExtension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

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

extension SwpExtensionStruct where BaseStruct == String {
    
    public var qrCodeImage : UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: 200, qrColor: UIColor.black, bgColor: UIColor.white)
    }
    
    public func qrCodeImage(_ size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: size, qrColor: qrColor, bgColor: bgColor)
    }
    
    public func qrCodeImage(_ icon : UIImage, iconSize : CGFloat = 35, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return String.aCreateQrCodeImage(self.swp, size: size, icon: icon, iconSize: iconSize, qrColor: qrColor, bgColor: bgColor)
    }
}


extension SwpExtensionStruct where BaseStruct == String {
    
    public var barCodeImage : UIImage? {
        return String.aCreateBarCodeImage(self.swp, size: 300)
    }
    
    public func barCodeImage(_ size : CGFloat = 300, textFont : UIFont, textColor : UIColor) -> UIImage? {
        return String.aCreateBarCodeImage(self.swp, size: size, textFont: textFont, textColor: textColor)
    }
    
}

