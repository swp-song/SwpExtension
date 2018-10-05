//
//  EXBaseTableView.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class EXBaseTableView: UITableView {
    
    
    var datas : [NSObject] {
        didSet { reloadData() }
    }
    
    weak var exDelegate : EXTableViewProtocol? = nil;
    
    override init(frame: CGRect, style: UITableView.Style) {
        self.datas = []
        super.init(frame: frame, style: style)
        self.configTableView()
        
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

extension EXBaseTableView {
    
    
    
    @discardableResult func datas(_ datas : [NSObject]) -> Self {
        self.datas = datas
        return self
    }
}

@objc extension EXBaseTableView {
    
    func configTableView() -> Void {
        
    }
    
//    @discardableResult func exDelegate(_ deleage : EXTableViewProtocol?) -> Self {
//        self.exDelegate = deleage;
//        return self;
//    }
    
    func test(_ a : EXTableViewProtocol) -> Self {
        self.exDelegate = a
        return self
    }
    
}

