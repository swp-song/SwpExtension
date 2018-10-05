//
//  DemoListView.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class DemoListView: EXBaseTableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
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

extension DemoListView {
    
    override func configTableView() {
        super.configTableView()
        self.register(DemoListCell.self, forCellReuseIdentifier: NSStringFromClass(DemoListCell.self))
        self.dataSource = self
        self.delegate   = self
    }
    
    override func test(_ a: EXTableViewProtocol) -> Self {
        super.test(a)
        return self
    }
    
}

extension DemoListView : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return DemoListCell.initCell(tableView, identifier: NSStringFromClass(DemoListCell.self), indexPath: indexPath).model(self.datas[indexPath.row])
    }
    
}

extension DemoListView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.exDelegate?.tableView(self, didSelectRowAt: indexPath, model: self.datas[indexPath.row])
    }
    
}


