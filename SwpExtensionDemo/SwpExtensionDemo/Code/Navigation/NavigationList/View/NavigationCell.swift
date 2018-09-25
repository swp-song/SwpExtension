//
//  NavigationBarCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationCell: DemoBaseCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - swift judgment
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension NavigationCell {
    
    
    @discardableResult func setDatas(_ datas: NSObject?) -> Self {
        guard let model      = datas as? NavigationModel else { return self }
        self.textLabel?.text = model.aTitle
        return self
    }
    
    @discardableResult func model(_ model: NSObject?) -> Self {
        return self.setDatas(model)
    }
    
}

