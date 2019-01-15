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
            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.swp.aBackgroundColor(newValue);
        }

        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationBar.aKeys.kBackgroundColor) as? UIColor, dValue: UIColor.white, block: { (value) -> UIColor in
                return value;
            })
        }
    }
    


}

extension UINavigationBar {
    
    fileprivate struct aKeys {
        static var kCustomView : UIView? = nil;
        static var kBackgroundColor : UIColor = .white
    }
    
    /// #  get navigation bar height
    fileprivate var aHeight : CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
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
    
    ///
    /// # set the navigation bar background color
    /// - Parameter color: color
    fileprivate func aBackgroundColor(_ color : UIColor) -> Void {
        
//        if self.customImageView != nil {
//            self.customImageView?.removeFromSuperview()
//            self.customImageView = nil
//        }
        
        if self.customView == nil {
            self.customView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
            self.customView?.isUserInteractionEnabled = false
            self.customView?.autoresizingMask         = .flexibleWidth
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.subviews.first?.insertSubview(self.customView!, at: 0)
        }
        self.customView?.backgroundColor = color
    }
    
    /// # remove custom view
    fileprivate func aRemove() -> Void {
        self.setBackgroundImage(nil, for:.default)
        self.customView?.removeFromSuperview()
        self.customView = nil
        self.customView = nil
//        self.customImageView?.removeFromSuperview()
    }
    
    private var customView : UIView? {
        set {
            objc_setAssociatedObject(self, &aKeys.kCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &aKeys.kCustomView) as? UIView
        }
    }
    
}
