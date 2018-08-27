//
//  UIViewFrame+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

extension SwpExtensionClass where BaseExtension : UIView  {

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
    @discardableResult public func x(_ x : CGFloat) -> BaseExtension {
        self.x = x
        return self.swp
    }
    
    ///
    /// # set view -> frame -> origin -> y
    /// - Parameter y:  y
    /// - Returns: View
    @discardableResult public func y(_ y : CGFloat) -> BaseExtension {
        self.y = y
        return self.swp
    }
    
    
    ///
    /// # set view -> frame -> size -> width
    /// - Parameter width: width
    /// - Returns: View
    @discardableResult public func width(_ width : CGFloat) -> BaseExtension {
        self.width = width
        return self.swp
    }
    
    ///
    /// # set view -> frame -> size -> height
    /// - Parameter height: height
    /// - Returns: View
    @discardableResult public func height(_ height : CGFloat) -> BaseExtension {
        self.height = height
        return self.swp
    }
    
    
    ///
    /// # set view -> center -> centerX
    /// - Parameter centerX: centerX
    /// - Returns: View
    @discardableResult public func centerX(_ centerX : CGFloat) -> BaseExtension {
        self.centerX = centerX
        return self.swp
    }
    
    ///
    /// # set view -> center -> centerY
    /// - Parameter centerY: centerY
    /// - Returns: View
    @discardableResult public func centerY(_ centerY : CGFloat) -> BaseExtension {
        self.centerY = centerY
        return self.swp
    }
    
    ///
    /// # set view -> frame -> size
    /// - Parameter size: size
    /// - Returns: View
    @discardableResult public func size(_ size : CGSize) -> BaseExtension {
        self.size = size
        return self.swp
    }
    
    ///
    /// # set view -> frame -> origin
    /// - Parameter origin: origin
    /// - Returns: View
    @discardableResult public func origin(_ origin : CGPoint) -> BaseExtension {
        self.origin = origin
        return self.swp
    }
}

