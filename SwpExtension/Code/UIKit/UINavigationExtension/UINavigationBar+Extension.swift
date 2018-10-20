//
//  UINavigationBar+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension SwpExtensionClass where BaseClass : UINavigationBar {
    
    
    public var backgroundColor : UIColor {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationUtils.aDefaultsKey.kBarBackgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.swp.aBackgroundColor(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationUtils.aDefaultsKey.kBarBackgroundColor)
                as? UIColor, dValue: UINavigationUtils.aDefaultsKey.kBarBackgroundColor, block: { (value) -> UIColor in
                    return value
            })
        }
    }
    
    
    public var backgroundImage : UIImage {
        set {
            objc_setAssociatedObject(self.swp, &UINavigationUtils.aDefaultsKey.kBarBackgroundImage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.swp.aBackgroundImage(newValue)
        }
        
        get {
            return self.swp.aCheckValue(objc_getAssociatedObject(self, &UINavigationUtils.aDefaultsKey.kBarBackgroundImage)
                as? UIImage, dValue: UINavigationUtils.aDefaultsKey.kBarBackgroundImage, block: { (value) -> UIImage in
                    return value
            })
        }
    }
    
    
}

extension UINavigationBar {
    
    private struct aKeys {
        static var kCustomView          : UIView?       = nil
        static var kCustomImageView     : UIImageView   = UIImageView()
//        static var kBackgroundColor     : UIColor       = UIColor.black
//        static var kBackgroundImage     : UIImage?      = nil
//        static var kIsHideBottomLine    : Bool          = false
//        static var kTitleFont           : UIFont        = UIFont.systemFont(ofSize: 15)
//        static var kTitleColor          : UIColor       = UIColor.black
//        static var kAlpha               : CGFloat       = 1
//        static var kItemsAlpha          : CGFloat       = 1
//        static var kIsHideShadowImage   : Bool          = false
    }
    
    
    fileprivate func aCheckValue<T>(_ value : T?, dValue : T, block:( ( _ value : T ) -> T)? ) -> T {
        guard let value = value else { return dValue }
        return block?(value) ?? dValue
    }
    
    fileprivate var aHeight : CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
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
                objc_setAssociatedObject(self, &aKeys.kCustomImageView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    
        get {
                return objc_getAssociatedObject(self, &aKeys.kCustomImageView) as? UIImageView
        }
    }
    
}



//extension SwpExtensionClass where BaseClass : UINavigationBar {
//    
//    /// # set the navigation bar background color
//    public var backgroundColor : UIColor {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//            self.swp.aBackgroundColor(newValue)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundColor) as? UIColor, dValue: UINavigationBar.aKeys.kBackgroundColor, block: { (value) -> UIColor in
//                return value
//            })
//        }
//    }
//    
//    /// # set the navigation bar background image
//    public var backgroundImage : UIImage? {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundImage, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//            self.swp.aBackgroundImage(newValue)
//        }
//        
//        get {
//            return objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kBackgroundImage) as? UIImage
//        }
//    }
//    
//    /// # set the navigation bar title font
//    public var titleFont : UIFont {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleFont, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//            self.swp.titleTextAttributes = self.swp.aTitleStyle(newValue, key: .font)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleFont) as? UIFont, dValue: UINavigationBar.aKeys.kTitleFont, block: { (value) -> UIFont in
//                return value
//            })
//        }
//    }
//    
//    /// # set the navigation bar title color
//    public var titleColor : UIColor {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleColor, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//            self.swp.titleTextAttributes = self.swp.aTitleStyle(newValue, key: .foregroundColor)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kTitleColor) as? UIColor, dValue: UINavigationBar.aKeys.kTitleColor, block: { (value) -> UIColor in
//                return value
//            })
//        }
//    }
//    
//    /// # hide the navigation bar bottom line
//    public var isHideBottomLine : Bool {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideBottomLine, newValue, .OBJC_ASSOCIATION_ASSIGN)
//            self.swp.aHideBottomLine(newValue)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideBottomLine) as? Bool, dValue: UINavigationBar.aKeys.kIsHideBottomLine, block: { (value) -> Bool in
//                return value
//            })
//        }
//    }
//    
//    
//    /// # set background alpha
//    public var alpha : CGFloat {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kAlpha, newValue, .OBJC_ASSOCIATION_ASSIGN)
//            self.swp.aAlpha(newValue)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kAlpha) as? CGFloat, dValue: UINavigationBar.aKeys.kAlpha, block: { (value) -> CGFloat in
//                return value
//            })
//        }
//    }
//    
//    
//    /// # set background items alpha
//    public var itemsAlpha : CGFloat {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kItemsAlpha, newValue, .OBJC_ASSOCIATION_ASSIGN)
//            self.swp.aItemsAlpha(newValue, isHide: true)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kItemsAlpha) as? CGFloat, dValue: UINavigationBar.aKeys.kItemsAlpha, block: { (value) -> CGFloat in
//                return value
//            })
//        }
//    }
//    
//    /// set hide shadowImage
//    public var isHideShadowImage : Bool {
//        set {
//            objc_setAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideShadowImage, newValue, .OBJC_ASSOCIATION_ASSIGN)
//            self.isHideShadowImage(newValue)
//        }
//        
//        get {
//            return self.swp.aCheckValue(objc_getAssociatedObject(self.swp, &UINavigationBar.aKeys.kIsHideShadowImage) as? Bool, dValue: UINavigationBar.aKeys.kIsHideShadowImage, block: { (value) -> Bool in
//                return value
//            })
//        }
//    }
//    
//    /// # set translationY
//    public var translationY : CGFloat  {
//        set {
//            self.swp.transform = CGAffineTransform(translationX: 0, y: newValue)
//        }
//        
//        get {
//            return self.swp.transform.ty
//        }
//    }
//    
//    /// # get navigation bar height
//    public var height : CGFloat {
//        return self.swp.aHeight
//    }
//    
//}
//
//// MARK: - Function
//extension SwpExtensionClass where BaseClass : UINavigationBar {
//    
//    ///
//    /// # set the navigation bar background color
//    /// - Parameter color: color
//    /// - Returns: BaseClass
//    @discardableResult public func backgroundColor(_ color : UIColor) -> BaseClass {
//        self.backgroundColor = color
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title font
//    /// - Parameter font: font
//    /// - Returns: BaseClass
//    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
//        self.titleFont = font
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title color
//    /// - Parameter color: color
//    /// - Returns: BaseClass
//    @discardableResult public func titleColor(_ color : UIColor) -> BaseClass {
//        self.titleColor = color
//        return self.swp
//    }
//    
//    ///
//    /// # hide the navigation bar bottom line
//    /// - Parameter isHide: isHide
//    /// - Returns: BaseClass
//    @discardableResult public func isHideBottomLine(_ isHide : Bool) -> BaseClass {
//        self.isHideBottomLine = isHide
//        return self.swp
//    }
//    
//    ///
//    /// # set items alpha
//    /// - Parameters:
//    ///   - alpha: alpha
//    ///   - isHide: isHide
//    /// - Returns: BaseClass
//    @discardableResult public func itemsAlpha(_ alpha : CGFloat, isHide : Bool) -> BaseClass {
//        self.swp.aItemsAlpha(alpha, isHide: isHide)
//        return self.swp
//    }
//    
//    ///
//    /// # set hide shadowImage
//    /// - Returns: BaseClass
//    @discardableResult public func isHideShadowImage(_ isHideShadowImage : Bool) -> BaseClass {
//        self.swp.shadowImage = isHideShadowImage ? UIImage() : nil
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title style
//    /// - Parameters:
//    ///   - color:  color
//    ///   - font:   font
//    /// - Returns: BaseClass
//    @discardableResult public func titleStyle(_ color : UIColor, font : UIFont) -> BaseClass {
//        guard var attributes = self.swp.titleTextAttributes else {
//            self.swp.titleTextAttributes = [.foregroundColor : color, .font : font]
//            return self.swp
//        }
//        attributes.updateValue(font, forKey: .font)
//        attributes.updateValue(color, forKey: .foregroundColor)
//        self.swp.titleTextAttributes = attributes
//        return self.swp
//    }
//    
//    ///
//    /// # remove custom view
//    /// - Returns: BaseClass
//    @discardableResult public func remove() -> BaseClass {
//        self.swp.aRemove()
//        return self.swp
//    }
//    
//}
//
//// MARK: - private
//extension UINavigationBar {
//    
//    fileprivate struct aKeys {
//        static var kCustomView          : UIView?       = UIView()
//        static var kCustomImageView     : UIImageView   = UIImageView()
//        static var kBackgroundColor     : UIColor       = UIColor.black
//        static var kBackgroundImage     : UIImage?      = nil
//        static var kIsHideBottomLine    : Bool          = false
//        static var kTitleFont           : UIFont        = UIFont.systemFont(ofSize: 15)
//        static var kTitleColor          : UIColor       = UIColor.black
//        static var kAlpha               : CGFloat       = 1
//        static var kItemsAlpha          : CGFloat       = 1
//        static var kIsHideShadowImage   : Bool          = false
//    }
//    
//    fileprivate func aHideBottomLine(_ isHidden : Bool) -> Void {
//        if let imageView : UIImageView = aFindLineImageView(view: self) {
//            imageView.isHidden = isHidden
//        }
//    }
//    
//    ///
//    /// # set the navigation bar background color
//    /// - Parameter color: color
//    fileprivate func aBackgroundColor(_ color : UIColor) -> Void {
//        
//        if self.customImageView != nil {
//            self.customImageView?.removeFromSuperview()
//            self.customImageView = nil
//        }
//        
//        if self.customView == nil {
//            self.customView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
//            self.customView?.isUserInteractionEnabled = false
//            self.customView?.autoresizingMask         = .flexibleWidth
////            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//            self.subviews.first?.insertSubview(self.customView!, at: 0)
//        }
//        self.customView?.backgroundColor = color
//    }
//    
//    ///
//    /// # set the navigation bar background image
//    /// - Parameter image: image
//    fileprivate func aBackgroundImage(_ image : UIImage?) -> Void {
//        
//        if self.customView != nil {
//            self.customView?.removeFromSuperview()
//            self.customView = nil
//        }
//        
//        if self.customImageView == nil {
//            self.customImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.aHeight))
//            self.customImageView?.isUserInteractionEnabled = false
//            self.customImageView?.autoresizingMask          = .flexibleWidth
//            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//            self.subviews.first?.insertSubview(self.customImageView!, at: 0)
//        }
//        self.customImageView?.image = image
//    }
//    
//    ///
//    /// # set title style
//    /// - Parameters:
//    ///   - value: value
//    ///   - key:   key
//    /// - Returns: Array
//    fileprivate func aTitleStyle(_ value : Any?, key : NSAttributedString.Key) -> [NSAttributedString.Key : Any]? {
//        guard let nValue     = value else { return self.titleTextAttributes }
//        guard var attributes = self.titleTextAttributes else { return [key : nValue] }
//        attributes.updateValue(nValue, forKey: key)
//        return attributes
//    }
//    
//    /// #  get navigation bar height
//    fileprivate var aHeight : CGFloat {
//        return UIApplication.shared.statusBarFrame.size.height + self.bounds.size.height
//    }
//    
//    
//    /// # remove custom view
//    fileprivate func aRemove() -> Void {
//        self.setBackgroundImage(nil, for:.default)
//        self.customView?.removeFromSuperview()
//        self.customImageView?.removeFromSuperview()
//        self.customView = nil
//    }
//    
//    ///
//    /// # set items alpha
//    /// # set background alpha
//    /// - Parameter alpha: alpha
//    fileprivate func aAlpha(_ alpha : CGFloat) -> Void {
//        
//        guard let backgroundView = self.subviews.first else { return }
//        
//        if #available(iOS 11.0, *) {
//            
//            backgroundView.subviews.forEach { (view) in
//                view.alpha = alpha
//            }
//        } else {
//            backgroundView.alpha = alpha
//        }
//    }
//    
//    ///
//    /// # set items alpha
//    /// - Parameters:
//    ///   - alpha: alpha
//    ///   - isAlphaItems: isAlphaItems
//    fileprivate func aItemsAlpha(_ alpha : CGFloat, isHide : Bool) -> Void {
//        
//        for view in self.subviews {
//            if isHide {
//                if let _UIBarBackgroundClass = NSClassFromString("_UIBarBackground") {
//                    if !view.isKind(of: _UIBarBackgroundClass) {
//                        view.alpha = alpha
//                    }
//                }
//                
//                if let _UINavigationBarBackground = NSClassFromString("_UINavigationBarBackground") {
//                    if !view.isKind(of: _UINavigationBarBackground) {
//                        view.alpha = alpha
//                    }
//                }
//                
//            } else {
//                guard let _UINavigationBarBackIndicatorViewClass = NSClassFromString("_UINavigationBarBackIndicatorView") else { return }
//                if !view.isKind(of: _UINavigationBarBackIndicatorViewClass) { return }
//                if let _UIBarBackgroundClass = NSClassFromString("_UIBarBackground"), !view.isKind(of: _UIBarBackgroundClass) {
//                    view.alpha = alpha
//                }
//                
//                if let _UINavigationBarBackground = NSClassFromString("_UINavigationBarBackground"), !view.isKind(of: _UINavigationBarBackground) {
//                    view.alpha = alpha
//                }
//            }
//        }
//    }
//    
//    ///
//    /// # check vlaue is empty
//    /// - Parameters:
//    ///   - value: value
//    ///   - defaultValue: defaultValue
//    ///   - block: block
//    /// - Returns: T
//    fileprivate func aCheckValue<T>(_ value : T?, dValue : T, block:( ( _ value : T ) -> T)? ) -> T {
//        guard let value = value else { return dValue }
//        return block?(value) ?? dValue
//    }
//    
//    ///
//    /// # find the bottom line
//    /// - Parameter view: view
//    /// - Returns: UIImageView?
//    private func aFindLineImageView(view : UIView) -> UIImageView?  {
//        if view is UIImageView && view.bounds.size.height <= 1.0 {
////        if view.isKind(of: UIImageView.self) && view.bounds.size.height <= 1.0 {
//            return view as? UIImageView
//        }
//        
//        for subview in view.subviews {
//            if let imageView : UIImageView = self.aFindLineImageView(view: subview) {
//                return imageView
//            }
//        }
//        return nil
//    }
//    
//    // MARK: - Private Property
//    
//    /// customView
//    private var customView : UIView? {
//        set {
//            objc_setAssociatedObject(self, &aKeys.kCustomView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        
//        get {
//            return objc_getAssociatedObject(self, &aKeys.kCustomView) as? UIView
//        }
//    }
//    
//    /// customImageView
//    private var customImageView : UIImageView? {
//        set {
//            objc_setAssociatedObject(self, &UINavigationBar.aKeys.kCustomImageView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        
//        get {
//            return objc_getAssociatedObject(self, &UINavigationBar.aKeys.kCustomImageView) as? UIImageView
//        }
//    }
//    
//}
//
