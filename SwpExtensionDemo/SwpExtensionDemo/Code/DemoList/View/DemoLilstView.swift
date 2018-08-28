
//
//  DemoLilstView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

// MARK: - DemoLilstView 协议
protocol DemoLilstViewDelegate : NSObjectProtocol {
    func demoLilstView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) -> Void
}

// MARK: - DemoLilstView 实现可选方法
private extension DemoLilstViewDelegate {
    func demoLilstView(_ tableView: UITableView, indexPath: IndexPath, model : AnyObject) { }
}


class DemoLilstView: UITableView, UITableViewDataSource, UITableViewDelegate {

    
    /// 定义一个点击 cell 闭包数据类型
    typealias DemoLilstViewClickCell = (_ tableView : UITableView, _ indexPath : IndexPath, _ model : AnyObject) -> Void
    
    /// 数据源
    public var datas : [DemoModel] {
        
        didSet {
            reloadData()
        }
    }
    
    /// 代理属性
    weak public var demoLilstViewDelegate  : DemoLilstViewDelegate?
    
    /// 回调闭包
    public var demoLilstViewClickCell : DemoLilstViewClickCell?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        datas = []
        super.init(frame: frame, style: style)
        self.register(DemoCell.self, forCellReuseIdentifier: NSStringFromClass(DemoCell.self))
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

// MARK: - Public Methods Extension
extension DemoLilstView {
    
    public convenience init(_ delegate : DemoLilstViewDelegate?, frame: CGRect = CGRect.zero, style: UITableViewStyle = .plain) {
        self.init(frame: frame, style: style)
        self.demoLilstViewDelegate = delegate;
    }
    
   public func datas(datas : [DemoModel]) -> Self {
        self.datas = datas
        return self
    }
    
    public func demoLilstViewDelegate(delegate : DemoLilstViewDelegate?) -> Self {
        self.demoLilstViewDelegate = delegate
        return self
    }
    
    public func demoLilstViewClickCell(demoLilstViewClickCell : @escaping DemoLilstViewClickCell) -> Self {
        self.demoLilstViewClickCell = demoLilstViewClickCell
        return self
    }
}

// MARK: - UITableView Data Source Methods Extension
extension DemoLilstView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         return DemoCell.demoCellInit(tableView: tableView, identifier: NSStringFromClass(DemoCell.self), indexPath: indexPath).model(model: datas[indexPath.row])
    }
}

// MARK: - UITableView Data Source Methods Extension
extension DemoLilstView {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        demoLilstViewClickCell?(self, indexPath, datas[indexPath.row])
        
        demoLilstViewDelegate?.demoLilstView(self, indexPath: indexPath, model: datas[indexPath.row])
    }
}

