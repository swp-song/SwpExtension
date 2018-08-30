//
//  UIViewFrame+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit


extension SwpExtensionClass where BaseClass : UIView {
    
    
    
    /// # view screenshots
    public var screenshots : UIImage? {
        return viewScreenshots()
    }
    
    ///
    /// # view screenshots
    /// - Returns: UIImage
    private func viewScreenshots() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.swp.frame.size, false, 0.0)
        self.swp.drawHierarchy(in: self.swp.bounds, afterScreenUpdates: false)
        let image : UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image
    }
    
}


// MARK: - View layer
extension SwpExtensionClass where BaseClass : UIView {
    
    
    ///
    /// # set background color
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func backgroundColor(_ color : UIColor?) -> BaseClass {
        self.swp.backgroundColor = color
        return self.swp
    }
    
    ///
    /// # set view layer borderWidth
    /// - Parameter width: width
    /// - Returns: BaseClass
    @discardableResult public func borderWidth(_ width : CGFloat) -> BaseClass {
        self.swp.layer.borderWidth = width
        return self.swp
    }
    
    ///
    /// # set view layer cornerRadius
    /// - Parameter radius: radius
    /// - Returns: BaseClass
    @discardableResult public func cornerRadius(_ radius : CGFloat) -> BaseClass {
        self.swp.layer.cornerRadius = radius
        return self.swp
    }
    
    ///
    /// # set view layer masksToBounds
    /// - Parameter masksToBounds: masksToBounds
    /// - Returns: BaseClass
    @discardableResult public func masksToBounds(_ masksToBounds : Bool) -> BaseClass {
        self.swp.layer.masksToBounds = masksToBounds
        return self.swp
    }
    
    ///
    /// # set view layer cornerRadiusMasks
    /// - Parameter radiusMasks: radiusMasks
    /// - Returns: BaseClass
    @discardableResult public func cornerRadiusMasks(_ radiusMasks : CGFloat) -> BaseClass {
        return self.cornerRadius(radiusMasks).swp.masksToBounds(true)
    }
    
    ///
    /// # set view layer borderColo
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func borderColo(_ color : UIColor) -> BaseClass {
        self.swp.layer.borderColor = color.cgColor
        return self.swp
    }
}



// MARK: - View frame
extension SwpExtensionClass where BaseClass : UIView  {

    // MARK: - Property
    
    /// view -> frame -> origin -> x
    public var x : CGFloat {
        
        set(x) {
            var frame : CGRect  = self.swp.frame
            frame.origin.x      = x
            self.swp.frame      = frame
        }
        
        get {
            return self.swp.frame.origin.x
        }
    }
    
    /// view -> frame -> origin -> y
    public var y : CGFloat {
        
        set(y) {
            
            var frame : CGRect  = self.swp.frame
            frame.origin.y      = y
            self.swp.frame      = frame
        }
        
        get {
            return self.swp.frame.origin.y
        }
        
    }
    
    
    /// view -> frame -> origin -> width
    public var width : CGFloat {
        
        set(width) {
            var frame : CGRect  = self.swp.frame
            frame.size.width    = width
            self.swp.frame      = frame
        }
        
        get {
            return self.swp.frame.size.width
        }
        
    }
    
    /// view -> frame -> origin -> height
    public var height : CGFloat {
        set(height) {
            var frame : CGRect  = self.swp.frame
            frame.size.height   = height
            self.swp.frame          = frame
        }
        
        get {
            return self.swp.frame.size.height
        }
    }
    
    
    /// view -> center -> centerX
    public var centerX : CGFloat {
        set(centerX) {
            var center : CGPoint = self.swp.center
            center.x = centerX
            self.swp.center = center
        }
        
        get {
            return self.swp.center.x;
        }
        
    }
    
    /// view -> center -> centerY
    public var centerY : CGFloat {
        set(centerY) {
            var center : CGPoint = self.swp.center
            center.y = centerY
            self.swp.center = center
        }
        
        get {
            return self.swp.center.y
        }
    }
    
    /// view -> frame -> size
    public var size : CGSize {
        set(size) {
            var frame : CGRect = self.swp.frame;
            frame.size = size
            self.swp.frame = frame
        }
        
        get {
            return self.swp.frame.size
        }
    }
    
    /// view -> frame -> origin
    public var origin : CGPoint {
        set(origin) {
            var frame : CGRect = self.swp.frame
            frame.origin = origin
            self.swp.frame = frame
        }
        
        get {
            return self.swp.frame.origin
        }
    }
    
    
    // MARK: - Function
    
    
    ///
    /// # set view -> frame -> origin -> x
    /// - Parameter x:  x
    /// - Returns: View
    @discardableResult public func x(_ x : CGFloat) -> BaseClass {
        self.x = x
        return self.swp
    }
    
    ///
    /// # set view -> frame -> origin -> y
    /// - Parameter y:  y
    /// - Returns: View
    @discardableResult public func y(_ y : CGFloat) -> BaseClass {
        self.y = y
        return self.swp
    }
    
    
    ///
    /// # set view -> frame -> size -> width
    /// - Parameter width: width
    /// - Returns: View
    @discardableResult public func width(_ width : CGFloat) -> BaseClass {
        self.width = width
        return self.swp
    }
    
    ///
    /// # set view -> frame -> size -> height
    /// - Parameter height: height
    /// - Returns: View
    @discardableResult public func height(_ height : CGFloat) -> BaseClass {
        self.height = height
        return self.swp
    }
    
    
    ///
    /// # set view -> center -> centerX
    /// - Parameter centerX: centerX
    /// - Returns: View
    @discardableResult public func centerX(_ centerX : CGFloat) -> BaseClass {
        self.centerX = centerX
        return self.swp
    }
    
    ///
    /// # set view -> center -> centerY
    /// - Parameter centerY: centerY
    /// - Returns: View
    @discardableResult public func centerY(_ centerY : CGFloat) -> BaseClass {
        self.centerY = centerY
        return self.swp
    }
    
    ///
    /// # set view -> frame -> size
    /// - Parameter size: size
    /// - Returns: View
    @discardableResult public func size(_ size : CGSize) -> BaseClass {
        self.size = size
        return self.swp
    }
    
    ///
    /// # set view -> frame -> origin
    /// - Parameter origin: origin
    /// - Returns: View
    @discardableResult public func origin(_ origin : CGPoint) -> BaseClass {
        self.origin = origin
        return self.swp
    }
}

