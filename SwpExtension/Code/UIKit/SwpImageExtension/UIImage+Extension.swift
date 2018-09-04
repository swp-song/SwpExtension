//
//  UIImage+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/30.
//  Copyright © 2018年 swp-song. All rights reserved.
//



// MARK: - convenience public
extension UIImage {
    
    ///
    /// # color create image
    /// - Parameter color:
    public convenience init?(color : UIColor) {
        guard let cgImage = UIImage.aColorCreateImage(color)?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

// MARK: - view screenshots create image public
extension SwpExtensionClass where BaseClass : UIImage {
    
    ///
    /// # view screenshots create image
    /// - Parameter view: view
    /// - Returns: UIImage
    @discardableResult public static func screenshots( _ view : UIView) -> UIImage? {
        return UIImage.aViewScreenshotsCreateImage(view)
    }
    
    
    /// # full view screenshots create image
    public static var screenshotsFull : UIImage? {
        return UIImage.aScreenshotsFullCreateImage()
    }
    
    
    /// # view screenshots create image data
    public static var screenshotsFullData : Data? {
        return UIImage.aScreenshotsFullCreateData()
    }
    
}

// MARK: - create qrCode
extension SwpExtensionClass where BaseClass : UIImage {
    
    
    ///
    /// # create qrCode image
    /// - Parameters:
    ///   - string:  string
    ///   - size:    size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage?
    public static func qrCodeImage(_ string : String, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return UIImage.aCreateQrCodeImage(string, size: size, qrColor: qrColor, bgColor: bgColor)
    }
    
    
    ///
    /// # create qrCode image, inster icon
    /// - Parameters:
    ///   - string: string
    ///   - icon: icon
    ///   - iconSize: iconSize
    ///   - size:    size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns:   UIImage?
    public static func qrCodeImage(_ string : String, icon : UIImage, iconSize : CGFloat = 35, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        return UIImage.aCreateQrCodeImage(string, size: size, icon: icon, iconSize: iconSize, qrColor: qrColor, bgColor: bgColor)
        
    }
}

// MARK: - create barCode image
extension SwpExtensionClass where BaseClass : UIImage {
    
    
    ///
    /// # create barCode image
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    /// - Returns: UIImage?
    public static func barCodeImage(_ string : String, size : CGFloat = 400) -> UIImage? {
        return UIImage.aCreateBarCodeImage(string, size:size)
    }
    
    
    ///
    /// # create barCode image
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    ///   - textFont: textFont
    ///   - textColor: textColor
    /// - Returns: UIImage?
    public static func barCodeImage(_ string : String, size : CGFloat = 400, textFont : UIFont, textColor : UIColor) -> UIImage? {
        return UIImage.aCreateBarCodeImage(string, size: size, textFont: textFont, textColor: textColor)
    }
}


