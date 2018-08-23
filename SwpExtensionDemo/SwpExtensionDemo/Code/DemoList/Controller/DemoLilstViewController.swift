
//
//  DemoLilstViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/11.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoLilstViewController: DemoBaseViewController, DemoLilstViewDelegate {
    
    private lazy var demoListView : DemoLilstView = DemoLilstView(delegate: self)
    
    private lazy var datas : [DemoModel] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        
        setData()
        
        controllerBlocks(demoLilstView: demoListView)        
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


// MARK: - Set UI Methods Extension
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

// MARK: - Set Data Method Extension
extension DemoLilstViewController {
    
    private func setData() -> Void {
        let datas : [[String : Any]]? = NSArray(contentsOfFile: Bundle.main.path(forResource: "DemoModel.plist", ofType: nil) ?? "") as? [[String : Any]]
        self.datas = DemoModel.demos(dictionarys: datas)
        self.demoListView.datas = self.datas
    }
}

// MARK: - DemoLilstView Delegate Methods Extension
extension DemoLilstViewController {
    
    func demoLilstView(_ tableView: UITableView, indexPath: IndexPath, model: AnyObject) -> Void {
        print("\(#function)")
    }
}

// MARK: - DemoLilstView Block Methods Extension
extension DemoLilstViewController {

    private func controllerBlocks(demoLilstView : DemoLilstView) -> Void {
        
        demoLilstView.demoLilstViewClickCell = { [weak self] (tableView, indexPath, model) -> Void in
            print("\(#function)")
            let aClass = (model as! DemoModel).aClass as? UIViewController.Type
            if let aClass = aClass {
                self?.navigationController?.pushViewController(aClass.init(), animated: true)
            }
        }
        
    }
}
