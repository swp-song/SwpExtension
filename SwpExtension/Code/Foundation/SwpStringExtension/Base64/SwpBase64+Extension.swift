//
//  SwpBase64+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionStruct where BaseStruct == String {
    
    
    /// # base64 encoding
    public var base64Encoding : String {
        return self.encoding()
    }
    
    /// # base64 decoding
    public var base64Decoding : String {
        return self.decoding()
    }
    
    ///
    /// # base64 encoding
    /// - Parameter string: string
    /// - Returns: String
    @discardableResult public static func base64Encoding(_ string : String) -> String {
        return string.swp.base64Encoding
    }
    
    ///
    /// # base64 decoding
    /// - Parameter string: string
    /// - Returns: String
    @discardableResult public static func base64Decoding(_ string : String) -> String {
        return string.swp.base64Decoding
    }

}


// MARK: - Private
extension SwpExtensionStruct where BaseStruct == String {
    
    ///
    /// # base64 encoding
    /// - Parameter string: string
    /// - Returns: String
    private func encoding() -> String {
        guard self.swp.count != 0 else {
            return self.swp
        }
        
        let data : Data? = self.swp.data(using: String.Encoding.utf8)
        return data?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0)) ?? ""
    }
    
    ///
    /// # base64 decoding
    /// - Parameter string: string
    /// - Returns: String
    private func decoding() -> String {
        
        guard self.swp.count != 0 else {
            return self.swp
        }
        
        let data : Data  = Data(base64Encoded: self.swp, options: Data.Base64DecodingOptions.init(rawValue: 0)) ?? Data()
        return String(data: data, encoding: String.Encoding.utf8) ?? ""
    }
}

