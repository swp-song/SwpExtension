//
//  SwpExtensionUtilsProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/3.
//  Copyright © 2018年 swp-song. All rights reserved.
//


protocol SwpExtensionUtilsProtocol {
    
    // MARK: - screenshots interface
    
    ///
    /// # color create image
    /// - Parameters:
    ///   - color: color
    ///   - frame: frame
    /// - Returns: UIImage?
    @discardableResult static func aColorCreateImage(_ color : UIColor, frame : CGRect) -> UIImage?
    
    ///
    /// # view screenshots create image
    /// - Parameter view: view
    /// - Returns: UIImage?
    @discardableResult static func aViewScreenshotsCreateImage(_ view : UIView) -> UIImage?
    
    
    ///
    /// # screenshots full create data
    /// - Returns: Data?
    @discardableResult static func aScreenshotsFullCreateData() -> Data?
    
    ///
    /// # screenshots full create image
    /// - Returns: UIImage?
    @discardableResult static func aScreenshotsFullCreateImage() -> UIImage?
    
    
    // MARK: - set view layer interface
    
    ///
    /// # set view backgroundColor
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aBackgroundColor<T>(_ view : T, color : UIColor?) -> T
    
    ///
    /// # set view borderWidth
    /// - Parameters:
    ///   - view: view
    ///   - width: width
    /// - Returns: T
    @discardableResult func aBorderWidth<T>(_ view : T, width : CGFloat) -> T

    ///
    /// # set view cornerRadius
    /// - Parameters:
    ///   - view: view
    ///   - width: width
    /// - Returns: T
    @discardableResult func aCornerRadius<T>(_ view : T, radius : CGFloat) -> T
    
    ///
    /// # set view masksToBounds
    /// - Parameters:
    ///   - view: view
    ///   - masksToBounds: masksToBounds
    /// - Returns: T
    @discardableResult func aMasksToBounds<T>(_ view : T, masksToBounds : Bool) -> T
    
    ///
    /// # set view borderColor
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aBorderColor<T>(_ view : T, color : UIColor) -> T
    
    ///
    /// # set view cornerRadius and masksToBounds
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aCornerRadiusMasks<T>(_ view : T, radiusMasks : CGFloat) -> T
    
   
    // MARK: - string create qrCode interface
    
    
    ///
    /// # string create qrCode image
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage
    @discardableResult static func aCreateQrCodeImage(_ string : String, size : CGFloat, qrColor : UIColor, bgColor : UIColor) -> UIImage?
    
    ///
    /// # string create qrCode image, insert icon
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    ///   - icon: icon
    ///   - iconSize: iconSize
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage?
    @discardableResult static func aCreateQrCodeImage(_ string : String, size : CGFloat, icon : UIImage, iconSize : CGFloat, qrColor : UIColor, bgColor : UIColor) -> UIImage?
    
    
    ///
    /// # string create barCode image, insert icon
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    /// - Returns: UIImage?
    @discardableResult static func aCreateBarCodeImage(_ string : String, size : CGFloat) -> UIImage?
    
}

// MARK: - screenshots implementation
extension SwpExtensionUtilsProtocol {
    
    ///
    /// # color create image
    /// - Parameters:
    ///   - color: color
    ///   - frame: frame
    /// - Returns: UIImage?
    @discardableResult static func aColorCreateImage(_ color : UIColor, frame : CGRect = CGRect.zero) -> UIImage? {
        
        let aFrame = frame == CGRect.zero ? CGRect(x: 0, y: 0, width: 1, height: 1) : frame
        UIGraphicsBeginImageContext(aFrame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(aFrame)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext();
            return nil
        }
        
        UIGraphicsEndImageContext();
        return image
    }
    
    ///
    /// # view screenshots create image
    /// - Parameter view: view
    /// - Returns: UIImage?
    @discardableResult static func aViewScreenshotsCreateImage(_ view : UIView) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image : UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image
        
    }
    
    ///
    /// # screenshots full create data
    /// - Returns: Data?
    @discardableResult static func aScreenshotsFullCreateData() -> Data? {
        
        var imageSize : CGSize  = CGSize.zero
        
        let orientation : UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        
        imageSize = UIInterfaceOrientationIsPortrait(orientation) ? UIScreen.main.bounds.size : CGSize(width: UIScreen.main.bounds.size.height, height: UIScreen.main.bounds.size.width)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, true, 0);
        
        let context : CGContext? = UIGraphicsGetCurrentContext()
        
        UIApplication.shared.windows.forEach { (window) in
            
            context?.saveGState()
            context?.translateBy(x: window.center.x, y: window.center.y)
            context?.concatenate(window.transform)
            context?.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x, y: -window.bounds.size.height * window.layer.anchorPoint.y)
            
            switch orientation {
                
            case .landscapeLeft:
                
                context?.rotate(by: CGFloat.pi / 2.0)
                context?.translateBy(x: 0, y: -imageSize.width)
                
            case .landscapeRight:
                context?.rotate(by: -(CGFloat.pi / 2.0))
                context?.translateBy(x: -imageSize.height, y: 0)
                
            case .portraitUpsideDown:
                context?.rotate(by: CGFloat.pi)
                context?.translateBy(x: -imageSize.width, y: -imageSize.height)
                
            default: break
                
            }
            
            if window.responds(to: #selector(window.drawHierarchy(in:afterScreenUpdates:))) {
                window.drawHierarchy(in: window.bounds, afterScreenUpdates: false)
            } else {
                
                if let context = context {
                    window.layer.render(in: context)
                }
                
            }
            
            context?.restoreGState()
        }
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext();
            return nil
        }
        
        UIGraphicsEndImageContext();
        return UIImagePNGRepresentation(image)
    }
    
    ///
    /// # screenshots full create image
    /// - Returns: UIImage?
    @discardableResult static func aScreenshotsFullCreateImage() -> UIImage? {
        
        guard let data = self.aScreenshotsFullCreateData() else { return nil }
        
        return UIImage(data: data)
        
    }

}

// MARK: - set view layer implementation
extension SwpExtensionUtilsProtocol {
    
    ///
    /// # set view backgroundColor
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aBackgroundColor<T>(_ view : T, color : UIColor?) -> T {
        
        return aCheckView(view, block: { (aView) in
            aView.backgroundColor = color
        })
        
    }
    
    ///
    /// # set view borderWidth
    /// - Parameters:
    ///   - view: view
    ///   - width: width
    /// - Returns: T
    @discardableResult func aBorderWidth<T>(_ view : T, width : CGFloat) -> T  {
        
        return aCheckView(view, block: { (aView) in
            aView.layer.borderWidth = width
        })
        
    }
    
    
    ///
    /// # set view cornerRadius
    /// - Parameters:
    ///   - view: view
    ///   - width: width
    /// - Returns: T
    @discardableResult func aCornerRadius<T>(_ view : T, radius : CGFloat) -> T {
        
        return aCheckView(view, block: { (aView) in
            aView.layer.cornerRadius = radius
        })
    }
    
    
    ///
    /// # set view masksToBounds
    /// - Parameters:
    ///   - view: view
    ///   - masksToBounds: masksToBounds
    /// - Returns: T
    @discardableResult func aMasksToBounds<T>(_ view : T, masksToBounds : Bool) -> T {
        
        return aCheckView(view, block: { (aView) in
            aView.layer.masksToBounds = masksToBounds
        })
    }
    
    ///
    /// # set view borderColor
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aCornerRadiusMasks<T>(_ view : T, radiusMasks : CGFloat) -> T {
        
        return aCheckView(view, block: { (aView) in
            aView.layer.cornerRadius = radiusMasks
            aView.layer.masksToBounds = true
        })
        
    }
    
    ///
    /// # set view cornerRadius and masksToBounds
    /// - Parameters:
    ///   - view: view
    ///   - color: color
    /// - Returns: T
    @discardableResult func aBorderColor<T>(_ view : T, color : UIColor) -> T {
        
        return aCheckView(view, block: { (aView) in
            aView.layer.borderColor = color.cgColor
        })
    }
    

}

// MARK: - string create qrCode implementation
extension SwpExtensionUtilsProtocol {
    
    ///
    /// # string create qrCode image
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage
    @discardableResult static func aCreateQrCodeImage(_ string : String, size : CGFloat, qrColor : UIColor, bgColor : UIColor) -> UIImage? {
        
        guard let qImage = aCreateQRCodeCIImage(string) else { return nil }
        
        guard let cImage = aCreateClearImage(qImage, size: size) else { return nil }
        
        guard let iImage = aCreateColorImage(cImage, qrColor: qrColor, bgColor: bgColor) else { return nil }
        
        return iImage
    }
    
    
    ///
    /// # string create qrCode image, insert icon
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    ///   - icon: icon
    ///   - iconSize: iconSize
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage?
    @discardableResult static func aCreateQrCodeImage(_ string : String, size : CGFloat, icon : UIImage, iconSize : CGFloat, qrColor : UIColor, bgColor : UIColor) -> UIImage? {
        
        guard let qImage = aCreateQrCodeImage(string, size: size, qrColor: qrColor, bgColor: bgColor) else { return nil }
        
        guard let iImage = aInsertIcon(qImage, icon: icon, size: iconSize) else { return nil }
        
        return iImage
    }
    
    
    ///
    /// # create barCode image
    /// - Parameters:
    ///   - string: string
    ///   - size: size
    /// - Returns: UIImage?
    @discardableResult static func aCreateBarCodeImage(_ string : String, size : CGFloat) -> UIImage? {
        
        guard let bImage = aCreateBarCodeCIImage(string) else { return nil }
        
        guard let cImage = aCreateClearImage(bImage, size: size) else { return nil }
        
        return cImage
    }
}

// MARK: - set view layer private
extension SwpExtensionUtilsProtocol {
    
    ///
    /// # check view
    /// - Parameters:
    ///   - view: view
    ///   - block: block
    /// - Returns: T
    @discardableResult private func aCheckView<T>(_ view : T, block : (_ aView : UIView) -> Void) -> T {
        
        guard view is UIView else { return view }
        
        block(view as! UIView)
        
        return view
    }
}

// MARK: - string create qrCode and barCode private
extension SwpExtensionUtilsProtocol {

    
    ///
    /// # create code CIImage
    /// - Parameters:
    ///   - string: string
    ///   - name: name
    ///   - block: block
    /// - Returns:Returns
    @discardableResult private static func aCreateCodeCIImage(_ string : String, _ name : String, block: ((CIFilter?) -> Void)?) -> UIImage? {
        let data   : Data?      = string.data(using: .utf8)
        let filter : CIFilter?  = CIFilter(name: name)
        
        filter?.setValue(data, forKey: "inputMessage")
        
        block?(filter)
        
        guard let outputImage = filter?.outputImage else { return nil }
        
        return UIImage(ciImage: outputImage)
        
    }
    
    ///
    /// # create qrCode CIImage
    /// - Parameter string:
    /// - Returns:CIImage
    @discardableResult private static func aCreateQRCodeCIImage(_ string : String) -> UIImage? {
        
        return aCreateCodeCIImage(string, "CIQRCodeGenerator", block: { (filter) in
            filter?.setValue("H", forKey: "inputCorrectionLevel")
        })
    }
    
    
    ///
    ///
    /// - Parameter string:
    /// - Returns:
    @discardableResult private static func aCreateBarCodeCIImage(_ string : String) -> UIImage? {
        return aCreateCodeCIImage(string, "CICode128BarcodeGenerator", block: nil)
    }
    
    
    ///
    /// # create qrCode clearImage
    /// - Parameters:
    ///   - image: image
    ///   - size: size
    /// - Returns: UIImage?
    @discardableResult private static func aCreateClearImage(_ image : UIImage, size : CGFloat) -> UIImage? {
        
        guard let ciImage = image.ciImage else { return nil }
        
        let extent : CGRect  = ciImage.extent.integral
        
        
        let scale  : CGFloat = min(size / extent.width, size / extent.height)
        
        //  计算缩放比例
        let width  : CGFloat = extent.width  * scale
        let height : CGFloat = extent.height * scale
        
        //  创建依赖于设备的灰度颜色通道
        let cs = CGColorSpaceCreateDeviceGray();
        //  创建位图上下文
        let bitmapRef   : CGContext? = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 0)
        //  创建上下文
        let context     : CIContext  = CIContext(options: nil)
        
        //  CIImage 转为 CGImage
        let bitmapImage : CGImage?   = context.createCGImage(ciImage, from: extent)
        
        //  设置上下文渲染等级
        bitmapRef?.interpolationQuality = .none
        //  改变上下文的缩放
        bitmapRef?.scaleBy(x: scale, y: scale)
        //  绘制一张图片在位图上下文中
        bitmapRef?.draw(bitmapImage!, in: extent)
        
        //  从位图上下文中取出图片(CGImage)
        guard let clearImage = bitmapRef?.makeImage() else { return nil }
        
        return UIImage(cgImage: clearImage)
    }
    
    ///
    /// # create color image
    /// - Parameters:
    ///   - image:   image
    ///   - qrColor: qrColor
    ///   - bgColor: bgColor
    /// - Returns: UIImage
    @discardableResult private static func aCreateColorImage(_ image : UIImage, qrColor : UIColor, bgColor : UIColor) -> UIImage? {
        
        let ciImage = CIImage(image: image)
        
        let filter  = CIFilter(name:"CIFalseColor")
        
        filter?.setDefaults()
        
        //  设置图片
        filter?.setValue(ciImage, forKeyPath: kCIInputImageKey)
        //  设置二维码颜色
        filter?.setValue(CIColor.init(color: qrColor), forKeyPath: "inputColor0")
        //  设置背景颜色
        filter?.setValue(CIColor.init(color: bgColor), forKeyPath: "inputColor1")
        
        guard let colorImage = filter?.outputImage else { return nil }
        
        return UIImage(ciImage: colorImage)
    }
    
    ///
    /// # insert image icon
    /// - Parameters:
    ///   - image:  image
    ///   - icon:   icon
    ///   - size:   size
    /// - Returns: UIImage?
    @discardableResult private static func aInsertIcon(_ image : UIImage, icon : UIImage ,size : CGFloat) -> UIImage? {
        
        UIGraphicsBeginImageContext(image.size)
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let x : CGFloat = (image.size.width  - size) * 0.5;
        let y : CGFloat = (image.size.height - size) * 0.5;
        icon.draw(in: CGRect(x: x, y: y, width: size, height: size))
        
        guard let iconImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        return iconImage
    }
    
}


// MARK: - UIColor
extension UIColor : SwpExtensionUtilsProtocol { }

// MARK: - UIView
extension UIView  : SwpExtensionUtilsProtocol { }

// MARK: - UIImage
extension UIImage : SwpExtensionUtilsProtocol { }
