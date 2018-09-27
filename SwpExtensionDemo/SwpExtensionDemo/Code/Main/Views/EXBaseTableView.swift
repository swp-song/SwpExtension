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
        didSet { reloadData()}
    }
    
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


@objc extension EXBaseTableView {
    
    func configTableView() -> Void {
        
    }
    
    func datas(_ datas : [NSObject]) -> Self {
        self.datas = datas
        return self
    }
    
}

