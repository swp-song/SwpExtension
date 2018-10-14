
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
        self.swp.barBackgroundColor = UIColor.orange;
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
        
        self.demoTableView.exTableViewllDidScroll { [weak self] (_ tableView) in
            
            let offsetY = tableView.contentOffset.y
            if offsetY > self?.swp.barHeight ?? 44 {
//                self?.changeNavigationBarBackgroundAlpha(false)
//                self?.swp.barBackgroundAlpha = 0
                self?.navigationController?.navigationBar.swp.alpha = 0
                print(123)
            } else {
//                self?.changeNavigationBarBackgroundAlpha(true)
//                self?.swp.barBackgroundAlpha = 1
                self?.navigationController?.navigationBar.swp.alpha = 1
                print(456)
            }
            
        }
    }
    
    private func changeNavigationBarBackgroundAlpha(_ isAlpha : Bool) {
        UIView.animate(withDuration: 0.8, animations: { [weak self] in
            self?.navigationController?.navigationBar.swp.alpha = isAlpha ? 1 : 0
        })
    }
    
}
