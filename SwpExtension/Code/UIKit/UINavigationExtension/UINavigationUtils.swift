//
//  UINavigationUtils.swift
//  swp_song
//
//  Created by Dream on 2018/10/18.
//  Copyright © 2018年 swp-song. All rights reserved.
//

struct SwpPOPDatas {
    
    static let popDuration      = 0.13
    static var popDisplayCount  = 0
    static var popProgress:CGFloat {
        let all : CGFloat = CGFloat(60.0 * popDuration)
        let current = min(all, CGFloat(popDisplayCount))
        return current / all
    }
}

struct SwpPuhsDatas {
    static let pushDuration      = 0.13
    static var pushDisplayCount  = 0
    static var pushProgress:CGFloat {
        let all : CGFloat = CGFloat(60.0 * pushDuration)
        let current = min(all, CGFloat(pushDisplayCount))
        return current / all
    }
}

class UINavigationUtils {
    
    
    struct aDefaultsKey {
        // navigation bar
        static var kBarBackgroundColor      : UIColor   = UIColor.white
        static var kBarBackgroundImage      : UIImage   = UIImage()
        static var kBarTintColor            : UIColor   = UIColor.white
        static var kIsHideBarShadowImage    : Bool      = false
        static var kBarTitleFont            : UIFont    = UIFont.systemFont(ofSize: 18)
        static var kBarTitleColor           : UIColor   = UIColor.black
        static var kIsHideBarBottomLine     : Bool      = false
        static var kBarBackgroundAlpha      : CGFloat   = 1
        static var kItemsAlpha              : CGFloat   = 1
        static var kBarTranslationY         : CGFloat   = 0
        static var kBarHeight               : CGFloat   = 44
        static var kIsPush                  : Bool      = false
        static var kStatusBarStyle          : UIStatusBarStyle = .default
    }
    

    
    private static let onceToken = UUID().uuidString
    
    static func Swizzle(_ aClass : AnyClass, hasPrefix : String,  selectors : [Selector]) -> Void {
        DispatchQueue.once(token: onceToken) {
            for selector in selectors {
                let swizzledString = (hasPrefix + selector.description).replacingOccurrences(of: "__", with: "_")
                guard
                    let originalMethod = class_getInstanceMethod(aClass, selector),
                    let swizzledMethod = class_getInstanceMethod(aClass, Selector(swizzledString))
                    else { return }
                
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }
    
    ///
    /// # calculation color percent
    /// - Parameters:
    ///   - fColor: fColor
    ///   - tColor: tColor
    ///   - percent: percent
    /// - Returns: UIColor
    static  func calculationColorPercent(_ fColor : UIColor, tColor : UIColor, percent : CGFloat) -> UIColor {
        
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
    static func calculationAlphaPercent(fAlpha: CGFloat, tAlpha: CGFloat, percent: CGFloat) -> CGFloat {
        return fAlpha + (tAlpha - fAlpha) * percent
    }
    
//    static func updateNavigationBar(_ navigation : UINavigationController, _ from : UIViewController?, to : UIViewController?, progress : CGFloat) -> Void {
//
//        let fromBarColor    = from?.swp.barBackgroundColor ?? UIColor.white
//        let toBarColor      = to?.swp.barBackgroundColor   ?? UIColor.white
//        let newBarColor     = calculationColorPercent(fromBarColor, tColor: toBarColor, percent: progress)
//        navigation.swp.barBackgroundColor = newBarColor
//
//        // change navBarTintColor
//        let fromTintColor   = from?.swp.barTintColor    ?? UIColor.white
//        let toTintColor     = to?.swp.barTintColor      ?? UIColor.white
//        let newTintColor    = calculationColorPercent(fromTintColor, tColor: toTintColor, percent: progress)
//        navigation.swp.barBackgroundColor = newBarColor
//
//        let fromBackgroundAlpha = from?.swp.barBackgroundAlpha ?? 0
//        let toBackgroundAlpha   = to?.swp.barBackgroundAlpha ?? 0
//        let newBackgroundAlpha  = calculationAlphaPercent(fAlpha: fromBackgroundAlpha, tAlpha: toBackgroundAlpha, percent: progress)
//        navigation.swp.barBackgroundAlpha = newBackgroundAlpha
//    }
    

}





extension DispatchQueue  {
    
    private static var onceTracker = [String]()
    
    static func once(token: String, block:(() -> Void)?) {
        
        //  保证被 objc_sync_enter 和 objc_sync_exit 包裹的代码可以有序同步地执行
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if onceTracker.contains(token) { return }
        onceTracker.append(token)
        block?()
    }
}

protocol SwpSwizzleProtocol  {
    static func swp_swizzle() -> Void
    static func swp_swizzle_s() -> Void
}

extension SwpSwizzleProtocol {
    static func swp_swizzle() -> Void { }
    static func swp_swizzle_s() -> Void { }
}

class SwpSwizzleClass {
    fileprivate static func swpSwizzleFunction() -> Void {
//        UINavigationController.swp_swizzle_s()
    }
}

extension UIApplication {
    
    private static let runOnce : Void = {
        SwpSwizzleClass.swpSwizzleFunction()
    }()
    
//    open override var next: UIResponder? {
//        UIApplication.runOnce
//        return super.next
//    }
}
