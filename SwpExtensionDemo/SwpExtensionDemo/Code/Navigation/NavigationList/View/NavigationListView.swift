
//
//  NavigationBarListView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit



protocol NavigationListViewDelegate : NSObjectProtocol {

    func navigationListViewClickCell(_ tableView : UITableView, indexPath : IndexPath, model : AnyObject) -> Void
    
    func navigationListViewScrollDidScroll(_ tableView : UITableView, scrollView : UIScrollView) -> Void
}

extension NavigationListViewDelegate {
    
    func navigationBarListViewClickCell(_ tableView : UITableView, indexPath : IndexPath, model : AnyObject) -> Void { }
    func navigationBarListViewScrollDidScroll(_ tableView : UITableView, scrollView : UIScrollView) -> Void { }
}


class NavigationListView: UITableView, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    
    public var datas : [NavigationModel] {
        didSet {
            reloadData()
        }
    }
    
    
    weak public var navigationListViewDelegate : NavigationListViewDelegate? = nil
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        datas = []
        super.init(frame: frame, style: style)
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
        return (NavigationCell.cellInit(tableView, identifier: NSStringFromClass(NavigationCell.self), indexPath: indexPath) as! NavigationCell).model(nil);
    }
}

extension NavigationListView {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        navigationListViewDelegate?.navigationListViewClickCell(self, indexPath: indexPath, model: datas[indexPath.row] as AnyObject)
    }
}

extension NavigationListView {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationListViewDelegate?.navigationBarListViewScrollDidScroll(self, scrollView: scrollView)
    }
    
}

extension NavigationListView {
    
    
    public func navigationBarListViewDelegate(delegate : NavigationListViewDelegate? = nil) -> Self {
        navigationListViewDelegate = delegate
        return self
    }
    
    
    convenience init(delegate : NavigationListViewDelegate? = nil, frame: CGRect = CGRect.zero, style: UITableViewStyle = .plain) {
        self.init(frame: frame, style: style)
        self.navigationListViewDelegate = delegate;
    }
    
}





