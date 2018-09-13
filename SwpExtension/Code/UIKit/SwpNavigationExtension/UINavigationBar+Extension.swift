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
            self.swp.aBackgroundColor(newValue)
        }
        
        get {
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor) as? UIColor else { return UINavigationBar.aKeys.kBackgroundColor }
            return value
        }
    }
    
    
    /// # set the navigation bar background image
    public var backgroundImage : UIImage? {
        
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundImage, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.aBackgroundImage(newValue)
        }
        
        get {

            return objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundImage) as? UIImage
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
    
    
    /// # set background alpha
    public var backgroundAlpha : CGFloat {
        
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundAlpha, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aBackgroundAlpha(newValue)
        }
        
        get {
            guard let value = objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundAlpha) as? CGFloat else { return UINavigationBar.aKeys.kBackgroundAlpha }
            
            return value
        }
    }
    
    
    ///
    /// # set items alpha
    /// - Parameters:
    ///   - alpha: alpha
    ///   - isAlphaItems: isAlphaItems
    /// - Returns: BaseClass
    @discardableResult public func backgroundItemsAlpha(_ alpha : CGFloat, isAlphaItems : Bool) -> BaseClass {
        
        self.swp.aBackgroundItemsAlpha(alpha, isAlphaItems: isAlphaItems)
        return self.swp
    }
    
    
    
    /// # set translationY
    public var translationY : CGFloat  {

        set {
            self.swp.transform = CGAffineTransform(translationX: 0, y: newValue)
        }
        
        get {
            return self.swp.transform.ty
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
        static var kCustomView          : UIView?       = UIView()
        static var kCustomImageView     : UIImageView   = UIImageView()
        static var kBackgroundColor     : UIColor       = UIColor.black
        static var kBackgroundImage     : UIImage?      = nil
        static var kIsHideBottomLine    : Bool          = false
        static var kTitleFont           : UIFont        = UIFont.systemFont(ofSize: 15)
        static var kTitleColor          : UIColor       = UIColor.black
        static var kBackgroundAlpha     : CGFloat       = 0
    }
    
    fileprivate func aHideBottomLine(_ isHidden : Bool) -> Void {
        if let imageView : UIImageView = aFindLineImageView(view: self) {
            imageView.isHidden = isHidden
        }
    }
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    fileprivate func aBackgroundColor(_ color : UIColor) -> Void {

        if self.customImageView != nil {
            self.customImageView?.removeFromSuperview()
            self.customImageView = nil
        }
        
        if self.customView == nil {
            self.customView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
            self.customView?.isUserInteractionEnabled = false
            self.customView?.autoresizingMask         = .flexibleWidth
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.subviews.first?.insertSubview(self.customView!, at: 0)
        }
        
        self.customView?.backgroundColor = color
    }
    
    
    ///
    /// # set the navigation bar background image
    /// - Parameter image: image
    fileprivate func aBackgroundImage(_ image : UIImage?) -> Void {
        
        if self.customView != nil {
            self.customView?.removeFromSuperview()
            self.customView = nil
        }
        
        if self.customImageView == nil {
            self.customImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
            self.customImageView?.isUserInteractionEnabled = false
            self.customImageView?.autoresizingMask          = .flexibleWidth
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.subviews.first?.insertSubview(self.customImageView!, at: 0)
        }
        
        self.customImageView?.image = image
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
        self.customImageView?.removeFromSuperview()
        self.customView = nil
    }
    
    ///
    /// # set items alpha
    /// # set background alpha
    /// - Parameter alpha: alpha
    fileprivate func aBackgroundAlpha(_ alpha : CGFloat) -> Void {
        
        guard let backgroundView = self.subviews.first else { return }
        
        if #available(iOS 11.0, *) {
            
            backgroundView.subviews.forEach { (view) in
                view.alpha = alpha
            }
            
        } else {
            backgroundView.alpha = alpha
        }
    }
    
    
    
    ///
    ///
    /// - Parameters:
    ///   - alpha: alpha
    ///   - isAlphaItems: isAlphaItems
    fileprivate func aBackgroundItemsAlpha(_ alpha : CGFloat, isAlphaItems : Bool) -> Void {
        
        for view in self.subviews {
            
            if isAlphaItems {
    
                if let _UIBarBackgroundClass = NSClassFromString("_UIBarBackground") {
                    if !view.isKind(of: _UIBarBackgroundClass) {
                        view.alpha = alpha
                    }
                }
                
                if let _UINavigationBarBackground = NSClassFromString("_UINavigationBarBackground") {
                    if !view.isKind(of: _UINavigationBarBackground) {
                        view.alpha = alpha
                    }
                }
                
            } else {
            
                guard let _UINavigationBarBackIndicatorViewClass = NSClassFromString("_UINavigationBarBackIndicatorView") else { return }

                if !view.isKind(of: _UINavigationBarBackIndicatorViewClass) { return }

                if let _UIBarBackgroundClass = NSClassFromString("_UIBarBackground"), !view.isKind(of: _UIBarBackgroundClass) {
                    view.alpha = alpha
                }

                if let _UINavigationBarBackground = NSClassFromString("_UINavigationBarBackground"), !view.isKind(of: _UINavigationBarBackground) {
                    view.alpha = alpha
                }
                
            }
            
        }
        
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
    
    
    /// customView
    private var customView : UIView? {
        set {
            
            objc_setAssociatedObject(self, &aKeys.kCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        get {
            return objc_getAssociatedObject(self, &aKeys.kCustomView) as? UIView
        }
    }
    
    /// customImageView
    private var customImageView : UIImageView? {
        
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.kCustomImageView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &UINavigationBar.aKeys.kCustomImageView) as? UIImageView
        }
        
    }

}

