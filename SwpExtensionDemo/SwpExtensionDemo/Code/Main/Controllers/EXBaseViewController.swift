//
//  EXBaseViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

import SnapKit
import SwpExtension

class EXBaseViewController: UIViewController {

    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.config()
        
//        self.navBarBarTintColor = .white;
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


// MARK: - EXBaseViewController, Set UI Methods Extension
@objc extension EXBaseViewController  {
    
    
    func config() -> Void {
        
        self.configNavigation()
        
        self.configUI()

        self.configUIAutoLayout()
        
        self.configDatas()
        
        self.configClosure()
        
    }
}

// MARK: - EXBaseViewController, Set Data Method Extension
@objc extension EXBaseViewController {
   
    func configNavigation() -> Void {
        
    }
    
    func configUI() -> Void {
        self.view.backgroundColor = UIColor.white
    }
    
    func configUIAutoLayout() -> Void {
        
    }
    
}

// MARK: - EXBaseViewController, Closure ( Block ) Methods Extension
@objc extension EXBaseViewController {
    
    func configDatas() -> Void {
        
    }
    
}

// MARK: - EXBaseViewController, Delegate Methods Extension
@objc extension EXBaseViewController {
    
    func  configClosure() -> Void {
        
    }
    
}
