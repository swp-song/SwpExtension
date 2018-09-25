//
//  NavigationBarCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationCell: DemoBaseCell {
    
    override var model: NSObject? {
        didSet { self.setDatas(model) }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension NavigationCell {
    
    @discardableResult func setDatas(_ datas: NSObject?) -> Self {
        guard let model = datas as? NavigationModel else { return self }
        self.textLabel?.text = model.aTitle
        return self
    }
    
    @discardableResult public func model(_ model : NavigationModel) -> Self {
        return setDatas(model)
    }
}

