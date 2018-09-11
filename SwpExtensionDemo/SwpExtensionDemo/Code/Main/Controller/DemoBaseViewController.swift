//
//  DemoBaseViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/10.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

import SnapKit

import SwpExtension

class DemoBaseViewController: UIViewController {

    
//    lazy var navigationBar : UINavigationBar = UINavigationBar()
    lazy var navigationBar : UIView = UIView()
    
    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = UIColor.white
        
        
        self.setUI()
        
        self.setData()
        
        self.controllerClosure()
        
//        self.navigationController?.navigationBar.swp.backgroundColor = UIColor.red
        
//        navigationBar.swp.backgroundColor = UIColor.orange
        
//        print(navigationBar.swp.height);
        
//        navigationBar.barTintColor = UIColor.red
        
//        navigationBar.bounds = (self.navigationController?.navigationBar.bounds)!
//        navigationBar = (self.navigationController?.navigationBar)!
//        navigationBar.isHidden = false
//        view.backgroundColor = UIColor.white
//        navigationBar.frame = CGRect(x: 0, y: 0, width: UIScreen.swp.width, height: 88)
//        navigationBar.backgroundColor = UIColor.red
//        view.addSubview(navigationBar)
        
//          view.addSubview(navigationBar)
//        navigationBar.frame = (self.navigationController?.navigationBar.frame)!
//        navigationBar.barTintColor = UIColor.red
//        navigationBar.swp.backgroundColor = UIColor.red
    }
    
    ///
    /// # viewWillAppear ( 将要加载出视图调用 )
    /// - Parameter animated: animated
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    ///
    /// # viewDidAppear ( 视图显示窗口时调用 )
    /// - Parameter animated: animated
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    ///
    /// # viewWillDisappear ( 视图即将消失, 被覆盖, 隐藏时调用 )
    /// - Parameter animated: animated
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    ///
    /// # viewDidDisappear  ( 视图已经消失, 被覆盖, 隐藏时调用 )
    /// - Parameter animated:
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    /// didReceiveMemoryWarning ( 内存不足时调用 )
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


// MARK: - DemoBaseViewController, Set UI Methods Extension
extension DemoBaseViewController {
    
    private func setUI() -> Void {
        self.setNavigationBar()
        self.setUpUI()
        self.setAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
        
    }
    
    private func setUpUI() -> Void {
//        view.addSubview(navigationBar)
    }
    
    private func setAutoLayout() -> Void {
        
    }
}

// MARK: - DemoBaseViewController, Set Data Method Extension
extension DemoBaseViewController {
    
    private func setData() -> Void {
        
    }
}

// MARK: - DemoBaseViewController, Closure (Blocks) Methods Extension
extension DemoBaseViewController {
    
    private func controllerClosure() -> Void {
        
    }
}

// MARK: - DemoBaseViewController, Delegate Methods Extension
extension UITextFieldViewController {
    
}
