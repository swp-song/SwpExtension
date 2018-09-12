//

//  CustomCell.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/12.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


// MARK: - Public Methods Extension
extension CustomCell {
    
    public static func customCellInit(tableView : UITableView, identifier : String, indexPath : IndexPath) -> CustomCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomCell
    }
    
//    public func model(model : DemoModel?) -> Self {
//        self.model = model
//        return self
//    }
    
}
