//
//  DemoCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {
    
    
    
    public var model : DemoModel? {
        didSet {
            setDatas(model: model)
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
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func demoCellInit(tableView : UITableView, identifier : String, indexPath : IndexPath) -> DemoCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DemoCell
    }
    
    
    private func setDatas(model : DemoModel?) {
        self.textLabel?.text = model?.aTitle
    }
    
    
    public func model(model : DemoModel?) -> Self {
        self.model = model
        return self
    }

}
