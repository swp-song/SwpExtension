
//
//  DemoLilstView.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit



public protocol DemoLilstViewDelegate : NSObjectProtocol {
    
    func demoLilstView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, model : AnyObject) -> Void
}





class DemoLilstView: UITableView, UITableViewDataSource, UITableViewDelegate {

    
    public var datas : [DemoModel] {
        
        didSet {
            reloadData()
        }
    }
    
    public var demoLilstViewDelegate : DemoLilstViewDelegate?
    
    
    
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

extension DemoLilstView {
    
   public func datas(datas : [DemoModel]) -> Self {
        self.datas = datas
        return self
    }
    
    public func demoLilstViewDelegate(delegate : DemoLilstViewDelegate?) -> Self {
        self.demoLilstViewDelegate = delegate
        return self
    }
}


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


extension DemoLilstView {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        
//        let model = datas[indexPath.row]
//        print(model.aClass ?? AnyClass.self)
//        let aClass = model.aClass as? UIViewController.Type
        demoLilstViewDelegate?.demoLilstView(self, didSelectRowAt: indexPath, model: datas[indexPath.row])
    }
}

extension DemoLilstViewDelegate {
    
//    public func `self`() -> DemoLilstViewDelegate {
//        <#code#>
//    }
}

