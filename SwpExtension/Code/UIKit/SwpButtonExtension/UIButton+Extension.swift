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
    /// # 快速设置值 Button 样式
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
    /// # 快速设置值 Button
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
    
    
    // MARK: - Custom
    
    @discardableResult public func swpTitle(_ title : String, for state : UIControlState) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult public func swpTitleFont(font : UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult public func swpTitleColor(_ color : UIColor, for state : UIControlState) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult public func swpImage(_ image : UIImage?, for state : UIControlState) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    // MARK: - Custom
    
    
    ///
    /// # swpImageEdge，设置图片位置
    /// - Parameters:
    ///   - imageEdge:  imageEdge
    ///   - offset:     offset
    /// - Returns:      UIButton
    @discardableResult public func swpImageEdge(imageEdge edge : SwpButtonImageEdge,  offset : CGFloat = 0) -> Self {
        return buttonImageEdge(edge: edge, offset: offset)
    }

    
    ///
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
