
//
//  DemoBaseCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoBaseCell: UITableViewCell {

    
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
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configCell()
    }
    

}


extension DemoBaseCell {
    
    @discardableResult open func setDatas(_ datas : NSObject?) -> Self {
        guard let _ = model else { return self }
        return self
    }
}

extension DemoBaseCell {
    
    
    public static func cellInit(_ tableView : UITableView, identifier : String, indexPath : IndexPath) -> DemoBaseCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DemoBaseCell
    }
    
    open func configCell() -> Void {
        
    }
    
    open func setUpUI() -> Void {
    
    }
    
    open func setUIAutoLayout() -> Void {
        
    }
    
    open func model(_ model : NSObject?) -> Self {
        self.model = model
        return self
    }
    
}

