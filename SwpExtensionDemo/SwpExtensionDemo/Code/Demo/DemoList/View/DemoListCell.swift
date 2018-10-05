
//
//  DemoListCell.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class DemoListCell: EXBaseCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension DemoListCell {
    
    override func configDatas(_ data: NSObject?) -> Self {
        guard let model = data as? DemoListModel else { return self }
        self.textLabel?.text = model.aTitle
        return self
    }
    
}
