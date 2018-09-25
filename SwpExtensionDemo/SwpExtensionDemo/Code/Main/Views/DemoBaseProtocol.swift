
//
//  DemoBaseCellProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

import Foundation


struct DemoBaseStatic {
    
    var model : NSObject?   = nil
    var datas : [NSObject]  = []
    weak var delegate : DemoBaseCellProtocol? = nil
}

protocol DemoBaseCellProtocol : NSObjectProtocol {
    
    func configCell() -> Void
    
    func setUpUI() -> Void
    
    func setUIAutoLayout() -> Void
    
    @discardableResult func model(_ model : NSObject?) -> Self
    
    @discardableResult func setDatas(_ datas : NSObject?) -> Self
}



extension DemoBaseCellProtocol {
    
    public func configCell() -> Void { }
    
    public func setUpUI() -> Void { }
    
    public func setUIAutoLayout() -> Void { }
    
    @discardableResult func model(_ model : NSObject?) -> Self { return self }
    
    @discardableResult func setDatas(_ datas: NSObject?) -> Self { return self }
    
}

extension DemoBaseCell : DemoBaseCellProtocol { }


protocol DemoBaseTableViewDelegate : NSObjectProtocol {
    
    typealias TableViewClickCellEvent = ( (_ tableView : UITableView, _ indexPath: IndexPath, _ model : AnyObject) -> Void )
    
    typealias TableViewDidScrollEvent = ( (_ scrollView : UIScrollView) -> Void )
    
    
    func tableViewDidScroll(scrollView : UIScrollView) -> Void
    
    func tableView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) -> Void
    
}


extension DemoBaseTableViewDelegate { }

extension DemoBaseTableView : DemoBaseTableViewDelegate {
    
    func tableViewDidScroll(scrollView : UIScrollView) -> Void { }
    
    func tableView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) -> Void { }
    
}







