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
        button.setImage(UIImage(named: "button_icon"), for: .normal)
//        button.setTitle("123", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
        button.swpTitle("123", for: .normal).swpTitleColor(UIColor.black, for: .normal).swpImage(UIImage(named: "button_icon"), for: .normal).swpImageEdge(imageEdge: .top)

        
        self.button.snp.makeConstraints { (make) in
//            make.top.left.right.equalTo(UIEdgeInsetsMake(100, 0, 0, 0))
            make.top.left.equalTo(UIEdgeInsetsMake(100, 30, 0, 0))
//            make.width.equalTo(self.button.snp.height).multipliedBy(10)
            make.width.height.equalTo(CGSize(width: 100, height: 50))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    deinit {
        print(#function)
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


