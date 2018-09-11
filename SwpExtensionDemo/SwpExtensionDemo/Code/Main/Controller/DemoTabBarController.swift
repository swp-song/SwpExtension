//
//  DemoTabBarController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoTabBarController: UITabBarController {

    /// # viewDidLoad, ( 视图载入完成, 调用 )
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpChildControllers()
        
        setUI()
        
        setData()
        
        controllerClosure()
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

extension DemoTabBarController {
    
    private func setUpChildControllers() -> Void {
        
        let infos : [[String : String]] = [
            ["className" : "DemoLilstViewController",  "title" : "首页", "imageName" : "tabbar_01"],
            ["className" : "CustomListViewController", "title" : "Custom", "imageName" : "tabbar_02"],
        ]
        
        var vcs  : [UIViewController] = []
    
        infos.forEach { (info) in
            vcs.append(createController(info))
        }
        
        print(vcs)
        self.viewControllers = vcs
     }
    
    private func createController(_ info : [String : String]) -> UIViewController {
        
        guard   let className   = info["className"],
                let title       = info["title"],
                let imageName   = info["imageName"],
                let aClass      = NSClassFromString(nameSpace() + className) as? UIViewController.Type else { return UIViewController() }
        
        let controller = aClass.init()
        
        controller.title = title
    
        controller.tabBarItem.image         = UIImage(named: imageName + "_no")?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_sel")?.withRenderingMode(.alwaysOriginal)
        
        let navigation  = UINavigationController(rootViewController: controller)
        
        return navigation
    }
    
    
    private func nameSpace() -> String {
        
        guard let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String else {
            return ""
        }
        return bundleName.count > 0 ? bundleName + "." : ""
    }
}


// MARK: - DemoTabBarController, Set UI Methods Extension
extension DemoTabBarController  {
    
    private func setUI() -> Void {
        
        setUpUI()
        
        setAutoLayout()
    }
    
    
    private func setUpUI() -> Void {
        
    }
    
    private func setAutoLayout() -> Void {
        
    }
    
}

// MARK: - DemoTabBarController, Set Data Method Extension
extension DemoTabBarController {
    
    private func setData() -> Void {

    }
    
}

// MARK: - DemoTabBarController, Closure ( Block ) Methods Extension
extension DemoTabBarController {
    
    private func controllerClosure() -> Void {
        
    }
    
}

// MARK: - DemoTabBarController, Delegate Methods Extension
extension DemoTabBarController {
    
}
