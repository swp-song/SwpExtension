
//
//  NavigationBarListView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationBarListView: UITableView, UITableViewDataSource {

    
    public var datas : [Any] = []
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        register(NavigationBarCell.self, forCellReuseIdentifier: NSStringFromClass(NavigationBarListView.self))
        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension NavigationBarListView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return NavigationBarCell.navigationBarCellInit(tableView: tableView, identifier: NSStringFromClass(NavigationBarCell.self), indexPath: indexPath)
    }
    
}





