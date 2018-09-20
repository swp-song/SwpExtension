
//
//  DemoBaseCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit


class DemoBaseCell: UITableViewCell, DemoBaseCellProtocol {

    
    var model : NSObject? {
        didSet {
            self.setDatas(model)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - swift judgment
    #if swift (>=4.2)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    #else
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    #endif

    
    func configCell() -> Void {

    }

    func setUpUI() -> Void {

    }

    
    func setUIAutoLayout() -> Void {

    }
    
    @discardableResult func setDatas(_ datas : NSObject?) -> Self {
        guard let _ = model else { return self }
        return self
    }

}



extension DemoBaseCell {
    
//    @discardableResult open func setDatas(_ datas : NSObject?) -> Self {
//        guard let _ = model else { return self }
//        return self
//    }
    
    
}


extension DemoBaseCell {
    
    public static func cellInit(_ tableView : UITableView, identifier : String, indexPath : IndexPath) -> DemoBaseCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DemoBaseCell
    }
    
    public func model(_ model : NSObject?) -> Self {
        self.model = model
        return self
    }
}


