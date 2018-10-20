//
//  UINavigationController+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

//extension SwpExtensionClass where BaseClass : UINavigationController {
//    
//    /// # set navigation bar background color
//    public var barBackgroundColor : UIColor {
//        
//        set {
//            self.swp.navigationBar.swp.backgroundColor = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.backgroundColor
//        }
//    }
//    
//    /// # set navigation bar background image
//    public var barBackgroundImage : UIImage? {
//        set {
//            self.swp.navigationBar.swp.backgroundImage = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.backgroundImage
//        }
//    }
//    
//    /// # set navigation bar tint color
//    public var barTintColor : UIColor {
//        set {
//            self.swp.navigationBar.tintColor = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.tintColor
//        }
//        
//    }
//    
//    /// # set navigation bar hide shadowImage
//    public var isHideBarShadowImage : Bool {
//        set {
//            self.swp.navigationBar.swp.isHideShadowImage = newValue
//        }
//        
//        get {
//            
//            return self.swp.navigationBar.swp.isHideShadowImage
//        }
//    }
//    
//    /// # set the navigation bar title font
//    public var barTitleFont : UIFont {
//        set {
//            self.swp.navigationBar.swp.titleFont = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.titleFont
//        }
//    }
//    
//    /// # set the navigation bar title color
//    public var barTitleColor : UIColor {
//        set {
//            self.swp.navigationBar.swp.titleColor = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.titleColor
//        }
//    }
//    
//    /// # hide the navigation bar bottom line
//    public var isHideBarBottomLine : Bool {
//        set {
//            self.swp.navigationBar.swp.isHideBottomLine = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.isHideBottomLine
//        }
//    }
//    
//    /// # set navigation bar alpha
//    public var barBackgroundAlpha : CGFloat {
//        set {
//            self.swp.navigationBar.swp.alpha = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.alpha
//        }
//    }
//    
//    /// # set navigation bar items alpha
//    public var barItemsAlpha : CGFloat {
//        set {
//            self.swp.navigationBar.swp.itemsAlpha = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.itemsAlpha
//        }
//    }
//    
//    /// # set translationY
//    public var barTranslationY : CGFloat  {
//        set {
//            self.swp.navigationBar.swp.translationY = newValue
//        }
//        
//        get {
//            return self.swp.navigationBar.swp.translationY
//        }
//    }
//    
//    /// # get navigation bar height
//    public var barHeight : CGFloat {
//        return self.swp.navigationBar.swp.height
//    }
//    
//}
//
//extension SwpExtensionClass where BaseClass : UINavigationController {
//    
//    ///
//    /// # set the navigation bar background color
//    /// - Parameter color: color
//    /// - Returns: BaseClass
//    @discardableResult public func barBackgroundColor(_ color : UIColor) -> BaseClass {
//        self.barBackgroundColor = color
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title font
//    /// - Parameter font: font
//    /// - Returns: BaseClass
//    @discardableResult public func barTitleFont(_ font : UIFont) -> BaseClass {
//        self.barTitleFont = font
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title color
//    /// - Parameter color: color
//    /// - Returns: BaseClass
//    @discardableResult public func barTitleColor(_ color : UIColor) -> BaseClass {
//        self.barTitleColor = color
//        return self.swp
//    }
//    
//    ///
//    /// # hide the navigation bar bottom line
//    /// - Parameter isHide: isHide
//    /// - Returns: BaseClass
//    @discardableResult public func isHideBottomLine(_ isHide : Bool) -> BaseClass {
//        self.isHideBarBottomLine = isHide
//        return self.swp
//    }
//    
//    ///
//    /// # set navigation bar alpha
//    /// - Parameter alpha:
//    /// - Returns:
//    @discardableResult public func barBackgroundAlpha(_ alpha : CGFloat) -> BaseClass {
//        self.barBackgroundAlpha = alpha
//        return self.swp
//    }
//    
//    ///
//    /// # set navigation bar items alpha
//    /// - Parameters:
//    ///   - alpha:  alpha
//    ///   - isHide: isHide
//    /// - Returns: BaseClass
//    @discardableResult public func barItemsAlpha(_ alpha : CGFloat, isHide : Bool) -> BaseClass {
//        self.swp.navigationBar.swp.itemsAlpha(alpha, isHide: isHide)
//        return self.swp
//    }
//    
//    ///
//    /// # set the navigation bar title style
//    /// - Parameters:
//    ///   - color:  color
//    ///   - font:   font
//    /// - Returns: BaseClass
//    @discardableResult public func barTitleStyle(_ color : UIColor, font : UIFont) -> BaseClass {
//        self.swp.navigationBar.swp.titleStyle(color, font: font)
//        return self.swp
//    }
//    
//    ///
//    /// # remove custom view
//    /// - Returns: BaseClass
//    @discardableResult public func barRemove() -> BaseClass {
//        self.swp.navigationBar.swp.remove()
//        return self.swp
//    }
//    
//}
//
//
//
//
//extension UINavigationController : SwpSwizzleProtocol {
//    
//    static func swp_swizzle_s() -> Void {
//        
//        guard self == UINavigationController.self else { return }
//        
//        let selectors = [ NSSelectorFromString("_updateInteractiveTransition:"), #selector(popToViewController), #selector(popToRootViewController), #selector(pushViewController) ]
//        
//        UINavigationUtils.Swizzle(self, hasPrefix: "swp_", selectors: selectors)
//    }
//    
//    @objc private func swp_updateInteractiveTransition(_ percentComplete: CGFloat) {
//        
//        guard
//            let topViewController = topViewController,
//            let transitionCoordinator = topViewController.transitionCoordinator
//            else {
//                swp_updateInteractiveTransition(percentComplete)
//                return
//        }
//        
//        let fromViewController  = transitionCoordinator.viewController(forKey: .from)
//        let toViewController    = transitionCoordinator.viewController(forKey: .to)
//    
//        UINavigationUtils.updateNavigationBar(self, fromViewController, to: toViewController, progress: percentComplete);
//        
//        self.swp_updateInteractiveTransition(percentComplete)
//    }
//    
//    @objc private func swp_popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
//    
////        return self.swp_popToViewController(viewController, animated: animated)
//        
//        var displayLink : CADisplayLink? = CADisplayLink(target: self, selector: #selector(popNeedDisplay1))
//        displayLink?.add(to: RunLoop.main, forMode: .common)
//        CATransaction.setCompletionBlock {
//            displayLink?.invalidate()
//            displayLink = nil
//            SwpPOPDatas.popDisplayCount = 0
//        }
//        
//        CATransaction.setAnimationDuration(SwpPOPDatas.popDuration)
//        CATransaction.begin()
//        let controller = swp_popToRootViewControllerAnimated(animated)
//        CATransaction.commit()
//        return controller
//    }
//    
//    @objc private func swp_popToRootViewControllerAnimated(_ animated: Bool) -> [UIViewController]? {
//        print(#function)
//        
//        var displayLink : CADisplayLink? = CADisplayLink(target: self, selector: #selector(popNeedDisplay1))
//        displayLink?.add(to: RunLoop.main, forMode: .common)
//        CATransaction.setCompletionBlock {
//            displayLink?.invalidate()
//            displayLink = nil
//            SwpPOPDatas.popDisplayCount = 0
//        }
//        
//        CATransaction.setAnimationDuration(SwpPOPDatas.popDuration)
//        CATransaction.begin()
//        let controller = swp_popToRootViewControllerAnimated(animated)
//        CATransaction.commit()
//        return controller
//    }
//    
//    @objc private func popNeedDisplay1() -> Void {
//        guard
//            let topViewController = topViewController,
//            let coordinator = topViewController.transitionCoordinator
//            else { return }
//        
//        SwpPOPDatas.popDisplayCount += 1
//        let popProgress = SwpPOPDatas.popProgress
//        // print("第\(popProperties.displayCount)次pop的进度：\(popProgress)")
//        let fromViewController = coordinator.viewController(forKey: .from)
//        let toViewController = coordinator.viewController(forKey: .to)
////        updateNavigationBar(fromVC: fromVC, toVC: toVC, progress: popProgress)
//        UINavigationUtils.updateNavigationBar(self, fromViewController, to: toViewController, progress: popProgress)
//    }
//    
//    
//    @objc private func swp_pushViewController(_ viewController: UIViewController, animated: Bool) -> Void {
//        
//        var displayLink:CADisplayLink? = CADisplayLink(target: self, selector: #selector(pushNeedDisplay1))
//        displayLink?.add(to: RunLoop.main, forMode: .common)
//        CATransaction.setCompletionBlock {
//            displayLink?.invalidate()
//            displayLink = nil
//            SwpPuhsDatas.pushDisplayCount = 0
////            viewController.pushToCurrentVCFinished = true
//        };
//        CATransaction.setAnimationDuration(SwpPuhsDatas.pushDuration)
//        CATransaction.begin()
//        swp_pushViewController(viewController, animated: animated)
//        CATransaction.commit()
//        
//    }
//    
//    @objc private func pushNeedDisplay1() {
//        guard
//            let topViewController = topViewController,
//            let coordinator = topViewController.transitionCoordinator
//            else { return }
//        
//        SwpPuhsDatas.pushDisplayCount += 1
//        let pushProgress = SwpPuhsDatas.pushProgress
//        print("第\(SwpPuhsDatas.pushDisplayCount)次push的进度：\(pushProgress)")
//        let fromViewController  = coordinator.viewController(forKey: .from)
//        let toViewController     = coordinator.viewController(forKey: .to)
//        UINavigationUtils.updateNavigationBar(self, fromViewController, to: toViewController, progress: pushProgress)
//    }
//}

//extension UINavigationController : UINavigationBarDelegate {

//    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
//        if let topVC = topViewController, let coor = topVC.transitionCoordinator, coor.initiallyInteractive {
//            if #available(iOS 10.0, *) {
//                coor.notifyWhenInteractionChanges({ (context) in
//                    self.dealInteractionChanges(context)
//                })
//            } else {
//                coor.notifyWhenInteractionEnds({ (context) in
//                    self.dealInteractionChanges(context)
//                })
//            }
//            return true
//        }
//
//        let itemCount = navigationBar.items?.count ?? 0
//        let n = viewControllers.count >= itemCount ? 2 : 1
//        let popToVC = viewControllers[viewControllers.count - n]
//
//        popToViewController(popToVC, animated: true)
//        return true
//    }
//
//    // deal the gesture of return break off
//    private func dealInteractionChanges(_ context: UIViewControllerTransitionCoordinatorContext) {
//        let animations: (UITransitionContextViewControllerKey) -> () = {
//            let curColor = context.viewController(forKey: $0)?.swp.barBackgroundColor ?? UIColor.white
//            let curAlpha = context.viewController(forKey: $0)?.swp.barBackgroundAlpha ?? 1
//            self.swp.barBackgroundColor = curColor
//            self.swp.barBackgroundAlpha = curAlpha
//            print("curColor = \(curColor), curAlpha = \(curAlpha)")
//
//        }
//
//        // after that, cancel the gesture of return
//        if context.isCancelled {
//            let cancelDuration: TimeInterval = context.transitionDuration * Double(context.percentComplete)
//            UIView.animate(withDuration: cancelDuration) {
//                animations(.from)
//            }
//        }  else {
//            // after that, finish the gesture of return
//            let finishDuration: TimeInterval = context.transitionDuration * Double(1 - context.percentComplete)
//            UIView.animate(withDuration: finishDuration) {
//                animations(.to)
//            }
//        }
//    }
    
//    open override var preferredStatusBarStyle: UIStatusBarStyle {
//        return self.topViewController?.swp.statusBarStyle ?? .default
//    }
//}



