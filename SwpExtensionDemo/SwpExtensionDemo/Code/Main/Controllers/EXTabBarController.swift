
//
//  EXTabBarController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class EXTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setUpChildControllers()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EXTabBarController {
    
    private func setUpChildControllers() -> Void {
        
        let infos : [[String : String]] = [
            ["className" : "UIDemoListViewController",  "title" : "Demo", "imageName" : "tabbar_01"],
            ["className" : "NavigationDemoListViewController",  "title" : "Navigation", "imageName" : "tabbar_02"],
        ]
        
        var controllers : [UIViewController] = []
        infos.forEach { (info) in

            controllers.append(createController(info))
        }
        
        self.viewControllers = controllers
    }
    
    @discardableResult private func createController(_ info : [String : String]) -> UIViewController {
        
        guard
            let className   = info["className"],
            let title       = info["title"],
            let imageName   = info["imageName"],
            let aClass      = NSClassFromString(nameSpace() + className) as? UIViewController.Type
        else { return UIViewController() }
        
        let controller = aClass.init()
        controller.tabBarItem.image         = UIImage(named: imageName + "_no")?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_sel")?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.title         = title
        controller.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.lightGray, .font : UIFont.systemFont(ofSize: 12)], for: .normal)
        controller.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.orange, .font : UIFont.systemFont(ofSize: 12)], for: .selected)
        return EXNavigationController(rootViewController: controller)
    }
    
    private func nameSpace() -> String {
        guard let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String else {
            return ""
        }
        return bundleName.count > 0 ? bundleName + "." : ""
    }
    
}
