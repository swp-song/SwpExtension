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
            self.swp.aImageViewBackgroundColor(newValue)
        }
        
        get {
            return objc_getAssociatedObject(self, &UINavigationBar.aKeys.aBackgroundImage) as? UIImage
        }
        
    }
    
}

extension UINavigationBar {
    
    fileprivate struct aKeys {
        static var aBackgroundColor : UIColor  = .white
        static var aBackgroundImage : UIImage? = nil
    }
    
    ///
    /// # check vlaue is empty
    /// - Parameters:
    ///   - value: value
    ///   - defaultValue: defaultValue
    ///   - block: block
    /// - Returns: T
    fileprivate func aCheckValue<T>(_ value : T?, dValue : T, block:( ( _ value : T ) -> T)? ) -> T {
        guard let value = value else { return dValue }
        return block?(value) ?? dValue
    }
    
    /// #  get navigation bar height
    fileprivate var aHeight : CGFloat {
        
        if #available(iOS 11.0, *) {
            return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
        } else {
            return self.bounds.height + 20
        }
    }
    
    
    fileprivate func aCustomViewBackgroundColor(_ color : UIColor) -> Void {
        
        if (self.imageView != nil) {
            self.imageView?.removeFromSuperview()
            self.imageView = nil
        }
        self.customView = self.aCreateView(self.customView, width: self.bounds.width, height: self.aHeight)
        self.customView?.backgroundColor = color;
    }
    
    fileprivate func aImageViewBackgroundColor(_ image : UIImage?) -> Void {
        
        if (self.customView != nil) {
            self.customView?.removeFromSuperview()
            self.customView = nil
        }
        self.imageView = self.aCreateImageView(self.imageView, width: self.bounds.width, height: self.aHeight)
        self.imageView?.image = image;
    }
    
    
    
    /// # remove custom view
    fileprivate func aRemove() -> Void {
        self.setBackgroundImage(nil, for:.default)
        self.customView?.removeFromSuperview()
//        self.customImageView?.removeFromSuperview()
        self.customView = nil
    }
}

extension UINavigationBar {
    
    private struct aViewKeys {
        static var aCustomView : UIView?      = nil
        static var aImageView  : UIImageView? = nil
    }
    
    private func aCreateView(_ customView : UIView?, width : CGFloat, height : CGFloat) -> UIView? {
        
        if (customView != nil) { return customView }
        
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        let view : UIView? = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view?.isUserInteractionEnabled = false
        view?.autoresizingMask = .flexibleWidth
        
        if #available(iOS 11.0, *) {
            self.subviews.first?.insertSubview(view!, at: 0)
        } else {
            self.insertSubview(view!, at: 0)
        }
        
        return view
    }
    
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


