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

    static func models(_ datas : [[String : Any]]?) -> [DemoListModel] {
        var models : [DemoListModel] = []
        datas?.forEach { (data) in
            models.append(DemoListModel(data))
        }
        return models
    }
    
    
    private convenience init(_ aTitle : String, aClass : AnyClass?) {
        self.init()
        self.aTitle = aTitle
        self.aClass = aClass
    }
    
    static func defaultModels(_ number : Int) -> [DemoListModel] {
        var models : [DemoListModel] = []
        for i in 0 ..< number {
            models.append(DemoListModel("title\(i)", aClass: nil))
        }
        return models;
    }
    
}
