//
//  SwpBase64+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension String {
    
    
    /// # base64 encoding
    public var swpBase64Encoding : String {
        return self.base64Encoding()
    }
    

    /// # base64 decoding
    public var swpBase64Decoding : String  {
        return self.base64Decoding()
    }
    
    ///
    /// # base64 encoding
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpBase64Encoding(string : String) -> String {
        return string.swpBase64Encoding
    }
    
    ///
    /// # base64 decoding
    /// - Parameter string: string
    /// - Returns: String
    public static func SwpBase64Decoding(string : String) -> String {
        return string.swpBase64Decoding
    }
    
    
    
    // MARK - private
    
    ///
    /// # base64 encoding
    /// - Parameter string: string
    /// - Returns: String
    private func base64Encoding() -> String {
        guard self.count != 0 else {
            return self
        }
        
        let data : Data? = self.data(using: String.Encoding.utf8)
        return data?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0)) ?? ""
    }
    
    ///
    /// # base64 decoding
    /// - Parameter string: string
    /// - Returns: String
    private func base64Decoding() -> String {
        
        guard self.count != 0 else {
            return self
        }
        let data : Data  = Data(base64Encoded: self, options: Data.Base64DecodingOptions.init(rawValue: 0)) ?? Data()
        return String(data: data, encoding: String.Encoding.utf8) ?? ""
    }
}
