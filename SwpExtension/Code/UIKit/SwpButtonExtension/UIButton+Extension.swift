//
//  UIButton+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

// MARK: - BaseClass Convenience Function
extension SwpExtensionClass where BaseClass : UIButton {

    ///
    /// # convenience init style function
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - target:             target
    ///   - action:             action
    ///   - titleColor:         titleColor
    ///   - titleFont:          titleFont
    ///   - radius:             radius
    ///   - tag:                tag
    ///   - events:             events
    public convenience init(_ backgroundColor : UIColor?, title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15), radius : CGFloat = 0, tag : Int = 0, events : UIControlEvents = .touchUpInside) {
        
        self.init(BaseClass())
        self.style(backgroundColor, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont, radius: radius, tag: tag, events: events)
    }
    
    
    ///
    /// # convenience init style function
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - target:             target
    ///   - action:             action
    ///   - titleColor:         titleColor
    ///   - titleFont:          titleFont
    ///   - radius:             radius
    ///   - tag:                tag
    ///   - events:             events
    @discardableResult static public func styleInit(_ backgroundColor : UIColor?, title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15), radius : CGFloat = 0, tag : Int = 0, events : UIControlEvents = .touchUpInside) -> BaseClass {
        
        return self.init(backgroundColor, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont, radius: radius, tag: tag, events: events).swp
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
    public convenience init(_ normalImage : UIImage?, selectedImage : UIImage?,  title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15)) {
        
        self.init(BaseClass())
        
        self.styleCheckBox(normalImage, selectedImage: selectedImage, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont)
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
    @discardableResult static public func styleCheckBoxInit(_ normalImage : UIImage?, selectedImage : UIImage?,  title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15)) -> BaseClass {
        return self.init(normalImage, selectedImage: selectedImage, title: title, target: target, action: action, titleColor: titleColor, titleFont: titleFont).swp
    }
    
}

// MARK: - Property Function
extension SwpExtensionClass where BaseClass : UIButton {
    
    
    ///
    /// # set title
    /// - Parameters:
    ///   - title:  title
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func title(_ title : String?, for state : UIControlState) -> BaseClass {
        self.swp.setTitle(title, for: state)
        return self.swp
    }
    
    ///
    /// # set title font
    /// - Parameter font: font
    /// - Returns: BaseClass
    @discardableResult public func titleFont(_ font : UIFont) -> BaseClass {
        self.swp.titleLabel?.font = font
        return self.swp
    }
    
    
    ///
    /// # set title color
    /// - Parameters:
    ///   - color:  color
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func titleColor(_ color : UIColor?, for state : UIControlState) -> BaseClass {
        self.swp.setTitleColor(color, for: state)
        return self.swp
    }
    
    
    ///
    /// # set image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func image(_ image : UIImage?, for state : UIControlState) -> BaseClass {
        self.swp.setImage(image, for: state)
        return self.swp
    }
    
    
    ///
    /// # set background image
    /// - Parameters:
    ///   - image:  image
    ///   - state:  state
    /// - Returns: BaseClass
    @discardableResult public func backgroundImage(_ image : UIImage?, for state : UIControlState) -> BaseClass {
        self.swp.setBackgroundImage(image, for: state)
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
    /// # set events
    /// - Parameters:
    ///   - target: target
    ///   - action: action
    ///   - events: events
    /// - Returns: BaseClass
    @discardableResult public func targetEvent(_ target: Any?, action : Selector,  for events : UIControlEvents) -> BaseClass {
        self.swp.addTarget(target, action: action, for: events)
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
    
    ///
    /// # style
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - target:             target
    ///   - action:             action
    ///   - titleColor:         titleColor
    ///   - titleFont:          titleFont
    ///   - radius:             radius
    ///   - tag:                tag
    ///   - events:             events
    @discardableResult private func style(_ backgroundColor : UIColor?, title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15), radius : CGFloat = 0, tag : Int = 0, events : UIControlEvents = .touchUpInside) -> BaseClass {
        
        self.tag(tag)
            .swp.title(title, for: .normal)
            .swp.title(title, for: .highlighted)
            .swp.titleFont(titleFont)
            .swp.titleColor(titleColor, for: .normal)
            .swp.titleColor(titleColor, for: .highlighted)
        
        self.swp
            .aCornerRadiusMasks(self.swp, radiusMasks: radius)
            .aBackgroundColor(self.swp, color: backgroundColor)
        
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
    @discardableResult private func styleCheckBox(_ normalImage : UIImage?, selectedImage : UIImage?,  title : String?, target : Any?, action : Selector?, titleColor : UIColor? = UIColor.black, titleFont : UIFont = UIFont.systemFont(ofSize: 15)) -> BaseClass {
        
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
