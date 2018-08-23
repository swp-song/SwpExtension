//
//  SwpMD5+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension String {
    
    /// # md5 encryption string
    public var swpMD5Encryption : String {
        return self.md5Encryption()
    }

    
    /// # md5 encrypted string, lowercased
    public var swpMD5EncryptionLowercased : String {
        return self.swpMD5Encryption.lowercased()
    }
    
    /// # md5 encrypted string, uppercased
    public var swpMD5EncryptionUppercased : String {
        return self.swpMD5Encryption.uppercased()
    }
    
    
    ///
    /// # md5 encryption string
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5Encryption(string : String) -> String {
        return string.swpMD5Encryption
    }
    
    ///
    /// # md5 encrypted string, lowercased
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5EncryptionLowercased(string : String) -> String {
        return string.swpMD5EncryptionLowercased
    }
    
    ///
    /// # md5 encrypted string, uppercased
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5EncryptionUppercased(string : String) -> String {
        return string.swpMD5EncryptionUppercased
    }
    
    
    // MARK: - MD5 32 Bit
    
    /// # md5 encrypts string, to generate a 32-bit key
    public var swpMD5Encryption32Bit : String {
        return self.swpMD5Encryption
    }
    
    /// # md5 encrypts string, to generate a 32-bit key, lowercased
    public var swpMD5Encryption32BitLowercase : String {
        return self.swpMD5EncryptionLowercased
    }
    
    /// # md5 encrypts string, to generate a 32-bit key, uppercased
    public var swpMD5Encryption32BitUppercased : String {
        return self.swpMD5EncryptionUppercased
    }
    
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption32Bit(string : String) -> String {
        return string.swpMD5Encryption32Bit
    }
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key, lowercased
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5Encryption32BitLowercase(string : String) -> String {
        return string.swpMD5Encryption32BitLowercase
    }
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key, uppercased
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5Encryption32BitUppercased(string : String) -> String {
        return string.swpMD5Encryption32BitUppercased
    }
    
    
    
    // MARK: - MD5 16 Bit
    
    
    /// # md5 encrypts string, to generate a 16-bit key
    public var swpMD5Encryption16Bit : String {
        return (self.swpMD5Encryption32Bit as NSString).substring(with: NSMakeRange(8, 16))
    }
    
    /// # md5 encrypts string, to generate a 16-bit key, lowercased
    public var swpMD5Encryption16BitLowercase : String {
        return self.swpMD5Encryption16Bit.lowercased()
    }
    
    /// # md5 encrypts string, to generate a 16-bit key, uppercased
    public var swpMD5Encryption16BitUppercased : String {
        return self.swpMD5Encryption16Bit.uppercased()
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5Encryption16Bit(string : String) -> String {
        return string.swpMD5Encryption16Bit
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key, lowercased
    /// - Parameter string: string
    /// - Returns:  String
    public static func SwpMD5Encryption16BitLowercase(string : String) -> String {
        return string.swpMD5Encryption16BitLowercase
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key, uppercased
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpMD5Encryption16BitUppercased(string : String) -> String {
        return string.swpMD5Encryption16BitUppercased
    }
    
    
    
    // MARK: - Private
    ///
    /// # md5 encrypts string
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
