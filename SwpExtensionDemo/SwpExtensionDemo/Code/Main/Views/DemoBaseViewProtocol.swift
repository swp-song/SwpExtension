
//
//  DemoBaseViewProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

import Foundation


struct DemoDataSource {
    
    var datas : [NSObject] = []
    var model : NSObject?  = nil
    
//    weak var delegate : DemoBaseViewProtocol = nil
}


protocol DemoBaseViewProtocol : NSObjectProtocol {
    
    @discardableResult func model(_ model : NSObject?) -> Self
    
}

extension DemoBaseViewProtocol {
    @discardableResult func model(_ model : NSObject?) -> Self { return self }
}



protocol DemoBaseViewEventDelegate : NSObjectProtocol {
    
}

extension DemoBaseViewEventDelegate {

}








