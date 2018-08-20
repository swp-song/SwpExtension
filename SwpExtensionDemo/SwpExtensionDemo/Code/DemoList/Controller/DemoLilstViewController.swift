
//
//  DemoLilstViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoLilstViewController: DemoBaseViewController {

    
    private lazy var demoListView : DemoLilstView = DemoLilstView()
    
    private var datas : [DemoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        
        setData()
        
        print("\(DemoModel().aTitle)")
        
    }

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

extension DemoLilstViewController  {
    
    
    
    private func setUI() -> Void {
        
        setNavigationBar()
        setUpUI()
        setUIAutoLayout()
    }
    
    
    private func setNavigationBar() -> Void {
    }
    
    private func setUpUI() -> Void {
        view.addSubview(demoListView)
    }
    
    private func setUIAutoLayout() -> Void {
        
        demoListView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
}


extension DemoLilstViewController {
    
    private func setData() -> Void {
        let datas : [[String : Any]]? = NSArray(contentsOfFile: Bundle.main.path(forResource: "DemoModel.plist", ofType: nil) ?? "") as? [[String : Any]]
        self.datas = DemoModel.demos(dictionarys: datas)
        self.demoListView.datas = self.datas
    }
    
}
