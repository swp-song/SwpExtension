
//
//  DemoBaseTableView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit


class DemoBaseTableView: UITableView {
    

    var datas : DemoDataSource = DemoDataSource()
    
    weak var aDelegate : DemoBaseTableViewDelegate? = nil
    
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: frame, style: style)
        
        self.configTableView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableView() {
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

extension DemoBaseTableView {

    
    func aDelegate(_ aDelegate : DemoBaseTableViewDelegate) -> Self {
        self.aDelegate = aDelegate
        return self
    }
    
}
