
//
//  DemoBaseTableView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit





class DemoBaseTableView: UITableView {
    
    var datas : [NSObject] = []
    
//    typealias TableViewClickCellEvent = ( (_ tableView : UITableView, _ indexPath: IndexPath, _ model : AnyObject) -> Void )
//    typealias TableViewDidScrollEvent = ( (_ scrollView : UIScrollView) -> Void )

//    var tableViewClickCellEvent : TableViewClickCellEvent? = nil
//    var tableViewDidScrollEvent : TableViewDidScrollEvent? = nil
    
    var baseDelete : DemoBaseTableViewDelegate? = nil
    
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: frame, style: style)
    
        self.configTableView()
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func delegate(_ delegate : DemoBaseTableViewDelegate) -> Self {
        
        self.baseDelete = delegate
        
        return self
    }
    
    open func datas(_ datas : [NSObject]) -> Self {
        
        self.datas = datas
        
        return self
    }
    
//    open func tableViewDidScrollEvent(_ block : TableViewDidScrollEvent? ) -> Self {
//        self.tableViewDidScrollEvent = block
//        return self
//    }
//
//    open func tableViewClickCellEvent(_ block : TableViewClickCellEvent? ) -> Self {
//        self.tableViewClickCellEvent = block
//        return self
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

extension DemoBaseTableView {
    
    open func configTableView() -> Void {
        
    }
}


extension DemoBaseTableView {
    
   
    
}

