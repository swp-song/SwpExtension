//
//  EXBaseTableView.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class EXBaseTableView: UITableView {
    
    
    typealias EXTableViewClickCallEvent     = (_ tableView : EXBaseTableView, _ indexPath : IndexPath, _ model : NSObject) -> Void
    typealias EXTableViewScrollChangeEvent  = (_ tableView : EXBaseTableView) -> Void
    
    var datas : [NSObject] {
        didSet { reloadData() }
    }
    
    var exTableViewClickCellEvent   : EXTableViewClickCallEvent?
    var exTableViewllDidScroll      : EXTableViewScrollChangeEvent?
    
    weak var exDelegate : EXTableViewProtocol?
    
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
    
    @discardableResult func exDelegate(_ delegate : EXTableViewProtocol) -> Self {
        self.exDelegate = delegate
        return self
    }
    
    @discardableResult func exTableViewClickCellEvent( _ block : EXTableViewClickCallEvent? ) -> Self {
        self.exTableViewClickCellEvent = block
        return self
    }
    
    @discardableResult func exTableViewllDidScroll(_ block : EXTableViewScrollChangeEvent?) -> Self {
        self.exTableViewllDidScroll = block
        return self
    }
    
}

@objc extension EXBaseTableView {
    
    func configTableView() -> Void {
        
    }
    
}

