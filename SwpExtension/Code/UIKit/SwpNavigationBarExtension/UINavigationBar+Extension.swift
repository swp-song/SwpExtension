//
//  UINavigationBar+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension UINavigationBar {
    
    private struct SwpNavigationBarRunTimeKeys {
        static let kSwpCustomViewKey        : UnsafeRawPointer = UnsafeRawPointer.init(bitPattern : "kSwpCustomViewKey".hashValue)!
        static let kSwpBackgroundColorKey   : UnsafeRawPointer = UnsafeRawPointer.init(bitPattern : "kSwpBackgroundColorKey".hashValue)!
        static let kSwpHiddenBottomLineKey  : UnsafeRawPointer = UnsafeRawPointer.init(bitPattern : "kSwpHiddenBottomLine".hashValue)!
        static let kSwpTitleFontKey         : UnsafeRawPointer = UnsafeRawPointer.init(bitPattern : "kSwpTitleFontKey".hashValue)!
        static let kSwpTitleColorKey        : UnsafeRawPointer = UnsafeRawPointer.init(bitPattern : "kSwpTitleColorKey".hashValue)!
    }
    
    // MARK: - Public Property
    
    /// set the navigation bar background color
    public var swpBackgroundColor : UIColor {
        set {
            objc_setAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpBackgroundColorKey, newValue, .OBJC_ASSOCIATION_COPY)
            navigationBarBackgroundColor(color: newValue)
        }
        
        get {
            return objc_getAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpBackgroundColorKey) as! UIColor
        }
        
    }
    
    /// hide the navigation bar bottom line
    public var isHiddenBottomLine : Bool {
        
        set {
            objc_setAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpHiddenBottomLineKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            isHiddenBottomLine(isHidden: newValue)
        }
        
        get {
            return objc_getAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpHiddenBottomLineKey) as! Bool
        }
    }
    
    
    
    /// set the navigation bar title font
    public var swpTitleFont : UIFont {
        
        set {
            objc_setAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpTitleFontKey, newValue, .OBJC_ASSOCIATION_COPY)
            swpTitleFont(font: newValue)
        }
        
        get {
            return objc_getAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpTitleFontKey) as! UIFont
        }
    }
    
    
    /// set the navigation bar title color
    public var swpTitleColor : UIColor {
        set {
            objc_setAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpTitleColorKey, newValue, .OBJC_ASSOCIATION_COPY)
            swpTitleColor(color: newValue)
        }
        get {
            return objc_getAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpTitleColorKey) as! UIColor
        }
    }

    
    /// get navigation bar height
    public var swpNavigationBarHeight : CGFloat {
        
        if #available(iOS 11.0, *) {
            return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
        } else {
            return self.bounds.size.height + 20
        }
    }
    
    // MARK: - Public Function
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    /// - Returns: UINavigationBar
    @discardableResult public func swpBackgroundColor(color : UIColor) -> Self {
        self.swpBackgroundColor = color
        return self
    }
    
    
    ///
    /// # hide the navigation bar bottom line
    /// - Parameter isHidden: isHidden
    /// - Returns: UINavigationBar
    @discardableResult public func isHiddenBottomLine(isHidden : Bool) -> Self {
        
        if let imageView : UIImageView = findLineImageViewUnder(view: self) {
            imageView.isHidden = isHidden
        }
        
        return self
    }
    
    
    ///
    /// # set the navigation bar title font
    /// - Parameter font: font
    /// - Returns: UINavigationBar
    @discardableResult public func swpTitleFont(font : UIFont) -> Self {
        self.titleTextAttributes = [NSAttributedStringKey.font:font]
        return self
    }
    
    
    
    ///
    /// # set the navigation bar title color
    /// - Parameter color: color
    /// - Returns: UINavigationBar
    @discardableResult public func swpTitleColor(color : UIColor) -> Self {
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor:color]
        return self
    }
    
    ///
    /// # set the navigation bar title style
    /// - Parameters:
    ///   - font:   font
    ///   - color:  color
    /// - Returns: UINavigationBar
    @discardableResult public func swpTitleStyle(font : UIFont, color : UIColor) -> Self {
        self.titleTextAttributes = [NSAttributedStringKey.font : font, NSAttributedStringKey.foregroundColor : color]
        return self
    }
    
    
    
    ///
    /// # swpRemove, 移除控件
    /// - Returns: UINavigationBar
    @discardableResult public func swpRemove() -> Self {
        self.setBackgroundImage(nil, for:.default)
        self.customView?.removeFromSuperview()
        self.customView = nil
        return self
    }

    
    // MARK: - Private
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    private func navigationBarBackgroundColor(color : UIColor) -> Void {
        
        if self.customView == nil {

            self.customView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.swpNavigationBarHeight))
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.customView?.isUserInteractionEnabled = false
            self.customView?.autoresizingMask         = .flexibleWidth
            self.subviews.first?.insertSubview(self.customView!, at: 0)
        }

        self.customView?.backgroundColor = color
    }
    
    ///
    /// # find the bottom line
    /// - Parameter view: view
    /// - Returns: UIImageView?
    private func findLineImageViewUnder(view : UIView) -> UIImageView?  {
        
        
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            //        if view.isKind(of: UIImageView.self) && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        
        for subview in view.subviews {
            
            if let imageView : UIImageView = self.findLineImageViewUnder(view: subview) {
                return imageView
            }
        }
        return nil
    }
    
    
    
    // MARK: - Private Property
    
    private var customView : UIView? {
        set {
            objc_setAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpCustomViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, SwpNavigationBarRunTimeKeys.kSwpCustomViewKey) as? UIView
        }
    }
    
    
}

