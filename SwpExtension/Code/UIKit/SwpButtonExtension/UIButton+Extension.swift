//
//  UIButton+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension UIButton {
    
    
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
    
}
