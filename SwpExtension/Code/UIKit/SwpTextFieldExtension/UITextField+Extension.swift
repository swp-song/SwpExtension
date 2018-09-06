//
//  UITextField+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/23.
//  Copyright © 2018年 swp-song. All rights reserved.
//

// MARK: - BaseClass Convenience Function
extension SwpExtensionClass where BaseClass : UITextField {
    
    ///
    /// # convenience init style function
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - textColor:          textColor
    ///   - textFont:           textFont
    ///   - placeholder:        placeholder
    ///   - aColor:             aColor
    ///   - aFont:              aFont
    ///   - border:             border
    ///   - radius:             radius
    ///   - keyboard:           keyboard
    ///   - isEntry:            isEntry
    /// - Returns: BaseClass
    public func style(_ backgroundColor : UIColor?, textColor : UIColor?, textFont : UIFont?, placeholder : String?, aColor : UIColor?, aFont : UIFont?, border : CGFloat = 0, radius : CGFloat = 1, keyboard : UIKeyboardType = .default, isEntry : Bool = false)-> BaseClass {
        
        return self.leftMargin().swp.aStyle(backgroundColor, textColor: textColor, textFont: textFont, placeholder: placeholder, aColor: aColor, aFont: aFont, border: border, radius: radius, keyboard: keyboard, isEntry: isEntry)
    }
    
    ///
    /// # convenience init image style function
    /// - Parameters:
    ///   - backgroundColor:    backgroundColor
    ///   - image:              image
    ///   - textColor:          textColor
    ///   - textFont:           textFont
    ///   - placeholder:        placeholder
    ///   - aColor:             aColor
    ///   - aFont:              aFont
    ///   - border:             border
    ///   - radius:             radius
    ///   - keyboard:           keyboard
    ///   - isEntry:            isEntry
    /// - Returns: BaseClass
    public func imageStyle(_ bgColor : UIColor?, image : UIImage?, textColor : UIColor?, textFont : UIFont?, placeholder : String?, aColor : UIColor?, aFont : UIFont?, border : CGFloat = 0, radius : CGFloat = 1, keyboard : UIKeyboardType = .default, isEntry : Bool = false) -> BaseClass {
        
        return self.leftImage(image).swp.aStyle(bgColor, textColor: textColor, textFont: textFont, placeholder: placeholder, aColor: aColor, aFont: aFont, border: border, radius: radius, keyboard: keyboard, isEntry: isEntry)
    }
}



// MARK: - Property Function
extension SwpExtensionClass where BaseClass : UITextField {
    
    
    ///
    /// # set text
    /// - Parameter text: text
    /// - Returns: BaseClass
    @discardableResult public func text(_ text: String) -> BaseClass {
        self.swp.text = text
        return self.swp
    }
    
    ///
    /// # set textColor
    /// - Parameter textColor: textColor
    /// - Returns: BaseClass
    @discardableResult public func textColor(_ textColor: UIColor?) -> BaseClass {
        self.swp.textColor = textColor
        return self.swp
    }
    
    ///
    /// # set placeholder
    /// - Parameter placeholder: placeholder
    /// - Returns: BaseClass
    @discardableResult public func placeholder(_ placeholder: String?) -> BaseClass {
        self.swp.placeholder = placeholder
        return self.swp
    }
    
    ///
    /// # set text font
    /// - Parameter font: font
    /// - Returns: BaseClass
    @discardableResult public func font(_ font: UIFont?) -> BaseClass {
        self.swp.font = font
        return self.swp
    }
    
    ///
    /// # set keyboardType
    /// - Parameter keyboardType: keyboardType
    /// - Returns: BaseClass
    @discardableResult public func keyboardType(_ keyboardType: UIKeyboardType) -> BaseClass {
        self.swp.keyboardType = keyboardType
        return self.swp
    }
    
    ///
    /// # set isSecureTextEntry
    /// - Parameter isSecureTextEntry: isSecureTextEntry
    /// - Returns: BaseClass
    @discardableResult public func isSecureTextEntry(_ isSecureTextEntry: Bool) -> BaseClass {
        self.swp.isSecureTextEntry = isSecureTextEntry
        return self.swp
    }
    
    ///
    /// # set clearButtonMode
    /// - Parameter clearButtonMode: clearButtonMode
    /// - Returns: BaseClass
    @discardableResult public func clearButtonMode(_ clearButtonMode: UITextFieldViewMode) -> BaseClass {
        self.swp.clearButtonMode = clearButtonMode
        return self.swp
    }

    
    ///
    /// # set leftView AND viewMode
    /// - Parameters:
    ///   - view: leftView
    ///   - mode: mode
    /// - Returns: BaseClass
    @discardableResult public func leftView(_ view: UIView?, mode: UITextFieldViewMode = .never) -> BaseClass {
        self.swp.leftView     = view
        self.swp.leftViewMode = mode
        return self.swp
    }
    
    ///
    /// # set rightView AND viewMode
    /// - Parameters:
    ///   - view: rightView
    ///   - mode: mode
    /// - Returns: BaseClass
    @discardableResult public func rightView(_ view: UIView?, mode: UITextFieldViewMode = .never) -> BaseClass {
        self.swp.rightView     = view
        self.swp.rightViewMode = mode
        return self.swp
    }
    
    ///
    /// # set leftMargin
    /// - Parameters:
    ///   - margin: margin
    /// - Returns: BaseClass
    @discardableResult public func leftMargin(_ margin: CGFloat = 10) -> BaseClass {
        self.leftView(UIView(frame: CGRect(x: 0, y: 0, width: margin, height: self.swp.frame.size.height)), mode: .always)
        return self.swp
    }

    ///
    /// # set leftImage
    /// - Parameters:
    ///   - image: image
    /// - Returns: BaseClass
    @discardableResult public func leftImage(_ image: UIImage?) -> BaseClass {
        
        guard let image = image else {
            return self.swp
        }
        let imageView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height:30))
        imageView.image             = image
        imageView.contentMode       = .center
        self.leftView(imageView, mode: .always)
        return self.swp
    }
    
    
    // MARK: - UITextField Placeholder
    
    ///
    /// # set placeholder style
    /// - Parameters:
    ///   - color:  color
    ///   - font:   font
    /// - Returns: BaseClass
    @discardableResult public func placeholderStyle(_ color: UIColor?, font: UIFont? = nil) -> BaseClass {
        
        guard let placeholder = self.swp.placeholder else {
            return self.swp
        }
        
        self.swp.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:[NSAttributedStringKey.foregroundColor:color as Any, NSAttributedStringKey.font : font as Any])
        return self.swp
    }
}


// MARK: - Private Function
extension SwpExtensionClass where BaseClass : UITextField {
    
    @discardableResult private func aStyle(_ bgColor : UIColor?, textColor : UIColor?,  textFont : UIFont?, placeholder : String?, aColor : UIColor?, aFont : UIFont?, border : CGFloat = 0, radius : CGFloat = 1, keyboard : UIKeyboardType = .default, isEntry : Bool = false) -> BaseClass {
        
        self.font(textFont)
            .swp.textColor(textColor)
            .swp.keyboardType(keyboard)
            .swp.clearButtonMode(.always)
            .swp.placeholder(placeholder)
            .swp.isSecureTextEntry(isEntry)
            .swp.placeholderStyle(aColor, font: aFont)
        
        self.swp
            .aBorderWidth(self.swp, width: border)
            .aBackgroundColor(self.swp, color: bgColor)
            .aCornerRadiusMasks(self.swp, radiusMasks: radius)
        
        
        return self.swp
    }
}

