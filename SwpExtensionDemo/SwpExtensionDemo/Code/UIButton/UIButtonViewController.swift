//
//  UIButtonViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/22.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit


import SnapKit

class UIButtonViewController: DemoBaseViewController {

    
    lazy private var button : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        button.backgroundColor = UIColor.red
        
        button.snp.makeConstraints { [weak self] (make) in
            make.top.left.right.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
            print(self?.button.snp.height as Any)
//            make.width.equalTo(self!.button.snp.height).multipliedBy(10)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIButtonViewController {
    
    func add() -> Void {
        var views  : [UIButton] = []
        let titles : [String]   = ["Top (上)", "Left (左)", "Bottom (下)", "Right (右)"]
        
        titles.forEach { [weak self] (title) in
            let button : UIButton = UIButton()
            
            button.backgroundColor = UIColor.SwpColorRandom()
            views.append(button)
            self?.view.addSubview(button)
        }
        
    }
    
}


