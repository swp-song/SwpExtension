//
//  UIImage+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/30.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionClass where BaseClass : UIImage {
    

    
    @discardableResult public static func screenshots( _ view : UIView) -> UIImage {
        return UIImage.swp.aScreenshots(view)
    }
    
    public static var screenshotsFull : UIImage? {
        guard let data = self.screenshotsFullData else { return nil }
        return UIImage(data: data)
    }
    
    public static var screenshotsFullData : Data? {
        return UIImage.swp.aScreenshotsFullData()
    }
    
    
}

extension SwpExtensionClass where BaseClass : UIImage {
    
    
    private static func aScreenshotsFullData() -> Data? {
        
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
    
    
    private static func aScreenshots(_ view : UIView ) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext();
        return image
    }
    
}

