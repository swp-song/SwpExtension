//
//  SwpMD5+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension String {
    
    /// # MD5 加密
    public var swpMD5Encryption : String {
        return self.md5Encryption()
    }
    
    /// # MD5 加密，字符串小写
    public var swpMD5EncryptionLowercased : String {
        return self.swpMD5Encryption.lowercased()
    }
    
    /// # MD5 加密，字符串大写
    public var swpMD5EncryptionUppercased : String {
        return self.swpMD5Encryption.uppercased()
    }
    
    
    
    ///
    /// # MD5 加密
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption(string : String) -> String {
        return string.swpMD5Encryption
    }
    
    ///
    /// # MD5 加密，字符串小写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5EncryptionLowercased(string : String) -> String {
        return string.swpMD5EncryptionLowercased
    }
    
    ///
    /// # MD5 加密，字符串大写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5EncryptionUppercased(string : String) -> String {
        return string.swpMD5EncryptionUppercased
    }
    
    
    
    // MARK: - MD5 32 Bit
    
    /// # MD5 加密, 32 Bit
    public var swpMD5Encryption32Bit : String {
        return self.swpMD5Encryption
    }
    
    /// # MD5 加密, 32 Bit，字符串小写
    public var swpMD5Encryption32BitLowercase : String {
        return self.swpMD5EncryptionLowercased
    }
    
    /// # MD5 加密, 32 Bit，字符串大写
    public var swpMD5Encryption32BitUppercased : String {
        return self.swpMD5EncryptionUppercased
    }
    
    
    ///
    /// # MD5 加密，32 Bit
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption32Bit(string : String) -> String {
        return string.swpMD5Encryption32Bit
    }
    
    ///
    /// # MD5 加密，32 Bit，字符串小写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption32BitLowercase(string : String) -> String {
        return string.swpMD5Encryption32BitLowercase
    }
    
    ///
    /// # MD5 加密，32 Bit，字符串大写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption32BitUppercased(string : String) -> String {
        return string.swpMD5Encryption32BitUppercased
    }
    
    
    
    // MARK: - MD5 32 Bit
    
    
    /// # MD5 加密, 32 Bit
    public var swpMD5Encryption16Bit : String {
        return (self.swpMD5Encryption32Bit as NSString).substring(with: NSMakeRange(8, 16))
    }
    
    /// # MD5 加密, 32 Bit，字符串小写
    public var swpMD5Encryption16BitLowercase : String {
        return self.swpMD5Encryption16Bit.lowercased()
    }
    
    /// # MD5 加密, 32 Bit，字符串大写
    public var swpMD5Encryption16BitUppercased : String {
        return self.swpMD5Encryption16Bit.uppercased()
    }
    
    ///
    /// # MD5 加密，16 Bit
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption16Bit(string : String) -> String {
        return string.swpMD5Encryption16Bit
    }
    
    ///
    /// # MD5 加密，16 Bit，字符串小写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption16BitLowercase(string : String) -> String {
        return string.swpMD5Encryption16BitLowercase
    }
    
    ///
    /// # MD5 加密，16 Bit，字符串大写
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption16BitUppercased(string : String) -> String {
        return string.swpMD5Encryption16BitUppercased
    }
    
    
    
    // MARK -
    
    ///
    /// # MD5 加密方法
    /// - Returns: String
    private func md5Encryption() -> String {
        
        if let data = self.data(using: .utf8, allowLossyConversion: true) {
            
            let message = data.withUnsafeBytes { bytes -> [UInt8] in
                return Array(UnsafeBufferPointer(start: bytes, count: data.count))
            }
            
            let MD5Calculator = MD5(message)
            let MD5Data = MD5Calculator.calculate()
            
            var MD5String = String()
            for char in MD5Data {
                MD5String += String(format: "%02x", char)
            }
            return MD5String
            
        }
        return self
    }
    
}
