//
//  UITextField+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/23.
//  Copyright © 2018年 swp-song. All rights reserved.
//




extension UITextField  {
    
    public convenience init(_ backgroundColor : UIColor? = nil, textColor : UIColor? = nil,  textFont : UIFont?, placeholder : String?, pColor : UIColor?, pFont : UIFont?, border : CGFloat = 0, radius : CGFloat = 1, keyboard : UIKeyboardType = .default, isEntry : Bool = false) {
    
        self.init()
        
        self.swp.leftMargin()
            .swp.font(textFont)
            .swp.textColor(textColor)
            .swp.keyboardType(keyboard)
            .swp.clearButtonMode(.always)
            .swp.placeholder(placeholder)
            .swp.isSecureTextEntry(isEntry)
            .swp.placeholderStyle(pColor, font: pFont)
            .swp.borderWidth(border)
            .swp.cornerRadiusMasks(radius)
            .swp.backgroundColor(backgroundColor)
    }
}

extension SwpExtensionClass where BaseClass : UITextField {
    
    @discardableResult public func text(_ text: String) -> BaseClass {
        self.swp.text = text
        return self.swp
    }
    
    @discardableResult public func textColor(_ textColor: UIColor?) -> BaseClass {
        self.swp.textColor = textColor
        return self.swp
    }
    
    @discardableResult public func placeholder(_ placeholder: String?) -> BaseClass {
        self.swp.placeholder = placeholder
        return self.swp
    }
    
    @discardableResult public func font(_ font: UIFont?) -> BaseClass {
        self.swp.font = font
        return self.swp
    }
    
    @discardableResult public func keyboardType(_ keyboardType: UIKeyboardType) -> BaseClass {
        self.swp.keyboardType = keyboardType
        return self.swp
    }
    
    @discardableResult public func isSecureTextEntry(_ isSecureTextEntry: Bool) -> BaseClass {
        self.swp.isSecureTextEntry = isSecureTextEntry
        return self.swp
    }
    
    @discardableResult public func clearButtonMode(_ clearButtonMode: UITextFieldViewMode) -> BaseClass {
        self.swp.clearButtonMode = clearButtonMode
        return self.swp
    }
    
    @discardableResult public func leftView(_ view: UIView?, mode: UITextFieldViewMode = .never) -> BaseClass {
        self.swp.leftView     = view
        self.swp.leftViewMode = mode
        return self.swp
    }
    
    @discardableResult public func rightView(_ view: UIView?, mode: UITextFieldViewMode = .never) -> BaseClass {
        self.swp.rightView     = view
        self.swp.rightViewMode = mode
        return self.swp
    }
    
    @discardableResult public func leftMargin(_ margin: CGFloat = 10) -> BaseClass {
        self.leftView(UIView(frame: CGRect(x: 0, y: 0, width: margin, height: self.swp.frame.size.height)), mode: .always)
        return self.swp
    }

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
    
    @discardableResult public func placeholderStyle(_ color: UIColor?, font: UIFont? = nil) -> BaseClass {
        
        guard let placeholder = self.swp.placeholder else {
            return self.swp
        }
        
        self.swp.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:[NSAttributedStringKey.foregroundColor:color as Any, NSAttributedStringKey.font : font as Any])
        return self.swp
    }
    
}
