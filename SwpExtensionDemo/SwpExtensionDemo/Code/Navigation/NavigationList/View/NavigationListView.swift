
//
//  NavigationBarListView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit


class NavigationListView: DemoBaseTableView, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    
//    public var datas : [NavigationModel] {
//        didSet {
//            reloadData()
//        }
//    }
    
    
    weak public var navigationListViewDelegate : DemoBaseTableViewDelegate? = nil
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        datas = []
        register(NavigationCell.self, forCellReuseIdentifier: NSStringFromClass(NavigationCell.self))
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

extension NavigationListView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (NavigationCell.cellInit(tableView, identifier: NSStringFromClass(NavigationCell.self), indexPath: indexPath) as! NavigationCell).model(datas[indexPath.row]);
    }
}

extension NavigationListView {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationListViewDelegate?.navigationListViewClickCell(self, indexPath: indexPath, model: datas[indexPath.row] as AnyObject)
    }
}

extension NavigationListView {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        navigationListViewDelegate?.navigationBarListViewScrollDidScroll(self, scrollView: scrollView)
    }
}

extension NavigationListView {
    
    
//    public func navigationBarListViewDelegate(delegate : NavigationListViewDelegate? = nil) -> Self {
//        navigationListViewDelegate = delegate
//        return self
//    }
//

    

    convenience init(delegate : DemoBaseTableViewDelegate? = nil, frame: CGRect = CGRect.zero, style: UITableView.Style = .plain) {
        self.init(frame: frame, style: style)
        self.navigationListViewDelegate = delegate;
    }
    
    
    
}





