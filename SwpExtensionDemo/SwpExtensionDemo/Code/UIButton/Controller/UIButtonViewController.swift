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
    
//    private lazy var checkBox : UIButton = UIButton.swp.init(#imageLiteral(resourceName: "check_box_no"), selectedImage: #imageLiteral(resourceName: "check_box_sel"), title: "点击", target: self, action: #selector(checkBoxEvent), titleColor: UIColor.red, titleFont: UIFont.systemFont(ofSize: 15)).swp
    
    private lazy var button : UIButton = UIButton.swp.styleInit(UIColor.swp.randomColor(), title: "123", target: self, action: #selector(clickButton), titleColor: UIColor.swp.randomColor(), titleFont: UIFont.systemFont(ofSize: 15), radius: 5, tag: 0, events: .touchUpInside)
    
    private lazy var checkBox : UIButton = UIButton.swp.styleCheckBoxInit(#imageLiteral(resourceName: "check_box_no"), selectedImage: #imageLiteral(resourceName: "check_box_sel"), title: "点击", target: self, action: #selector(checkBoxEvent), titleColor: UIColor.red, titleFont: UIFont.systemFont(ofSize: 15))
    
    private lazy var qrImageView : UIImageView = UIImageView()
    
    private lazy var barImageView : UIImageView = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(button)
        view.addSubview(checkBox)
        view.addSubview(qrImageView)
        view.addSubview(barImageView)
        checkBox.swp.backgroundColor(UIColor.cyan)
        
        button.swp.image(UIImage(named: "button_icon"), for: .normal)
        
        self.button.snp.makeConstraints { (make) in
//            make.top.left.right.equalTo(UIEdgeInsetsMake(100, 0, 0, 0))
            make.top.left.equalTo(UIEdgeInsetsMake(100, 30, 0, 0))
//            make.width.equalTo(self.button.snp.height).multipliedBy(10)
            make.width.height.equalTo(CGSize(width: 100, height: 50))
        }
        
        self.checkBox.snp.makeConstraints { (make) in
            make.top.equalTo(self.button.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-10)
//            make.right.equalTo(self.view).offset(20)
            make.size.equalTo(CGSize(width: 80, height: 50))
//            make.height.equalTo(50)
        }
        
        self.qrImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        self.qrImageView.swp.backgroundColor(UIColor.red)
        
        self.barImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(UIEdgeInsetsMake(0, 20, 0, 20))
            make.top.equalTo(self.qrImageView.snp.bottom).offset(10)
            make.width.equalTo(self.barImageView.snp.height).multipliedBy(6)
        }
        
        self.barImageView.swp.backgroundColor(UIColor.red)
        
        
//        checkBox.swp.imageEdge(.right)
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
//        button.swp.imageEdge(.left)
        
//        let image : UIImage? = self.view.swp.screenshots;
//
//        print(image as Any)
        
//        let image = UIImage.swp.screenshots(self.view)
//        print(image)
//
//        let image1 = UIImage.swp.screenshotsFull
//        print(image1 as Any)
        
//        let i1 = UIImage(color: UIColor.orange)
//        let i2 = UIColor.cyan.swp.image(CGRect(x: 0, y: 0, width: 35, height: 35))
        
        let image = UIImage.swp.QRCodeImage("12312312", size: 200, qrColor: UIColor.orange, bgColor: UIColor.cyan)
//        let image : UIImage? = UIImage.swp.qrCodeImage("12312312", icon: i2!)
//        print(image as Any)
        self.qrImageView.image = image
        
        let barImage = UIImage.swp.barCodeImage("123", size: CGSize(width: self.barImageView.swp.width, height: self.barImageView.swp.height))
        
        self.barImageView.image = barImage
    
//        let i = UIView.swp.screenshotsFull
//        print(i as Any)
    }
    
    @objc private func checkBoxEvent(button : UIButton) -> Void {
        button.isSelected = !button.isSelected
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
            button.backgroundColor = UIColor.swp.randomColor()
            views.append(button)
            self?.view.addSubview(button)
        }
        
    }
    
}


