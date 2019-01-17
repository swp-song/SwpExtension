//
//  UINavigationBar+Extension.swift
//  swp_song
//
//  Created by swp-song on 2019/1/14.
//  Copyright © 2019 swp-song. All rights reserved.
//


extension SwpExtensionClass where BaseClass : UINavigationBar {
    

    public var backgroundColor : UIColor {
    
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.aBackgroundColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.aCustomViewBackgroundColor(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationBar.aKeys.aBackgroundColor) as? UIColor, dValue:UINavigationBar.aKeys.aBackgroundColor, block: { (value) -> UIColor in
                return value
            })
        }
    }
    
    public var backgroundImage : UIImage? {
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.aBackgroundImage, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.aImageViewBackgroundImage(newValue)
        }
        
        get {
            return objc_getAssociatedObject(self, &UINavigationBar.aKeys.aBackgroundImage) as? UIImage
        }
    }
    
    public var isCleanBackground : Bool {
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackground, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aClean(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackground) as? Bool, dValue: UINavigationBar.aKeys.aCleanBackground, block: { (value) -> Bool in
                return value
            })
        }
    }
    
    public var isCleanBackgroundColor : Bool {
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackgroundColor, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aCleanCustomView(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackgroundColor) as? Bool, dValue: UINavigationBar.aKeys.aCleanBackgroundColor, block: { (value) -> Bool in
                return value
            })
        }
    }
    
    public var isCleanBackgroundImage : Bool {
        set {
            objc_setAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackgroundImage, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aCleanImageView(newValue)
        }
        
        get {
            
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationBar.aKeys.aCleanBackgroundImage) as? Bool, dValue: UINavigationBar.aKeys.aCleanBackgroundImage, block: { (value) -> Bool in
                return value
            })
        }
    }
    
    /// # hide the navigation bar bottom line
    public var isHideBottomLine : Bool {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.aHideBottomLine, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.swp.aHideBottomLine(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.aHideBottomLine) as? Bool, dValue: UINavigationBar.aKeys.aHideBottomLine, block: { (value) -> Bool in
                return value
            })
        }
    }
    
    /// # set the navigation bar title font
    public var titleFont : UIFont {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.aTitleFont, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.titleTextAttributes = self.swp.aTitleStyle(newValue, key: .font)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.aTitleFont) as? UIFont, dValue: UINavigationBar.aKeys.aTitleFont, block: { (value) -> UIFont in
                return value
            })
        }
    }
    
    /// # set the navigation bar title color
    public var titleColor : UIColor {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.aTitleColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.titleTextAttributes = self.swp.aTitleStyle(newValue, key: .foregroundColor)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.aTitleColor) as? UIColor, dValue: UINavigationBar.aKeys.aTitleColor, block: { (value) -> UIColor in
                return value
            })
        }
    }
    
}

extension UINavigationBar {
    
    fileprivate struct aKeys {
        static var aBackgroundColor      : UIColor  = .white
        static var aBackgroundImage      : UIImage? = nil
        static var aCleanBackground      : Bool     = false
        static var aCleanBackgroundColor : Bool     = false
        static var aCleanBackgroundImage : Bool     = false
        static var aHideBottomLine       : Bool     = false
        static var aTitleFont            : UIFont   = UIFont.systemFont(ofSize: 18)
        static var aTitleColor           : UIColor  = UIColor.black
    }
    
    
    ///
    /// # check data type
    /// - Parameters:
    ///   - value:  value
    ///   - dValue: dValue
    ///   - block:  block
    /// - Returns: T
    fileprivate func aCheckValue<T>(_ value : T?, dValue : T, block:( ( _ value : T ) -> T)? ) -> T {
        guard let value = value else { return dValue }
        return block?(value) ?? dValue
    }
    
    ///
    /// # set title style
    /// - Parameters:
    ///   - value: value
    ///   - key:   key
    /// - Returns: Array
    fileprivate func aTitleStyle(_ value : Any?, key : NSAttributedString.Key) -> [NSAttributedString.Key : Any]? {
        guard let nValue     = value else { return self.titleTextAttributes }
        guard var attributes = self.titleTextAttributes else { return [key : nValue] }
        attributes.updateValue(nValue, forKey: key)
        return attributes
    }
    
    /// #  get navigation bar height
    fileprivate var aHeight : CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
        } else {
            return self.bounds.height + 20
        }
    }
    
    
    ///
    /// # set custom background color
    /// - Parameter color: color
    fileprivate func aCustomViewBackgroundColor(_ color : UIColor) -> Void {
        
        if (self.imageView != nil) {
            self.imageView?.removeFromSuperview()
            self.imageView = nil
        }
        self.customView = self.aCreateView(self.customView, width: self.bounds.width, height: self.aHeight)
        self.customView?.backgroundColor = color;
    }
    
    
    ///
    /// # set image view background image
    /// - Parameter image: image
    fileprivate func aImageViewBackgroundImage(_ image : UIImage?) -> Void {
        
        if (self.customView != nil) {
            self.customView?.removeFromSuperview()
            self.customView = nil
        }
        self.imageView = self.aCreateImageView(self.imageView, width: self.bounds.width, height: self.aHeight)
        self.imageView?.image = image;
    }
    
    
    ///
    /// # clane custom view background color
    /// - Parameter isClean: isClean
    fileprivate func aCleanCustomView(_ isClean : Bool) -> Void {
        if (!isClean || self.customView == nil) { return }
        self.setBackgroundImage(nil, for:.default)
        self.customView?.removeFromSuperview()
        self.customView = nil
    }
    
    
    ///
    /// # clane image view background image
    /// - Parameter isClean: isClean
    fileprivate func aCleanImageView(_ isClean : Bool) -> Void {
        if (!isClean || self.imageView == nil) { return }
        self.setBackgroundImage(nil, for:.default)
        self.imageView?.removeFromSuperview()
        self.imageView = nil
    }
    
    
    /// # remove custom view
    
    ///
    /// # clane custom view & image view
    /// - Parameter isClean: isClean
    fileprivate func aClean(_ isClean : Bool) -> Void {
        
        if (!isClean) { return }
        self.setBackgroundImage(nil, for:.default)
        if (self.customView != nil) {
            self.customView?.removeFromSuperview()
            self.customView = nil
        }
        
        if (self.imageView != nil) {
            self.imageView?.removeFromSuperview()
            self.imageView = nil
        }
    }
    
    ///
    /// # set hide bottom line
    /// - Parameter isHidden: isHidden
    fileprivate func aHideBottomLine(_ isHidden : Bool) -> Void {
        if let imageView : UIImageView = aFindLineImageView(view: self) {
            imageView.isHidden = isHidden
        }
    }
}

extension UINavigationBar {
    
    private struct aViewKeys {
        static var aCustomView : UIView?      = nil
        static var aImageView  : UIImageView? = nil
    }
    
    ///
    /// # set find line image view
    /// - Parameter view:
    /// - Returns: view
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
    
    ///
    /// # create custom view
    /// - Parameters:
    ///   - customView: customView
    ///   - width:  width
    ///   - height: height
    /// - Returns: UIView?
    private func aCreateView(_ customView : UIView?, width : CGFloat, height : CGFloat) -> UIView? {
        
        if (customView != nil) { return customView }
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        let view : UIView?             = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view?.isUserInteractionEnabled = false
        view?.autoresizingMask         = .flexibleWidth
        if #available(iOS 11.0, *) {
            self.subviews.first?.insertSubview(view!, at: 0)
        } else {
            self.insertSubview(view!, at: 0)
        }
        return view
    }
    
    ///
    /// # create image view
    /// - Parameters:
    ///   - imageView: imageView
    ///   - width:  width
    ///   - height: height
    /// - Returns: UIImageView?
    private func aCreateImageView(_ imageView : UIImageView?, width : CGFloat, height : CGFloat) -> UIImageView? {
        if (imageView != nil) { return imageView }
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        let view : UIImageView? = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view?.isUserInteractionEnabled = false
        view?.autoresizingMask = .flexibleWidth
        if #available(iOS 11.0, *) {
            self.subviews.first?.insertSubview(view!, at: 0)
        } else {
            self.insertSubview(view!, at: 0)
        }
        return view
    }
    
    private var customView : UIView? {
        
        set {
            objc_setAssociatedObject(self, &aViewKeys.aCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &aViewKeys.aCustomView) as? UIView
        }
    }
    
    
    private var imageView : UIImageView? {
        set {
            objc_setAssociatedObject(self, &aViewKeys.aImageView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &aViewKeys.aImageView) as? UIImageView
        }
    }
    
}


