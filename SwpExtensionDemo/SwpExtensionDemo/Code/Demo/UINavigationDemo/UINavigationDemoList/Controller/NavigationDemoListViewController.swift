//
//  NavigationDemoListViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/10/12.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationDemoListViewController: DemoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension NavigationDemoListViewController {
    
    override func configDatas() {
        self.demoTableView.datas(readDatas("NavigationDemoListModel.plist"))
    }
    
    override func configClosure() {
        self.demoTableView.exTableViewClickCellEvent { [weak self] (tableView, indexPath, model) in
            guard let aClaas = ((model as? DemoListModel)?.aClass) as? EXBaseViewController.Type else { return }
            self?.navigationController?.pushViewController(aClaas.init(), animated: true);
        }
    }
    
}
