//
//  DemoModel.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import Foundation

class DemoModel: NSObject {

    
    private(set) var aTitle : String  = ""
    private(set) var aClass : AnyClass?
    
    override init() {
        
    }
    
    public convenience init(dictionary : [String : Any]) {
        self.init()
        aTitle = dictionary["aTitle"] as? String ?? ""
        aClass = NSClassFromString(Bundle.SwpGetNameSpace() + (dictionary["aClass"] as? String ?? ""))
    }
    
    public static func demos(dictionarys : [[String : Any]]?) -> [DemoModel] {
        
        var models : [DemoModel] = [];
        dictionarys?.forEach { (dictionary) in
            models.append(DemoModel(dictionary: dictionary))
        }
        return models
    }
}
