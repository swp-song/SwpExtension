//
//  UnicodeScalar+Extension.swift
//  swp-song
//
//  Created by swp_song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//


extension SwpExtensionStruct where BaseStruct == UnicodeScalar {
    
    /// # check emoji
    public var isEmoji : Bool {
        return self.isEmoji(self.swp.value)
    }
    
    ///
    /// # check emoji
    /// - Parameter value: value
    /// - Returns: Bool
    public func isEmoji(_ value : UInt32) -> Bool {
        
        var isEmoji = false
        
        //  0x1F600 ... 0x1F64F     Emoticons
        //  0x1F300 ... 0x1F5FF     Misc Symbols and Pictographs
        //  0x1F680 ... 0x1F6FF     Transport and Map
        //  0x1F1E6 ... 0x1F1FF     Regional country flags
        //  0x2600 ... 0x26FF       Misc symbols
        //  0x2700 ... 0x27BF       Dingbats
        //  0xFE00 ... 0xFE0F       Variation Selectors
        //  0x1F900 ... 0x1F9FF     Supplemental Symbols and Pictographs
        //  127000 ... 127600       Various asian characters
        //  65024 ... 65039         Variation selector
        //  9100 ... 9300           Misc items
        //  8400 ... 8447           Combining Diacritical Marks for Symbols
        switch value {
            
        case 0x1F600 ... 0x1F64F,
             0x1F300 ... 0x1F5FF,
             0x1F680 ... 0x1F6FF,
             0x1F1E6 ... 0x1F1FF,
             0x2600 ... 0x26FF,
             0x2700 ... 0x27BF,
             0xFE00 ... 0xFE0F,
             0x1F900 ... 0x1F9FF,
             127000 ... 127600,
             65024 ... 65039,
             9100 ... 9300,
             8400 ... 8447:
            
            isEmoji =  true
        default:
            isEmoji = false
            
        }
        
        return isEmoji
    }
    
}

