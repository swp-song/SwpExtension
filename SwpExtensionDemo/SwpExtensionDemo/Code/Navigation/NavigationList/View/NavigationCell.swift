//
//  NavigationBarCell.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationCell: DemoBaseCell {

    
    
//    var model : NavigationModel? {
//        didSet {
//            guard let value = model else { return }
//            model(value)
//        }
//    }
    
    
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
    
    
    
    
    override func setUpUI() {
        super.setUpUI()
    }
    
    override func setUIAutoLayout() {
        super.setUIAutoLayout()
    }
    
    override func setDatas(_ datas: NSObject?) -> Self {
        super.setDatas(datas)

        return self
    }

    
}

extension NavigationCell {

    
    
//
//    override func setDatas(_ datas: NSObject?) -> Self {
//    }
//
//    @objc override func setDatas(_ datas: NSObject?) -> Self {
//        super.setDatas(datas)
//    }
    
//    @objc override func setDatas(_ datas: NSObject?) -> Self {
//
//        super.setDatas(datas)
//
////        let model = datas as! NavigationModel
//
////        self.textLabel?.text = model.aTitle
//
//        return self
//    }
    
//    override func setDatas(_ datas: NSObject?) -> Self {
//
//        return self
//    }
    
//    override func setUpUI() {
//        super.setUpUI()
//    }
    
    
//    cellInit
//    static func cellInit
//    public static func navigationCellInit(tableView : UITableView, identifier : String, indexPath : IndexPath) -> NavigationCell {
//        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NavigationCell
//    }
//
//
//
//    @discardableResult public func model(_ model : NavigationModel) -> Self {
//
//        self.textLabel?.text = model.aTitle
//        return self
//    }
//
    
}

