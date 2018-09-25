//
//  UIScreen+Extension.swift
//  swp_song
//
//  Created by swp-song on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//

extension SwpExtensionClass where BaseClass : UIScreen {
    
    /// # get screen size
    public static var size : CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// # get screen width
    public static var width : CGFloat {
        return self.size.width
    }
    
    /// # get screen height
    public static var height : CGFloat {
        return self.size.height
    }
    
    ///
    /// # calculate screen aspect ratio
    /// - Parameters:
    ///   - scale: scale
    ///   - width: width
    ///   - height: height
    /// - Returns: CGFloat
    public static func screenScale(_ scale : CGFloat, width : CGFloat, height : CGFloat) -> CGFloat {
        return scale / width * height;
    }
    
}

