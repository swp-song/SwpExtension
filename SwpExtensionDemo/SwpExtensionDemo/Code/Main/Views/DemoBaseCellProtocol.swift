//
//  DemoBaseCellProtocol.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//


import UIKit
import Foundation


protocol DemoBaseCellProtocol : DemoBaseViewProtocol {
    
    static func cellInit(_ tableView : UITableView, identifier : String, indexPath : IndexPath) -> UITableViewCell
    
    func configCell() -> Void
    
    @discardableResult func model(_ model : NSObject?) -> Self
    
    @discardableResult func setDatas(_ datas : NSObject?) -> Self
    
    
}

extension DemoBaseCellProtocol {
    
    @discardableResult static func cellInit(_ tableView : UITableView, identifier : String, indexPath : IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    
    func configCell() -> Void {
        
    }
    
    @discardableResult func setDatas(_ datas : NSObject?) -> Self {
        return self
    }
    
    @discardableResult func model(_ model : NSObject?) -> Self {
        return self
    }
    
}


protocol DemoBaseCellEventDelegate : DemoBaseCellProtocol { }


extension DemoBaseCell : DemoBaseCellProtocol { }



