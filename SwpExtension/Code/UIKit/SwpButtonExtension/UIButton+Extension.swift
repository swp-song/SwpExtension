//
//  UIButton+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UIButton {
    
    ///
    /// # set submit style button
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - titleColor:         titleColor
    ///   - size:               size
    ///   - radius:             radius
    ///   - tag:                tag
    ///   - target:             target
    ///   - action:             action
    ///   - events:             events
    public convenience init(_ backgroundColor : UIColor?, title : String?, titleColor : UIColor?, size : CGFloat = 15, radius : CGFloat = 0, tag : Int = 0, target : Any?, action : Selector?, events : UIControlEvents = .touchUpInside) {
        self.init(backgroundColor, title: title, titleColor: titleColor, titleFont: UIFont.systemFont(ofSize: size), radius: radius, tag: tag, target: target, action: action, events: events)
    }
    
    
    ///
    /// # set submit style button
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - titleColor:         titleColor
    ///   - titleFont:          titleFont
    ///   - radius:             radius
    ///   - tag:                tag
    ///   - target:             target
    ///   - action:             action
    ///   - events:             events
    public convenience init(_ backgroundColor : UIColor?, title : String? = nil, titleColor : UIColor?, titleFont : UIFont, radius : CGFloat = 0, tag : Int = 0, target : Any?, action : Selector?, events : UIControlEvents = .touchUpInside) {
        
        self.init()
        
        self.swp.tag(tag)
            .swp.title(title, for: .normal)
            .swp.title(title, for: .highlighted)
            .swp.titleFont(titleFont)
            .swp.titleColor(titleColor, for: .normal)
            .swp.titleColor(titleColor, for: .highlighted)
            .swp.cornerRadiusMasks(radius)
            .swp.backgroundColor(backgroundColor)
        
        guard let action = action else {
            return
        }
        
        self.swp.targetEvent(target, action: action, for: events)
    }
}


// MARK: - Property
extension SwpExtensionClass where BaseClass : UIButton {
    
    
    @discardableResult static public func buttonSt(backgroundColor : UIColor?, title : String? = nil, titleColor : UIColor?, titleFont : UIFont, radius : CGFloat = 0, tag : Int = 0, target : Any?, action : Selector?, events : UIControlEvents = .touchUpInside) -> UIButton {
        return UIButton(backgroundColor, title: title, titleColor: titleColor, titleFont: titleFont, radius: radius, tag: tag, target: target, action: action, events: events)
    }
    
    ///
    /// # set title
    /// - Parameters:
    ///   - title:  title
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func title(_ title : String?, for state : UIControlState) -> BaseClass {
        self.swp.setTitle(title, for: state)
        return self.swp
    }
    
    ///
    /// # set title font
    /// - Parameter font: font
    /// - Returns:  UIButton
    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
        self.swp.titleLabel?.font = font
        return self.swp
    }
    
    
    ///
    /// # set title color
    /// - Parameters:
    ///   - color:  color
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func titleColor(_ color : UIColor?, for state : UIControlState) -> BaseClass {
        self.swp.setTitleColor(color, for: state)
        return self.swp
    }
    
    
    ///
    /// # set image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func image(_ image : UIImage?, for state : UIControlState) -> BaseClass {
        self.swp.setImage(image, for: state)
        return self.swp
    }
    
    
    ///
    /// # set background image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func backgroundImage(_ image : UIImage?, for state : UIControlState) -> BaseClass {
        self.swp.setBackgroundImage(image, for: state)
        return self.swp
    }
    
    
    ///
    /// # set tag
    /// - Parameter tag: tag
    /// - Returns: UIButton
    @discardableResult public func tag(_ tag : Int) -> BaseClass {
        self.swp.tag = tag
        return self.swp
    }
    
    
    ///
    /// # set events
    /// - Parameters:
    ///   - target: target
    ///   - action: action
    ///   - events: events
    /// - Returns:  UIButton
    @discardableResult public func targetEvent(_ target: Any?, action : Selector,  for events : UIControlEvents) -> BaseClass {
        self.swp.addTarget(target, action: action, for: events)
        return self.swp
    }
    
    
    ///
    /// # set title edgeInsets
    /// - Parameter titleEdgeInsets: titleEdgeInsets
    /// - Returns: UIButton
    @discardableResult public func titleEdgeInsets(titleEdgeInsets : UIEdgeInsets) -> BaseClass {
        self.swp.titleEdgeInsets = titleEdgeInsets
        return self.swp
    }
    
    
    ///
    /// # set image edgeInsets
    /// - Parameter imageEdgeInsets:
    /// - Returns: UIButton
    @discardableResult public func imageEdgeInsets(imageEdgeInsets : UIEdgeInsets) -> BaseClass {
        self.swp.imageEdgeInsets = imageEdgeInsets
        return self.swp
    }
}

extension SwpExtensionClass where BaseClass : UIButton {
    
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
    /// - Returns: UIButton
    @discardableResult public func imageEdge(_ edge : ImageEdge,  offset : CGFloat = 0) -> BaseClass {
        return buttonImageEdge(edge: edge, offset: offset)
    }
    
    
    // MARK: - Private
    
    ///
    /// # set image location
    /// - Parameters:
    ///   - edge:   imageEdge
    ///   - offset: offset
    /// - Returns: UIButton
    private func buttonImageEdge(edge : ImageEdge,  offset : CGFloat = 0) -> BaseClass {
    
        let imageWith   : CGFloat = self.swp.currentImage?.size.width  ?? 0
        let imageHeight : CGFloat = self.swp.currentImage?.size.height ?? 0
        let labelWidth  : CGFloat = self.swp.titleLabel?.intrinsicContentSize.width  ?? 0
        let labelHeight : CGFloat = self.swp.titleLabel?.intrinsicContentSize.height ?? 0
        
        var imageEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets : UIEdgeInsets = UIEdgeInsets.zero
        
        switch edge {
            
        case .top:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - offset, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - offset, 0);
            
        case .left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -offset, 0, offset);
            labelEdgeInsets = UIEdgeInsetsMake(0, offset, 0, -offset);
            
        case .bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - offset, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - offset, -imageWith, 0, 0);
            
        case .right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + offset, 0, -labelWidth - offset);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - offset, 0, imageWith + offset);
        }
        
        //  赋值
        self.swp.titleEdgeInsets = labelEdgeInsets
        self.swp.imageEdgeInsets = imageEdgeInsets
        
        return self.swp
    }
    
}
