
//
//  NavigationBarListView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit



protocol NavigationBarListViewDelegate : NSObjectProtocol {

    func navigationBarListViewClickCell(_ tableView : UITableView, indexPath : IndexPath, model : AnyObject) -> Void
}

extension NavigationBarListViewDelegate {
    
    func navigationBarListViewClickCell(_ tableView : UITableView, indexPath : IndexPath, model : AnyObject) -> Void {}
}

class NavigationBarListView: UITableView, UITableViewDataSource, UITableViewDelegate {

    
    public var datas : [Any]  {
        didSet {
            reloadData()
        }
    }
    
    
    public var navigationBarListViewDelegate : NavigationBarListViewDelegate? = nil
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        datas = []
        super.init(frame: frame, style: style)
        register(NavigationBarCell.self, forCellReuseIdentifier: NSStringFromClass(NavigationBarCell.self))
        dataSource = self
        delegate   = self
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

extension NavigationBarListView {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        navigationBarListViewDelegate?.navigationBarListViewClickCell(self, indexPath: indexPath, model: datas[indexPath.row] as AnyObject)
    }
    
    
}

extension NavigationBarListView {
    
    
    public func navigationBarListViewDelegate(delegate : NavigationBarListViewDelegate? = nil) -> Self {
        navigationBarListViewDelegate = delegate
        return self
    }
    
    
    convenience init(delegate : NavigationBarListViewDelegate? = nil, frame: CGRect = CGRect.zero, style: UITableViewStyle = .plain) {
        self.init(frame: frame, style: style)
        self.navigationBarListViewDelegate = delegate;
    }
    
}





