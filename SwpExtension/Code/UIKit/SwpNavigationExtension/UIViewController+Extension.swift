//
//  UIViewController+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/14.
//  Copyright © 2018年 swp-song. All rights reserved.
//



// MARK: - controller property
extension SwpExtensionClass where BaseClass : UIViewController {
    
    public var isPush : Bool {
        set {
            objc_setAssociatedObject(self.swp, &UIViewController.aKey.kIsPush, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            
            guard let value = objc_getAssociatedObject(self.swp, &UIViewController.aKey.kIsPush) as? Bool else { return UIViewController.aKey.kIsPush }
            return value
        }
    }
    
    
    public var statusBarStyle : UIStatusBarStyle {
        
        set {
            objc_setAssociatedObject(self.swp, &UINavigationController.aKey.kStatusBarStyle, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.statusBarStyle(newValue)
        }
        
        get {
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationController.aKey.kStatusBarStyle) as? UIStatusBarStyle else { return UINavigationController.aKey.kStatusBarStyle }
            return value
        }
    }
    
}


extension SwpExtensionClass where BaseClass : UIViewController {
    
    @discardableResult public func statusBarStyle(_ statusBarStyle : UIStatusBarStyle) -> BaseClass {
        self.swp.setNeedsStatusBarAppearanceUpdate()
        return self.swp
    }
    
    
}


// MARK: - navigation bar property
extension SwpExtensionClass where BaseClass : UIViewController {
    
    
    /// # set navigation bar background color
    public var barBackgroundColor : UIColor {
        
        set {
            self.swp.navigationController?.swp.barBackgroundColor = newValue
        }
        
        get {
            
            return self.swp.checkValue(self.swp.navigationController?.swp.barBackgroundColor, dValue: UIViewController.aKey.kBarBackgroundColor, block: { (value) -> UIColor in
                return value
            })
        }
    }
    

    /// # set background image
    public var barBackgroundImage : UIImage? {
        
        set {
            self.swp.navigationController?.swp.barBackgroundImage = newValue
        }
        
        get {

            return self.swp.navigationController?.swp.barBackgroundImage
        }
    }
    
    /// # set navigation bar tint color
    public var barTintColor : UIColor {

        set {
            self.swp.navigationController?.swp.barTintColor = newValue
        }

        get {
            
            return self.swp.checkValue(self.swp.navigationController?.swp.barTintColor, dValue: UIViewController.aKey.kBarTintColor, block: { (value) -> UIColor in
                return value
            })
        }
    }
    
    /// # set navigation bar hide shadowImage
    public var isHideBarShadowImage : Bool {
        
        set {
            self.swp.navigationController?.swp.isHideBarShadowImage = newValue
        }
        
        get {
            return self.swp.checkValue(self.swp.navigationController?.swp.isHideBarShadowImage, dValue: UIViewController.aKey.kIsHideBarShadowImage, block: { (value) -> Bool in
                return value
            })
        }
    }
    
    /// # set the navigation bar title font
    public var barTitleFont : UIFont {
        set {
            self.swp.navigationController?.swp.barTitleFont = newValue
        }
        
        get {
            return self.swp.checkValue(self.swp.navigationController?.swp.barTitleFont, dValue: UIViewController.aKey.kBarTitleFont, block: { (value) -> UIFont in
                return value
            })
        }
    }
    
    
    /// # set the navigation bar title color
    public var barTitleColor : UIColor {
        
        set {
            self.swp.navigationController?.swp.barTitleColor = newValue
        }
        
        get {
            return self.swp.checkValue(self.swp.navigationController?.swp.barTitleColor, dValue:UIViewController.aKey.kBarTitleColor , block: { (value) -> UIColor in
                return value
            })
        }
    }
    
    /// # hide the navigation bar bottom line
    public var isHideBarBottomLine : Bool {
        
        set {
            self.swp.navigationController?.swp.isHideBarBottomLine = newValue
        }
        
        get {
            return self.swp.checkValue(self.swp.navigationController?.swp.isHideBarBottomLine, dValue:UIViewController.aKey.kIsHideBarBottomLine , block: { (value) -> Bool in
                return value
            })
        }
    }
    
    /// # set navigation bar alpha
    public var barAlpha : CGFloat {
        
        set {
           self.swp.navigationController?.swp.barAlpha = newValue
        }
        
        get {
            
            return self.swp.checkValue(self.swp.navigationController?.swp.barAlpha, dValue:UIViewController.aKey.kBarAlpha , block: { (value) -> CGFloat in
                return value
            })
        }
    }
    
    /// # set navigation bar items alpha
    public var barItemsAlpha : CGFloat {

        set {
            self.swp.navigationController?.swp.barItemsAlpha = newValue
        }

        get {
            
            return self.swp.checkValue(self.swp.navigationController?.swp.barItemsAlpha, dValue:UIViewController.aKey.kItemsAlpha, block: { (value) -> CGFloat in
                return value
            })
        }
    }

    /// # set translationY
    public var barTranslationY : CGFloat  {

        set {
            self.swp.navigationController?.swp.barTranslationY = newValue
        }

        get {
            
            return self.swp.checkValue(self.swp.navigationController?.swp.barTranslationY, dValue:UIViewController.aKey.kBarTranslationY, block: { (value) -> CGFloat in
                return value
            })
        }
    }

    
    /// # get navigation bar height
    public var barHeight : CGFloat {
        
        return self.swp.checkValue(self.swp.navigationController?.swp.barHeight, dValue: UIViewController.aKey.kBarHeight, block: { (value) -> CGFloat in
            return value
        })
    }
    
}

// MARK: - navigation bar function
extension SwpExtensionClass where BaseClass : UIViewController {

    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func backgroundColor(_ color : UIColor) -> BaseClass {
        self.barBackgroundColor = color
        return self.swp
    }
    
    ///
    /// # set the navigation bar title font
    /// - Parameter font: font
    /// - Returns: BaseClass
    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
        self.barTitleFont = font
        return self.swp
    }
    
    ///
    /// # set the navigation bar title color
    /// - Parameter color: color
    /// - Returns: BaseClass
    @discardableResult public func titleColor(_ color : UIColor) -> BaseClass {
        self.barTitleColor = color
        return self.swp
    }
    
    ///
    /// # hide the navigation bar bottom line
    /// - Parameter isHide: isHide
    /// - Returns: BaseClass
    @discardableResult public func isHideBottomLine(_ isHide : Bool) -> BaseClass {
        self.isHideBarBottomLine = isHide
        return self.swp
    }
    
    
    
    ///
    /// # set navigation bar alpha
    /// - Parameter alpha:
    /// - Returns:
    @discardableResult public func barAlpha(_ alpha : CGFloat) -> BaseClass {
        self.barAlpha = alpha
        return self.swp
    }
    
    
    ///
    /// # set navigation bar items alpha
    /// - Parameters:
    ///   - alpha:  alpha
    ///   - isHide: isHide
    /// - Returns: BaseClass
    @discardableResult public func barItemsAlpha(_ alpha : CGFloat, isHide : Bool) -> BaseClass {
        self.swp.navigationController?.swp.barItemsAlpha(alpha, isHide: isHide)
        return self.swp
    }
    
    ///
    /// # set the navigation bar title style
    /// - Parameters:
    ///   - color:  color
    ///   - font:   font
    /// - Returns: BaseClass
    @discardableResult public func titleStyle(_ color : UIColor, font : UIFont) -> BaseClass {
        self.swp.navigationController?.swp.titleStyle(color, font: font)
        return self.swp
    }
    
    ///
    /// # remove custom view
    /// - Returns: BaseClass
    @discardableResult public func remove() -> BaseClass {
        self.swp.navigationController?.swp.remove()
        return self.swp
    }
}

extension UIViewController {
    
    fileprivate struct aKey {
        // navigation bar
        static var kBarBackgroundColor      : UIColor   = UIColor.white
        static var kBarTintColor            : UIColor   = UIColor.white
        static var kIsHideBarShadowImage    : Bool      = false
        static var kBarTitleFont            : UIFont    = UIFont.systemFont(ofSize: 18)
        static var kBarTitleColor           : UIColor   = UIColor.black
        static var kIsHideBarBottomLine     : Bool      = false
        static var kBarAlpha                : CGFloat   = 1
        static var kItemsAlpha              : CGFloat   = 1
        static var kBarTranslationY         : CGFloat   = 0
        static var kBarHeight               : CGFloat   = 44
        
        static var kIsPush                  : Bool      = false
        
        static var kStatusBarStyle          : UIStatusBarStyle = .default
       
    }
    
    ///
    /// # check value is empty
    /// - Parameters:
    ///   - value:  value
    ///   - dValue: dValue
    ///   - block:  block
    /// - Returns:  T
    fileprivate func checkValue<T>(_ value : T?, dValue : T, block:( (_ value : T) -> T)? ) -> T {
        guard let value = value else { return dValue }
        return block?(value) ?? dValue
    }
    
    
    
}
