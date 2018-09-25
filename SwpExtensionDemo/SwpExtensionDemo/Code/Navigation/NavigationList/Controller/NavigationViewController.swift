//
//  NavigationViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationViewController: DemoBaseViewController {

    
    
    private lazy var navigationListView : NavigationListView = NavigationListView()
    
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


// MARK: - NavigationViewController, Set UI Methods Extension
extension NavigationViewController {
    
    private func setUI() -> Void {
        self.setNavigationBar()
        self.setUpUI()
        self.setAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
    }
    
    private func setUpUI() -> Void {
        
        self.view.addSubview(self.navigationListView)
    }
    
    private func setAutoLayout() -> Void {
        
        self.navigationListView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
        
    }
}

// MARK: - NavigationViewController, Set Data Method Extension
extension NavigationViewController {
    
    private func setData() -> Void {
        let datas = NSArray(contentsOfFile: Bundle.main.path(forResource: "NavigationModel.plist", ofType: nil) ?? "") as! [[String : Any]]
        self.navigationListView.datas = NavigationModel.datas(datas)
    }
}

// MARK: - NavigationViewController, Closure (Blocks) Methods Extension
extension NavigationViewController {
    
    private func controllerClosure() -> Void {
        
    }
}

// MARK: - NavigationViewController, Delegate Methods Extension
extension UITextFieldViewController {
    
}
