//
//  UITextFieldViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/8/23.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class UITextFieldViewController: DemoBaseViewController {

    
    private lazy var textField1 : DDD = {
        return DDD()
        .swp.textColor(UIColor.red)
        .swp.text("123213")
        .swp.font(UIFont.systemFont(ofSize: 12))
        .swp.keyboardType(.default)
        .swp.isSecureTextEntry(true)
        .swp.clearButtonMode(.whileEditing)
        .swp.leftImage(#imageLiteral(resourceName: "account"))
        .swp.placeholder("123")
        .swp.placeholderStyle(UIColor.orange, font: UIFont.systemFont(ofSize: 20))
//        return DDD(textColor: UIColor.red)
        }()
    
    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        
        
        setData()
        
//        self.textField1.keyboardType
        
    }
    
    ///
    /// # viewWillAppear, ( 将要加载出视图调用 )
    /// - Parameter animated: animated
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    ///
    /// # viewDidAppear, ( 视图显示窗口时调用 )
    /// - Parameter animated: animated
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    ///
    /// # viewWillDisappear, ( 视图即将消失, 被覆盖, 隐藏时调用 )
    /// - Parameter animated: animated
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    ///
    /// # viewDidDisappear, ( 视图已经消失, 被覆盖, 隐藏时调用 )
    /// - Parameter animated: animated
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    /// # didReceiveMemoryWarning, ( 内存不足时调用 )
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


// MARK: - UITextFieldViewController, Set UI Methods Extension
extension UITextFieldViewController  {
    
    private func setUI() -> Void {
        setNavigationBar()
        setUpUI()
        setAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
    }
    
    private func setUpUI() -> Void {
        
        view.addSubview(textField1)
    }
    
    private func setAutoLayout() -> Void {
        
        textField1.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(UIEdgeInsetsMake(100, 20, 0, 20))
            make.width.equalTo(self.textField1.snp.height).multipliedBy(8)
        }
        
        textField1.frame = CGRect(x: 0, y: 100, width: 300, height: 100)
        textField1.swp.x(100.0)
        textField1.backgroundColor = UIColor.SwpColorRandom()
    }
    

    
}

// MARK: - UITextFieldViewController, Set Data Method Extension
extension UITextFieldViewController {
    private func setData() -> Void {

    }
}

// MARK: - UITextFieldViewController, Closure ( Block ) Methods Extension
extension UITextFieldViewController {
    
    private func controllerClosure() -> Void {
        
    }
}

// MARK: - UITextFieldViewController, Delegate Methods Extension
extension UITextFieldViewController {
    
}
