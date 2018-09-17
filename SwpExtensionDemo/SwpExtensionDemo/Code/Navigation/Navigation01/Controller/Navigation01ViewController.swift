//
//  Navigation01ViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class Navigation01ViewController: DemoBaseViewController {

    
    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setUI()
        
        self.setData()
        
        self.controllerClosure()
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


// MARK: - Navigation01ViewController, Set UI Methods Extension
extension Navigation01ViewController {
    
    private func setUI() -> Void {
        self.setNavigationBar()
        self.setUpUI()
        self.setAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
    }
    
    private func setUpUI() -> Void {
        
    }
    
    private func setAutoLayout() -> Void {
        
    }
}

// MARK: - Navigation01ViewController, Set Data Method Extension
extension Navigation01ViewController {
    
    private func setData() -> Void {
        
    }
}

// MARK: - Navigation01ViewController, Closure (Blocks) Methods Extension
extension Navigation01ViewController {
    
    private func controllerClosure() -> Void {
        
    }
}

// MARK: - Navigation01ViewController, Delegate Methods Extension
extension UITextFieldViewController {
    
}
