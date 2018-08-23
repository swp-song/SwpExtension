//
//  UIButton+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension UIButton {
    
    public enum SwpButtonImageEdge : Int {
        case top
        case left
        case bottom
        case right
    }
    
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
    public convenience init(_ backgroundColor : UIColor = UIColor.white, title : String?, titleColor : UIColor, size : CGFloat = 15, radius : CGFloat = 0, tag : Int = 0, target : Any?, action : Selector?, events : UIControlEvents = .touchUpInside) {
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
    public convenience init(_ backgroundColor : UIColor = UIColor.white, title : String?, titleColor : UIColor, titleFont : UIFont, radius : CGFloat = 0, tag : Int = 0, target : Any?, action : Selector?, events : UIControlEvents = .touchUpInside) {
        
        self.init()
        
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
        self.tag                 = tag
        self.backgroundColor     = backgroundColor
        self.titleLabel?.font    = titleFont
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .highlighted)
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor, for: .highlighted)
        action != nil ? self.addTarget(target, action: action!, for: events) : ()
    }
    
    
    // MARK: - Property
    
    ///
    /// # set title
    /// - Parameters:
    ///   - title:  title
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func swpTitle(_ title : String, for state : UIControlState) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    ///
    /// # set title font
    /// - Parameter font: font
    /// - Returns:  UIButton
    @discardableResult public func swpTitleFont(font : UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    
    ///
    /// # set title color
    /// - Parameters:
    ///   - color:  color
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func swpTitleColor(_ color : UIColor, for state : UIControlState) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    
    ///
    /// # set image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func swpImage(_ image : UIImage?, for state : UIControlState) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    
    ///
    /// # set background image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns:  UIButton
    @discardableResult public func swpBackgroundImage(_ image : UIImage?, for state : UIControlState) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    
    ///
    /// # set tag
    /// - Parameter tag: tag
    /// - Returns: UIButton
    @discardableResult public func swpTag(tag : Int) -> Self {
        self.tag = tag
        return self
    }
    
    
    ///
    /// # set events
    /// - Parameters:
    ///   - target: target
    ///   - action: action
    ///   - events: events
    /// - Returns:  UIButton
    @discardableResult public func swpTargetEvent(_ target: Any?, action : Selector,  for events : UIControlEvents) -> Self {
        self.addTarget(target, action: action, for: events)
        return self
    }
    
    
    ///
    /// # set title edgeInsets
    /// - Parameter titleEdgeInsets: titleEdgeInsets
    /// - Returns: UIButton
    @discardableResult public func swpTitleEdgeInsets(titleEdgeInsets : UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }
    
    
    ///
    /// # set image edgeInsets
    /// - Parameter imageEdgeInsets:
    /// - Returns: UIButton
    @discardableResult public func swpImageEdgeInsets(imageEdgeInsets : UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
    
    // MARK: - Custom
    ///
    /// # set image location
    /// - Parameters:
    ///   - imageEdge:  imageEdge
    ///   - offset:     offset
    /// - Returns: UIButton
    @discardableResult public func swpImageEdge(imageEdge edge : SwpButtonImageEdge,  offset : CGFloat = 0) -> Self {
        return buttonImageEdge(edge: edge, offset: offset)
    }

    
    // MARK: - Private
    
    ///
    /// # set image location
    /// - Parameters:
    ///   - edge:   imageEdge
    ///   - offset: offset
    /// - Returns: UIButton
    private func buttonImageEdge(edge : SwpButtonImageEdge,  offset : CGFloat = 0) -> Self {
        
        let imageWith   : CGFloat = self.currentImage?.size.width  ?? 0
        let imageHeight : CGFloat = self.currentImage?.size.height ?? 0
        let labelWidth  : CGFloat = self.titleLabel?.intrinsicContentSize.width  ?? 0
        let labelHeight : CGFloat = self.titleLabel?.intrinsicContentSize.height ?? 0
        
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
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
        return self
    }
    
}
