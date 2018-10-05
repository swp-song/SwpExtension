
//
//  EXNavigationController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit

class EXNavigationController: UINavigationController {

    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension EXNavigationController {
    
}
