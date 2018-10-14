//
//  DemoTableView.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class DemoTableView: EXBaseTableView {
    
    
    var tts : String = ""
    
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

extension DemoTableView {
    
    override func configTableView() {
        super.configTableView()
        self.register(DemoCell.self, forCellReuseIdentifier: NSStringFromClass(DemoCell.self))
        self.dataSource = self
        self.delegate   = self
    }
}

extension DemoTableView : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DemoCell.initCell(tableView, identifier: NSStringFromClass(DemoCell.self), indexPath: indexPath).model(self.datas[indexPath.row])
    }
    
}

extension DemoTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.exTableViewClickCellEvent?(self, indexPath, self.datas[indexPath.row])
        self.exDelegate?.tableView(self, didSelectRowAt: indexPath, model: self.datas[indexPath.row])
    }
    
}

extension DemoTableView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.exTableViewllDidScroll?(self)
        self.exDelegate?.scrollViewDidScroll(self)
    }
}


