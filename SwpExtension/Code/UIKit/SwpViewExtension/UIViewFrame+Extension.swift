//
//  UIViewFrame+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Property
    
    /// view -> frame -> origin -> x
    public var x : CGFloat {
        
        set(x) {
            var frame : CGRect  = self.frame
            frame.origin.x      = x
            self.frame          = frame
        }
        
        get {
            return self.frame.origin.x
        }
    }
    
    /// view -> frame -> origin -> y
    public var y : CGFloat {
        
        set(y) {
            
            var frame : CGRect  = self.frame
            frame.origin.y      = y
            self.frame          = frame
        }
        
        get {
            return self.frame.origin.y
        }
        
    }
    
    
    /// view -> frame -> origin -> width
    public var width : CGFloat {
        
        set(width) {
            var frame : CGRect  = self.frame
            frame.size.width    = width
            self.frame          = frame
        }
        
        get {
            return self.frame.size.width
        }
        
    }
    
    /// view -> frame -> origin -> height
    public var height : CGFloat {
        set(height) {
            var frame : CGRect  = self.frame
            frame.size.height   = height
            self.frame          = frame
        }
        
        get {
            return self.frame.size.height
        }
    }
    
    
    /// view -> center -> centerX
    public var centerX : CGFloat {
        set(centerX) {
            var center : CGPoint = self.center
            center.x = centerX
            self.center = center
        }
        
        get {
            return self.center.x;
        }
        
    }
    
    /// view -> center -> centerY
    public var centerY : CGFloat {
        set(centerY) {
            var center : CGPoint = self.center
            center.y = centerY
            self.center = center
        }
        
        get {
            return self.center.y
        }
    }
    
    /// view -> frame -> size
    public var size : CGSize {
        set(size) {
            var frame : CGRect = self.frame;
            frame.size = size
            self.frame = frame
        }
        
        get {
            return self.frame.size
        }
    }
    
    /// view -> frame -> origin
    public var origin : CGPoint {
        set(origin) {
            var frame : CGRect = self.frame
            frame.origin = origin
            self.frame = frame
        }
        
        get {
            return self.frame.origin
        }
    }
    
    
    // MARK: - Function
    
    
    ///
    /// # set view -> frame -> origin -> x
    /// - Parameter x:  x
    /// - Returns: View
    @discardableResult public func x(_ x : CGFloat) -> Self {
        self.x = x
        return self
    }
    
    ///
    /// # set view -> frame -> origin -> y
    /// - Parameter y:  y
    /// - Returns: View
    @discardableResult public func y(_ y : CGFloat) -> Self {
        self.y = y
        return self
    }
    
    
    ///
    /// # set view -> frame -> size -> width
    /// - Parameter width: width
    /// - Returns: View
    @discardableResult public func width(_ width : CGFloat) -> Self {
        self.width = width
        return self
    }
    
    ///
    /// # set view -> frame -> size -> height
    /// - Parameter height: height
    /// - Returns: View
    @discardableResult public func height(_ height : CGFloat) -> Self {
        self.height = height
        return self
    }
    
    
    ///
    /// # set view -> center -> centerX
    /// - Parameter centerX: centerX
    /// - Returns: View
    @discardableResult public func centerX(_ centerX : CGFloat) -> Self {
        self.centerX = centerX
        return self
    }
    
    ///
    /// # set view -> center -> centerY
    /// - Parameter centerY: centerY
    /// - Returns: View
    @discardableResult public func centerY(_ centerY : CGFloat) -> Self {
        self.centerY = centerY
        return self
    }
    
    ///
    /// # set view -> frame -> size
    /// - Parameter size: size
    /// - Returns: View
    @discardableResult public func size(_ size : CGSize) -> Self {
        self.size = size
        return self
    }
    
    ///
    /// # set view -> frame -> origin
    /// - Parameter origin: origin
    /// - Returns: View
    @discardableResult public func origin(_ origin : CGPoint) -> Self {
        self.origin = origin
        return self
    }
    
    
    
}
