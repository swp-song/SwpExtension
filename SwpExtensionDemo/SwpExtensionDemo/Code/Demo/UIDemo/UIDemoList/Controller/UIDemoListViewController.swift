
//
//  UIDemoListViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/10/12.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

//import SwpExtension

class UIDemoListViewController: DemoListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
//        self.swp.barBackgroundColor = UIColor.orange
        self.navigationController?.navigationBar.swp.backgroundColor = UIColor.red
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

extension UIDemoListViewController {
    
    override func config() {
        super.config()
    }
    
    override func configDatas() {
        super.configDatas()
        self.demoList.datas(readDatas("UIDemoModel.plist"))
    }
    
    override func configClosure() {
        
        self.demoList.clickCellEvent { [weak self] (tableView, indexPath, model) in
            print(#function)
            guard let aClaas = ((model as? DemoListModel)?.aClass) as? EXBaseViewController.Type else { return }
            self?.navigationController?.pushViewController(aClaas.init(), animated: true);
        }
    }
    
}


