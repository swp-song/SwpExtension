
//
//  UINavigation1ViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/10/14.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class UINavigation1ViewController: DemoViewController {

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

extension UINavigation1ViewController {
    
    override func configDatas() {
        super.configDatas()
        self.demoTableView.datas(DemoListModel.defaultModels(30))
    }
    
    override func configClosure() {
        super.configClosure()
    }
    
}

