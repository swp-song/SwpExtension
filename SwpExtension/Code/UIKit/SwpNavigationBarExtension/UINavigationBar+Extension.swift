//
//  UINavigationBar+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionClass where BaseClass : UINavigationBar {
    
    /// # set the navigation bar background color
    public var backgroundColor : UIColor {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.aBackgroundColor(color: newValue)
        }
        
        get {
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor) as? UIColor else { return UINavigationBar.aKeys.kBackgroundColor }
            return value
        }
    }
    
    
    /// # set the navigation bar title font
    public var titleFont : UIFont {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleFont, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.titleTextAttributes = [NSAttributedStringKey.font : newValue]
        }
        
        get {
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleFont) as? UIFont else { return UINavigationBar.aKeys.kTitleFont }
            return value
        }
    }
    
    
    
    /// # set the navigation bar title color
    public var titleColor : UIColor {
        
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.titleTextAttributes = [NSAttributedStringKey.foregroundColor : newValue]
        }
        
        get {
            
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleColor) as? UIColor  else { return UINavigationBar.aKeys.kTitleColor }
            return value
        }
    }
    
    /// # hide the navigation bar bottom line
    public var isHideBottomLine : Bool {
        
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideBottomLine, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aHideBottomLine(newValue)
        }
        
        get {
        
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideBottomLine) as? Bool else { return UINavigationBar.aKeys.kIsHideBottomLine }
            return value
        }
    }
    
    
    /// # get navigation bar height
    public var height : CGFloat {
        return self.swp.aHeight
    }
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func backgroundColor(_ color : UIColor) -> BaseClass {
        self.backgroundColor = color
        return self.swp
    }
    
    ///
    /// # set the navigation bar title font
    /// - Parameter font: font
    /// - Returns: BaseClass
    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
        self.titleFont = font
        return self.swp
    }
    
    
    ///
    /// # set the navigation bar title color
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func titleColor(_ color : UIColor) -> BaseClass {
        self.titleColor = color
        return self.swp
    }
    
    ///
    /// # hide the navigation bar bottom line
    /// - Parameter isHide: isHide
    /// - Returns: BaseClass
    @discardableResult public func isHideBottomLine(_ isHide : Bool) -> BaseClass {
        self.isHideBottomLine = isHide
        return self.swp
    }
    
    
    ///
    /// # set the navigation bar title style
    /// - Parameters:
    ///   - color:  color
    ///   - font:   font
    /// - Returns: BaseClass
    @discardableResult public func titleStyle(_ color : UIColor, font : UIFont) -> BaseClass {
        self.swp.titleTextAttributes = [NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font : font]
        return self.swp
    }
    
    
    ///
    /// # remove custom view
    /// - Returns: BaseClass
    @discardableResult public func remove() -> BaseClass {
        self.swp.aRemove()
        return self.swp
    }
    
}


// MARK: - private
extension UINavigationBar {
    
    fileprivate struct aKeys {
        static var kCustomView       : UIView? = UIView()
        static var kBackgroundColor  : UIColor = UIColor.black
        static var kIsHideBottomLine : Bool    = false
        static var kTitleFont        : UIFont  = UIFont.systemFont(ofSize: 15)
        static var kTitleColor       : UIColor = UIColor.black
    }
    
    fileprivate func aHideBottomLine(_ isHidden : Bool) -> Void {
        if let imageView : UIImageView = aFindLineImageView(view: self) {
            imageView.isHidden = isHidden
        }
    }
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    fileprivate func aBackgroundColor(color : UIColor) -> Void {

        if self.customView == nil {
            self.customView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
            self.customView?.isUserInteractionEnabled = false
            self.customView?.autoresizingMask         = .flexibleWidth
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.subviews.first?.insertSubview(self.customView!, at: 0)
        }
        
        self.customView?.backgroundColor = color
    }
    
    
    
    /// #  get navigation bar height
    fileprivate var aHeight : CGFloat {
        
        
        if #available(iOS 11.0, *) {
            
//            if (UIApplication.shared.keyWindow?.safeAreaInsets.top)! > 0.0 {
//                return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
//            }
            
//            return self.bounds.size.height + 20
            return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
        } else {
            return self.bounds.size.height + 20
        }
    }
    
    
    /// # remove custom view
    fileprivate func aRemove() -> Void {
        self.setBackgroundImage(nil, for:.default)
        self.customView?.removeFromSuperview()
        self.customView = nil
    }
    
    ///
    /// # find the bottom line
    /// - Parameter view: view
    /// - Returns: UIImageView?
    private func aFindLineImageView(view : UIView) -> UIImageView?  {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
//        if view.isKind(of: UIImageView.self) && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        
        for subview in view.subviews {
            
            if let imageView : UIImageView = self.aFindLineImageView(view: subview) {
                return imageView
            }
        }
        return nil
    }
    
    // MARK: - Private Property
    private var customView : UIView? {
        set {
            
            objc_setAssociatedObject(self, &aKeys.kCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        get {
            return objc_getAssociatedObject(self, &aKeys.kCustomView) as? UIView
        }
    }

}

