//
//  UIButton+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

// MARK: - BaseClass Convenience Function
extension SwpExtensionClass where BaseClass : UIButton {
    
    ///
    /// # convenience init style function
    /// - Parameters:
    ///   - bgColor:    bgColor
    ///   - title:      title
    ///   - target:     target
    ///   - action:     action
    ///   - titleColor: titleColor
    ///   - titleFont:  titleFont
    ///   - radius:     radius
    ///   - tag:        tag
    ///   - events:     events
    @discardableResult public func style(_ bgColor : UIColor?, title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15), radius : CGFloat = 0, tag : Int = 0, events : UIControl.Event = .touchUpInside) -> BaseClass {
        return self.aStyle(bgColor, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont, radius: radius, tag: tag, events: events)
    }
    
    ///
    /// # convenience init check box style function
    /// - Parameters:
    ///   - normalImage:    normalImage
    ///   - selectedImage:  selectedImage
    ///   - title:          title
    ///   - target:         target
    ///   - action:         action
    ///   - titleColor:     titleColor
    ///   - titleFont:      titleFont
    @discardableResult public func checkBoxStyle(_ normalImage : UIImage?, selectedImage : UIImage?,  title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15)) -> BaseClass {
        return self.aCheckBoxStyle(normalImage, selectedImage: selectedImage, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont)
    }
    
}

// MARK: - Property Function
extension SwpExtensionClass where BaseClass : UIButton {
    
    ///
    /// # set title font
    /// - Parameter font: font
    /// - Returns: BaseClass
    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
        self.swp.titleLabel?.font = font
        return self.swp
    }
    
    ///
    /// # set title
    /// - Parameters:
    ///   - title:  title
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func title(_ title : String?, for state : UIControl.State) -> BaseClass {
        self.swp.setTitle(title, for: state)
        return self.swp
    }
    
    ///
    /// # set title color
    /// - Parameters:
    ///   - color:  color
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func titleColor(_ color : UIColor?, for state : UIControl.State) -> BaseClass {
        self.swp.setTitleColor(color, for: state)
        return self.swp
    }
    
    ///
    /// # set image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func image(_ image : UIImage?, for state : UIControl.State) -> BaseClass {
        self.swp.setImage(image, for: state)
        return self.swp
    }
    
    ///
    /// # set background image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func backgroundImage(_ image : UIImage?, for state : UIControl.State) -> BaseClass {
        self.swp.setBackgroundImage(image, for: state)
        return self.swp
    }
    
    ///
    /// # set events
    /// - Parameters:
    ///   - target: target
    ///   - action: action
    ///   - events: events
    /// - Returns: BaseClass
    @discardableResult public func targetEvent(_ target: Any?, action : Selector,  for events : UIControl.Event) -> BaseClass {
        self.swp.addTarget(target, action: action, for: events)
        return self.swp
    }
    
    ///
    /// # set tag
    /// - Parameter tag: tag
    /// - Returns: BaseClass
    @discardableResult public func tag(_ tag : Int) -> BaseClass {
        self.swp.tag = tag
        return self.swp
    }
    
    ///
    /// # set title edgeInsets
    /// - Parameter titleEdgeInsets: titleEdgeInsets
    /// - Returns: BaseClass
    @discardableResult public func titleEdgeInsets(titleEdgeInsets : UIEdgeInsets) -> BaseClass {
        self.swp.titleEdgeInsets = titleEdgeInsets
        return self.swp
    }
    
    ///
    /// # set image edgeInsets
    /// - Parameter imageEdgeInsets:
    /// - Returns: BaseClass
    @discardableResult public func imageEdgeInsets(imageEdgeInsets : UIEdgeInsets) -> BaseClass {
        self.swp.imageEdgeInsets = imageEdgeInsets
        return self.swp
    }
    
    ///
    /// # size to fit
    /// - Returns: BaseClass
    @discardableResult public func sizeToFit() -> BaseClass {
        self.swp.sizeToFit()
        return self.swp
    }
    
}

// MARK: - Custom Function
extension SwpExtensionClass where BaseClass : UIButton {
    
    ///
    /// # ImageEdge
    /// - top:      top
    /// - left:     left
    /// - bottom:   bottom
    /// - right:    right
    public enum ImageEdge : Int {
        case top
        case left
        case bottom
        case right
    }
    
    // MARK: - Custom
    ///
    /// # set image location
    /// - Parameters:
    ///   - imageEdge:  imageEdge
    ///   - offset:     offset
    /// - Returns: BaseClass
    @discardableResult public func imageEdge(_ edge : ImageEdge,  offset : CGFloat = 0) -> BaseClass {
        return buttonImageEdge(edge: edge, offset: offset)
    }
    
}

// MARK: - timing button
extension SwpExtensionClass where BaseClass : UIButton {
    
    ///
    /// # set timing button
    /// - Parameters:
    ///   - time:       time
    ///   - appTitle    appTitle
    ///   - results:    results
    /// - Returns: BaseClass
    @discardableResult public func timingButton(_ time : Int, appTitle : String = "", results:(( (timer : DispatchSourceTimer?, time : Int, isRun : Bool) ) -> Void)? = nil) -> BaseClass {
        
        var timeOut = time
        let title   = self.swp.titleLabel?.text
        let aTimer  = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        
        aTimer.schedule(wallDeadline: .now(), repeating: .seconds(1))
        
        aTimer.setEventHandler {
            
            guard timeOut <= 0 else  {
                DispatchQueue.main.async {
                    let seconds = timeOut % 60
                    self.swp.setTitle(String(format: "%.2d", seconds), for: .normal)
                    self.swp.isEnabled = false
                }
                timeOut -= 1
                results?((timer: aTimer, time : timeOut, isRun : true))
                return
            }
            aTimer.cancel()
            DispatchQueue.main.async {
                self.swp.setTitle(String(format: "%@%@", title ?? "", appTitle), for: .normal)
                self.swp.isEnabled = true
                results?((timer: aTimer, time : timeOut, isRun : false))
            }
        }
        aTimer.resume()
        return self.swp
    }
    
}

// MARK: - Private Function
private extension SwpExtensionClass where BaseClass : UIButton {
    
    ///
    /// # set image location
    /// - Parameters:
    ///   - edge:   imageEdge
    ///   - offset: offset
    /// - Returns: BaseClass
    @discardableResult private func buttonImageEdge(edge : ImageEdge,  offset : CGFloat = 0) -> BaseClass {
        
        let imageWith   : CGFloat = self.swp.currentImage?.size.width  ?? 0
        let imageHeight : CGFloat = self.swp.currentImage?.size.height ?? 0
        let labelWidth  : CGFloat = self.swp.titleLabel?.intrinsicContentSize.width  ?? 0
        let labelHeight : CGFloat = self.swp.titleLabel?.intrinsicContentSize.height ?? 0
        
        var imageEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        
        switch edge {
            
            case .top:
                imageEdgeInsets = UIEdgeInsets.init(top: -labelHeight - offset, left: 0, bottom: 0, right: -labelWidth);
                labelEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageWith, bottom: -imageHeight - offset, right: 0);
            
            case .left:
                imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -offset, bottom: 0, right: offset);
                labelEdgeInsets = UIEdgeInsets.init(top: 0, left: offset, bottom: 0, right: -offset);
            
            case .bottom:
                imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: -labelHeight - offset, right: -labelWidth);
                labelEdgeInsets = UIEdgeInsets.init(top: -imageHeight - offset, left: -imageWith, bottom: 0, right: 0);
            
            case .right:
                imageEdgeInsets = UIEdgeInsets.init(top: 0, left: labelWidth + offset, bottom: 0, right: -labelWidth - offset);
                labelEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageWith - offset, bottom: 0, right: imageWith + offset);
        }
        
        //  赋值
        self.swp.titleEdgeInsets = labelEdgeInsets
        self.swp.imageEdgeInsets = imageEdgeInsets
        
        return self.swp
    }
    
    
    ///
    /// # style
    /// - Parameters:
    ///   - bgColor:    bgColor
    ///   - title:      title
    ///   - target:     target
    ///   - action:     action
    ///   - titleColor: titleColor
    ///   - titleFont:  titleFont
    ///   - radius:     radius
    ///   - tag:        tag
    ///   - events:     events
    @discardableResult private func aStyle(_ bgColor : UIColor?, title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15), radius : CGFloat = 0, tag : Int = 0, events : UIControl.Event = .touchUpInside) -> BaseClass {
        
        self.tag(tag)
            .swp.title(title, for: .normal)
            .swp.title(title, for: .highlighted)
            .swp.titleFont(titleFont)
            .swp.titleColor(titleColor, for: .normal)
            .swp.titleColor(titleColor, for: .highlighted)
        self.swp
            .aBackgroundColor(self.swp, color: bgColor)
            .aCornerRadiusMasks(self.swp, radiusMasks: radius)
        guard let action = action else { return self.swp }
        self.targetEvent(target, action: action, for: events)
        return self.swp
    }
    
    ///
    ///
    /// # convenience init check box style function
    /// - Parameters:
    ///   - normalImage:    normalImage
    ///   - selectedImage:  selectedImage
    ///   - title:          title
    ///   - target:         target
    ///   - action:         action
    ///   - titleColor:     titleColor
    ///   - titleFont:      titleFont
    /// - Returns: BaseClass
    @discardableResult private func aCheckBoxStyle(_ normalImage : UIImage?, selectedImage : UIImage?,  title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15)) -> BaseClass {
        
        self.titleFont(titleFont)
            .swp.image(normalImage, for: .normal)
            .swp.image(selectedImage, for: .selected)
            .swp.title(title, for: .normal)
            .swp.title(title, for: .selected)
            .swp.title(title, for: .highlighted)
            .swp.titleFont(titleFont)
            .swp.titleColor(titleColor, for: .normal)
            .swp.titleColor(titleColor, for: .highlighted)
            .swp.imageEdge(.right, offset: 2)
            .swp.sizeToFit()
        guard let action = action else { return self.swp }
        self.targetEvent(target, action: action, for: .touchUpInside)
        return self.swp
    }
    
}
