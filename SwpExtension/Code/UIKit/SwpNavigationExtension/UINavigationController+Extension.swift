//
//  UINavigationController+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/14.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension SwpExtensionClass where BaseClass : UINavigationController {
 
    
    /// # set navigation bar background color
    public var barBackgroundColor : UIColor {
        
        set {
            self.swp.navigationBar.swp.backgroundColor = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.backgroundColor
        }
    }
    
    /// # set navigation bar background image
    public var barBackgroundImage : UIImage? {
        
        set {
            self.swp.navigationBar.swp.backgroundImage = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.backgroundImage
        }
    }
    
    /// # set navigation bar tint color
    public var barTintColor : UIColor {
    
        set {
            self.swp.navigationBar.tintColor = newValue
        }
        
        get {
            return self.swp.navigationBar.tintColor
        }
        
    }
    
    /// # set navigation bar hide shadowImage
    public var isHideBarShadowImage : Bool {
        
        set {
            self.swp.navigationBar.swp.isHideShadowImage = newValue
        }
        
        get {
            
            return self.swp.navigationBar.swp.isHideShadowImage
        }
    }
    
    
    /// # set the navigation bar title font
    public var barTitleFont : UIFont {
        set {
            self.swp.navigationBar.swp.titleFont = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.titleFont
        }
    }
    
    
    
    /// # set the navigation bar title color
    public var barTitleColor : UIColor {
        
        set {
            self.swp.navigationBar.swp.titleColor = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.titleColor
        }
    }
    
    /// # hide the navigation bar bottom line
    public var isHideBarBottomLine : Bool {
        
        set {
            self.swp.navigationBar.swp.isHideBottomLine = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.isHideBottomLine
        }
    }
    
    
    /// # set navigation bar alpha
    public var barAlpha : CGFloat {
        
        set {
            self.swp.navigationBar.swp.alpha = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.alpha
        }
    }
    
    /// # set navigation bar items alpha
    public var barItemsAlpha : CGFloat {
        
        set {
            self.swp.navigationBar.swp.itemsAlpha = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.itemsAlpha
        }
    }
    
    /// # set translationY
    public var barTranslationY : CGFloat  {
        
        set {
            self.swp.navigationBar.swp.translationY = newValue
        }
        
        get {
            return self.swp.navigationBar.swp.translationY
        }
    }
    
    /// # get navigation bar height
    public var barHeight : CGFloat {
        return self.swp.navigationBar.swp.height
    }
    
    
    
}

extension SwpExtensionClass where BaseClass : UINavigationController {
    
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
        self.swp.navigationBar.swp.itemsAlpha(alpha, isHide: isHide)
        return self.swp
    }
    
    
    ///
    /// # set the navigation bar title style
    /// - Parameters:
    ///   - color:  color
    ///   - font:   font
    /// - Returns: BaseClass
    @discardableResult public func titleStyle(_ color : UIColor, font : UIFont) -> BaseClass {
        self.swp.navigationBar.swp.titleStyle(color, font: font)
        return self.swp
    }
    
    ///
    /// # remove custom view
    /// - Returns: BaseClass
    @discardableResult public func remove() -> BaseClass {
        self.swp.navigationBar.swp.remove()
        return self.swp
    }
}

extension UINavigationController {
    
    
    
    fileprivate func updateNavigationBar(_ from : UIViewController?, to : UIViewController?, progress : CGFloat) -> Void {
        
//        let fTintColor = self.
    }
    
    ///
    /// # calculation color percent
    /// - Parameters:
    ///   - fColor: fColor
    ///   - tColor: tColor
    ///   - percent: percent
    /// - Returns: UIColor
    fileprivate func calculationColorPercent(_ fColor : UIColor, tColor : UIColor, percent : CGFloat) -> UIColor {
       
        // get from color R G B A
        var fRed    : CGFloat = 0
        var fGreen  : CGFloat = 0
        var fBlue   : CGFloat = 0
        var fAlpha  : CGFloat = 0
        
        fColor.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        
        // get to color R G B A
        var tRed    : CGFloat = 0
        var tGreen  : CGFloat = 0
        var tBlue   : CGFloat = 0
        var tAlpha  : CGFloat = 0
        tColor.getRed(&tRed, green: &tGreen, blue: &tBlue, alpha: &tAlpha)
        
        let red     = fRed   + (tRed    - fRed)   * percent
        let green   = fGreen + (tGreen  - fGreen) * percent
        let blue    = fBlue  + (tBlue   - fBlue)  * percent
        let alpha   = fAlpha + (tAlpha  - fAlpha) * percent

        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    ///
    ///
    /// - Parameters:
    ///   - fAlpha: fAlpha
    ///   - tAlpha: tAlpha
    ///   - percent: percent
    /// - Returns: CGFloat
    fileprivate func calculationAlphaPercent(fAlpha: CGFloat, tAlpha: CGFloat, percent: CGFloat) -> CGFloat {
        return fAlpha + (tAlpha - fAlpha) * percent
    }
    
}


extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.topViewController?.swp.statusBarStyle ?? .default
    }
    
}


