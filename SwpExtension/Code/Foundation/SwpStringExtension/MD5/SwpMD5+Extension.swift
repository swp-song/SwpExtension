//
//  SwpMD5+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == String {
    
    /// # md5 encryption string
    public var md5 : String {
        return self.md5Encryption()
    }

    
    /// # md5 encrypted string, lowercased
    public var md5Lowercased : String {
        return self.md5.lowercased()
    }
    
    /// # md5 encrypted string, uppercased
    public var md5Uppercased : String {
        return self.md5.uppercased()
    }
    
    
    ///
    /// # md5 encryption string
    /// - Parameter string: string
    /// - Returns: String
    public static func md5(_ string : String) -> String {
        return string.swp.md5
    }
    
    ///
    /// # md5 encrypted string, lowercased
    /// - Parameter string: string
    /// - Returns: String
    public static func md5Lowercased(_ string : String) -> String {
        return string.swp.md5Lowercased
    }
    
    ///
    /// # md5 encrypted string, uppercased
    /// - Parameter string: string
    /// - Returns:  String
    public static func md5Uppercased(_ string : String) -> String {
        return string.swp.md5Uppercased
    }
    
    
    // MARK: - MD5 32 Bit
    
    /// # md5 encrypts string, to generate a 32-bit key
    public var md5_32Bit : String {
        return self.md5
    }
    
    /// # md5 encrypts string, to generate a 32-bit key, lowercased
    public var md5_32BitLowercase : String {
        return self.md5Lowercased
    }
    
    /// # md5 encrypts string, to generate a 32-bit key, uppercased
    public var md5_32BitUppercased : String {
        return self.md5Uppercased
    }
    
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key
    /// - Parameter string: string
    /// - Returns:  String
    public static func md5_32Bit(_ string : String) -> String {
        return string.swp.md5_32Bit
    }
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key, lowercased
    /// - Parameter string: string
    /// - Returns: String
    public static func md5_32BitLowercase(_ string : String) -> String {
        return string.swp.md5_32BitLowercase
    }
    
    ///
    /// # md5 encrypts string, to generate a 32-bit key, uppercased
    /// - Parameter string: string
    /// - Returns: String
    public static func md5_32BitUppercased(_ string : String) -> String {
        return string.swp.md5_32BitUppercased
    }
    
    
    
    // MARK: - MD5 16 Bit
    
    
    /// # md5 encrypts string, to generate a 16-bit key
    public var md5_16Bit : String {
        return (self.md5 as NSString).substring(with: NSMakeRange(8, 16))
    }
    
    /// # md5 encrypts string, to generate a 16-bit key, lowercased
    public var md5_16BitLowercase : String {
        return self.md5_16Bit.lowercased()
    }
    
    /// # md5 encrypts string, to generate a 16-bit key, uppercased
    public var md5_16BitUppercased : String {
        return self.md5_16Bit.uppercased()
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key
    /// - Parameter string: string
    /// - Returns: String
    public static func md5_16Bit(_ string : String) -> String {
        return string.swp.md5_16Bit
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key, lowercased
    /// - Parameter string: string
    /// - Returns:  String
    public static func md5_16BitLowercase(_ string : String) -> String {
        return string.swp.md5_16BitLowercase
    }
    
    ///
    /// # md5 encrypts string, to generate a 16-bit key, uppercased
    /// - Parameter string: string
    /// - Returns: String
    public static func md5_16BitUppercased(_ string : String) -> String {
        return string.swp.md5_16BitUppercased
    }
    
}

// MARK: - Private
extension SwpExtensionStruct where BaseStruct == String {

    ///
    /// # md5 encrypts string
    /// - Returns: String
    private func md5Encryption() -> String {
        
        if let data = self.swp.data(using: .utf8, allowLossyConversion: true) {
            
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
        return self.swp
    }
}
