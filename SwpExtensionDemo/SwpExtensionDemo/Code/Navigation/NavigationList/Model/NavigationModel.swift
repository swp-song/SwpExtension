
//
//  NavigationModel.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import Foundation

class NavigationModel: NSObject {
    
    private(set) var aTitle  : String = ""
    
    private(set) var aClass : AnyClass? = nil
    
    
    public convenience init(_ dictionary : [String : Any]) {
        self.init()
        aTitle = dictionary["aTitle"] as? String ?? ""
        aClass = NSClassFromString(Bundle.main.swp.nameSpace + (dictionary["aClass"] as? String ?? ""))
    }
    
    public static func datas(_ dictionarys : [[String : Any]]) -> [NavigationModel] {
        
        var models : [NavigationModel] = []
        
        dictionarys.forEach { (dictionary) in
            models.append(NavigationModel(dictionary))
        }
        
        return models
    }
    
    override init() {
        super.init()
    }
    
    
    
}
