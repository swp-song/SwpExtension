//
//  DemoListModel.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class DemoListModel: NSObject {

    private(set) var aTitle : String     = ""
    private(set) var aClass : AnyClass?  = nil
    
    convenience init(_ dictionary : [String : Any]) {
        self.init()
        self.aTitle = dictionary["aTitle"] as? String ?? ""
        self.aClass = NSClassFromString(Bundle.main.swp.nameSpace + (dictionary["aClass"] as? String ?? ""))
    }

    static func demos(_ datas : [[String : Any]]?) -> [DemoListModel] {
        var models : [DemoListModel] = []
        datas?.forEach { (data) in
            models.append(DemoListModel(data))
        }
        return models
    }
    
}
