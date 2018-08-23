//
//  NavigationBarViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class NavigationBarViewController: DemoBaseViewController, NavigationBarListViewDelegate {
    
    lazy var navigationBarListView : NavigationBarListView = NavigationBarListView(delegate : self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        
        setData()
        

        if #available(iOS 11.0, *) {
            navigationBarListView.contentInsetAdjustmentBehavior = .never
            navigationBarListView.estimatedRowHeight = 0
            navigationBarListView.estimatedSectionFooterHeight = 0
            navigationBarListView.estimatedSectionHeaderHeight = 0
        }
        
        
        navigationBarListView.backgroundColor = UIColor.orange
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.swpBackgroundColor = UIColor.clear
        navigationBarListViewScrollDidScroll(navigationBarListView, scrollView: navigationBarListView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //  解除循环引用
        navigationController?.navigationBar.swpRemove()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
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


// MARK: - Set Data Method Extension
extension NavigationBarViewController {
    
    private func setData() -> Void {
        navigationBarListView.datas = [1, 2, 3, 4, 5, 9, 10, 11];
    }
}


extension NavigationBarViewController  {
    
    private func setUI() -> Void {
        setNavigationBar()
        setUpUI()
        setUIAutoLayout()
    }
    
    private func setNavigationBar() -> Void {
        
    }
    
    private func setUpUI() -> Void {
        view.addSubview(navigationBarListView)
    }
    
    private func setUIAutoLayout() -> Void {
        navigationBarListView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
}

extension NavigationBarViewController {
    
    func navigationBarListViewClickCell(_ tableView: UITableView, indexPath: IndexPath, model: AnyObject) {
        print(model)
    }
    
    func navigationBarListViewScrollDidScroll(_ tableView: UITableView, scrollView: UIScrollView) {
        
        let offsetY : CGFloat   = scrollView.contentOffset.y
        let color   : UIColor   = UIColor.orange
        let height  : CGFloat   = 150
        let navigationBarHeight = self.navigationController?.navigationBar.swpNavigationBarHeight ?? 64
        
        if offsetY > height {
            let alpha : CGFloat = min(1, 1 - ((height + navigationBarHeight - offsetY) / navigationBarHeight))
            self.navigationController?.navigationBar.swpBackgroundColor = color.withAlphaComponent(alpha)
        } else {
            self.navigationController?.navigationBar.swpBackgroundColor = color.withAlphaComponent(0)
        }
        
    }
    
}
