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
        
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "<<", style: .done, target: nil, action:nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "<<", style: .done, target: nil, action:nil)
        self.navigationItem.title = "12312312"
        
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
        
        let offsetY = scrollView.contentOffset.y
        // 向上滑动的距离
        let scrollUpHeight = offsetY - 0
        // 除数表示 -> 导航栏从完全不透明到完全透明的过渡距离
        let progress = scrollUpHeight / CGFloat(88)
        if (offsetY > 0)
        {
            if (scrollUpHeight > CGFloat(88)) {
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    self?.setNavigationBarTransformProgress(progress: 1)
                })
//                setNavigationBarTransformProgress(progress: 1)
            }
//            else {
//                setNavigationBarTransformProgress(progress: progress)
//            }
        }
        else
        {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.setNavigationBarTransformProgress(progress: 0)
            })
//            self.setNavigationBarTransformProgress(progress: 0)
        }
        
    }
    
    
    // private
    func setNavigationBarTransformProgress(progress:CGFloat) {
        navigationController?.navigationBar.swp.translationY = -CGFloat(44) * progress
        // 没有系统返回按钮，所以 hasSystemBackIndicator = false
        // 如果这里不设置为false，你会发现，导航栏无缘无故多出来一个返回按钮
        navigationController?.navigationBar.swp.backgroundItemsAlpha(1 - progress, isAlphaItems: true)
//        wr_setBarButtonItemsAlpha(alpha: 1 - progress, hasSystemBackIndicator: false)
    }
    
}
