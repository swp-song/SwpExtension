//
//  CustomListViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/9/12.
//  Copyright © 2018年 swp-song. All rights reserved.
//


import UIKit

class CustomListViewController: DemoBaseViewController, CustomTableViewDelegate {

    
    
    private lazy var customTableView : CustomTableView = CustomTableView()
    
    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setUI()
        
        self.setData()
        
        self.controllerClosure()
        
        customTableView.customDelegate = self
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


// MARK: - CustomListViewController, Set UI Methods Extension
extension CustomListViewController {
    
    private func setUI() -> Void {
        self.setNavigationBar()
        self.setUpUI()
        self.setAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
    }
    
    private func setUpUI() -> Void {
        
        view.addSubview(customTableView)
    }
    
    private func setAutoLayout() -> Void {
        
        customTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}

// MARK: - CustomListViewController, Set Data Method Extension
extension CustomListViewController {
    
    private func setData() -> Void {
        
        var datas : [Any] = []
        
        for i in 0 ..< 25 {
            datas.append(String(i))
        }
        
        customTableView.datas = datas as [AnyObject]
    }
}

// MARK: - CustomListViewController, Closure (Blocks) Methods Extension
extension CustomListViewController {
    
    private func controllerClosure() -> Void {
        
    }
}

// MARK: - CustomListViewController, Delegate Methods Extension
extension CustomListViewController {

    func customTableViewScrollDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
