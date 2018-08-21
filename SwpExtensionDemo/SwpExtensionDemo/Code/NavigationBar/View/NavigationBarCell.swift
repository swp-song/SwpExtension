//
//  NavigationBarCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationBarCell: UITableViewCell {

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
    
    
}


extension NavigationBarCell {
    
    public static func navigationBarCellInit(tableView : UITableView, identifier : String, indexPath : IndexPath) -> NavigationBarCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NavigationBarCell
    }
    
}

