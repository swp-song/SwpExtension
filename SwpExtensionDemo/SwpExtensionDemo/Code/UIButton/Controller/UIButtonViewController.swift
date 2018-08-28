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

    
//    lazy private var button : UIButton = UIButton(UIColor.orange, title: "123", titleColor: UIColor.black, size: 15, radius: 0, tag: 0, target: self, action: #selector(clickButton), events: .touchUpInside)
    
    lazy private var button : UIButton = UIButton(UIColor.cyan, title: "222", titleColor: UIColor.blue, titleFont: UIFont.systemFont(ofSize: 12), radius: 0, tag: 0, target: self, action: #selector(clickButton), events:.touchUpInside)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        view.addSubview(button)
//        button.backgroundColor = UIColor.red
        button.swp.image(UIImage(named: "button_icon"), for: .normal)
        
//        button
//            .swp.title("123", for: .normal)
//            .swp.titleColor(UIColor.black, for: .normal)
//            .swp.image(UIImage(named: "button_icon"), for: .normal)
//            .swp.targetEvent(self, action: #selector(clickButton), for: .touchUpInside)
//            .swp.imageEdge(.top)
        

        
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
    
    @objc func clickButton(button : UIButton) -> Void {
        
        let edges  = [UIButton.swp.ImageEdge.bottom, UIButton.swp.ImageEdge.left, UIButton.swp.ImageEdge.bottom, UIButton.swp.ImageEdge.right]
        let index : Int  = randomIntNumber(lower: 0, upper: edges.count)
        button.swp.imageEdge(edges[index])
//        button.swp.imageEdge(.left)
        
//        let image : UIImage? = self.view.swp.screenshots;
//
//        print(image as Any)
    }
    
    public func randomIntNumber(lower: Int = 0,upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }
}

extension UIButtonViewController {
    
    func add() -> Void {
        var views  : [UIButton] = []
        let titles : [String]   = ["Top (上)", "Left (左)", "Bottom (下)", "Right (右)"]
        
        titles.forEach { [weak self] (title) in
            let button : UIButton = UIButton()
            button.backgroundColor = UIColor.swp.colorRandom()
            views.append(button)
            self?.view.addSubview(button)
        }
        
    }
    
}


