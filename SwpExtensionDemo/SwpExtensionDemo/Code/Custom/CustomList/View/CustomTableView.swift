//
//  CustomTableView.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/12.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

protocol CustomTableViewDelegate : NSObjectProtocol {
 
    func customTableViewScrollDidScroll(_ scrollView : UIScrollView) -> Void
}

extension CustomTableViewDelegate {
    
    func customTableViewScrollDidScroll(_ scrollView : UIScrollView) -> Void { }
}

class CustomTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var datas : [AnyObject] {
        didSet {
            reloadData()
        }
    }
    
    weak var customDelegate : CustomTableViewDelegate? = nil
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        datas = []
        super.init(frame: frame, style: style)
        
        dataSource  = self
        delegate    = self
        register(CustomCell.self, forCellReuseIdentifier: NSStringFromClass(CustomCell.self))
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


extension CustomTableView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CustomCell.customCellInit(tableView: tableView, identifier: NSStringFromClass(CustomCell.self), indexPath: indexPath)
    }
    
}

extension CustomTableView {
    
    public func customDelegate(_ delegate : CustomTableViewDelegate? = nil) -> Self {
        customDelegate = delegate
        return self
    }
}

extension CustomTableView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customDelegate?.customTableViewScrollDidScroll(scrollView)
    }
}
