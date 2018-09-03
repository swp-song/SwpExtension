//
//  UIImage+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/30.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UIImage {
    
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
    
    public static func QRCodeImage(_ string : String, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        
        return UIImage.aCreateQrCodeImage(string, size: size, qrColor: qrColor, bgColor: bgColor)
        
    }
    
    public static func QRCodeImage(_ string : String, icon : UIImage, iconSize : CGFloat = 35, size : CGFloat = 200, qrColor : UIColor = UIColor.black, bgColor : UIColor = UIColor.white) -> UIImage? {
        
        return UIImage.aCreateQrCodeImage(string, size: size, icon: icon, iconSize: iconSize, qrColor: qrColor, bgColor: bgColor)
        
    }
}


extension SwpExtensionClass where BaseClass : UIImage {
    
    public static func barCodeImage(_ string : String, size : CGSize = CGSize.zero) -> UIImage? {
        return UIImage.aCreateBarCodeImage(string, size: CGSize.zero, barColor: UIColor.red, bgColor: UIColor.red)
    }
}


