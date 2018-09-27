
//
//  DemoListViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoListViewController: EXBaseViewController {

    
    let demoList = DemoListView()
    
    var datas : [DemoListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let demo = DemoListModel()
    
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DemoListViewController {

    override func configUI() {
    
        self.view.addSubview(self.demoList)
    }
    
    override func configUIAutoLayout() {
        
        self.demoList.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }
    
}

extension DemoListViewController {
    
    override func configDatas() {
        
        let datas : [[String : Any]]? = NSArray(contentsOfFile: Bundle.main.path(forResource: "DemoModel.plist", ofType: nil) ?? "") as? [[String : Any]]
        self.datas = DemoListModel.demos(datas)
        self.demoList.datas = self.datas
    }
    
}
