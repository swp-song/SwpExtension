//
//  DemoModel.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import Foundation

class DemoModel: NSObject {

    
    private(set) var aTitle : String  = "123"
    private(set) var aClass : AnyClass?
    
    override init() {
        
    }
    
    public convenience init(dictionary : [String : Any]) {
        self.init()
        aTitle = dictionary["aTitle"] as! String
        
        print(Bundle.SwpGetNameSpace())
        print(NSClassFromString("SwpExtensionDemo." + "NavigationBarViewController") as Any)
        aClass = NSClassFromString("SwpExtensionDemo." + "NavigationBarViewController")
//        print(NSClassFromString((dictionary["aClass"] as! String)) as Any)
        
    }
    
    public static func demos(dictionarys : [[String : Any]]?) -> [DemoModel] {
        
        var models : [DemoModel] = [];
        
        dictionarys?.forEach { (dictionary) in
            models.append(DemoModel(dictionary: dictionary))
        }
        
        return models
    }
}
