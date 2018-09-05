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

    

    
//    private lazy var button : UIButton = UIButton.swp.init(UIColor.swp.randomColor(), title: "123", target: self, action: #selector(clickButton), titleColor: UIColor.swp.randomColor(), titleFont: UIFont.systemFont(ofSize: 15), radius: 5, tag: 0, events: .touchUpInside).swp
    
    private lazy var button : UIButton = UIButton().swp.style(UIColor.swp.randomColor(), title: "123", target: self, action: #selector(clickButton), titleColor: UIColor.swp.randomColor(), titleFont: UIFont.systemFont(ofSize: 15), radius: 5, tag: 0, events: .touchUpInside)

    private lazy var checkBox : UIButton = UIButton().swp.checkBoxStyle(#imageLiteral(resourceName: "check_box_no"), selectedImage: #imageLiteral(resourceName: "check_box_sel"), title: "点击", target: self, action: #selector(checkBoxEvent), titleColor: UIColor.red, titleFont: UIFont.systemFont(ofSize: 15))

//
    private lazy var qrImageView : UIImageView = UIImageView()

    private lazy var barImageView : UIImageView = UIImageView()
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        return
        view.addSubview(button)
        view.addSubview(checkBox)
        view.addSubview(qrImageView)
        view.addSubview(barImageView)
//        checkBox.swp.backgroundColor(UIColor.cyan)
        
//        button.swp.image(UIImage(named: "button_icon"), for: .normal)
//        button.swp.timingButton()
        
        self.button.snp.makeConstraints { (make) in
            make.top.left.equalTo(UIEdgeInsetsMake(100, 30, 0, 0))
            make.width.height.equalTo(CGSize(width: 100, height: 50))
        }

        self.checkBox.snp.makeConstraints { (make) in
            make.top.equalTo(self.button.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-10)
            make.size.equalTo(CGSize(width: 80, height: 50))
        }
//
        self.qrImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }

        self.qrImageView.swp.backgroundColor(UIColor.red)

        self.barImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
            make.top.equalTo(self.qrImageView.snp.bottom).offset(10)
            make.height.equalTo(150)
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
    
    @objc private func clickButton(button : UIButton) -> Void {
        
        let edges  = [UIButton.swp.ImageEdge.bottom, UIButton.swp.ImageEdge.left, UIButton.swp.ImageEdge.bottom, UIButton.swp.ImageEdge.right]
        let index : Int  = randomIntNumber(lower: 0, upper: edges.count)
        button.swp.imageEdge(edges[index])
        button.swp.imageEdge(.left)
        
        self.qrImageView.image  = "aaaxxxeeedadasd".swp.qrCodeImage
        self.barImageView.image = "SN00000000002".swp.barCodeImage(textFont: UIFont.systemFont(ofSize: 20), textColor: UIColor.red)
        self.barImageView.swp.borderWidth(1)
        
        button.swp.timingButton()
        
    }
    
    @objc private func checkBoxEvent(button : UIButton) -> Void {
        button.isSelected = !button.isSelected
    }
    
    public func randomIntNumber(lower: Int = 0,upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }
}

extension UIButtonViewController {
    
//    func add() -> Void {
//        var views  : [UIButton] = []
//        let titles : [String]   = ["Top (上)", "Left (左)", "Bottom (下)", "Right (右)"]
//
//        titles.forEach { [weak self] (title) in
//            let button : UIButton = UIButton()
//            button.backgroundColor = UIColor.swp.randomColor()
//            views.append(button)
//            self?.view.addSubview(button)
//        }
//
//    }
    
}


