//
//  DemoBaseTableViewProtocol.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/25.
//  Copyright © 2018年 swp-song. All rights reserved.
//


import UIKit

import Foundation


protocol DemoBaseTableViewProtocol : DemoBaseViewProtocol {
    
    func configTableView() -> Void
    
}

extension DemoBaseTableViewProtocol {
    
    func configTableView() -> Void { }
}


protocol DemoBaseTableViewDelegate : DemoBaseViewEventDelegate {
    
    typealias TableViewClickCellEvent = ( (_ tableView : UITableView, _ indexPath: IndexPath, _ model : AnyObject) -> Void )
    
    typealias TableViewDidScrollEvent = ( (_ scrollView : UIScrollView) -> Void )
    
    func tableViewDidScroll(scrollView : UIScrollView) -> Void
    
    func tableView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) -> Void
}


extension DemoBaseTableViewDelegate {
    
    func tableViewDidScroll(scrollView : UIScrollView) -> Void { }
    
    func tableView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) -> Void { }
}

extension DemoBaseTableView : DemoBaseTableViewProtocol, DemoBaseViewEventDelegate  { }




