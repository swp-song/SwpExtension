
//
//  EXBaseCell.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class EXBaseCell: UITableViewCell {

    
    var model : NSObject? {
        didSet { self.configDatas(model) }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension EXBaseCell {
    
    func configCell() -> Void {
        
        self.configUI()
        
        self.configUIAutoLayout()
    }
    
    func configUI() -> Void {
        
    }
    
    func configUIAutoLayout() -> Void {
        
    }
    
}

@objc extension EXBaseCell {
    
    
    static func initCell(_ tableView : UITableView, identifier: String, indexPath : IndexPath) -> EXBaseCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! EXBaseCell
    }
    
    
    @discardableResult func configDatas(_ data : NSObject?) -> Self {
        guard let _ = data else { return self }
        return self
    }
    
    @discardableResult func model(_ data : NSObject?) -> Self {
        return self.configDatas(model)
    }
    
}
