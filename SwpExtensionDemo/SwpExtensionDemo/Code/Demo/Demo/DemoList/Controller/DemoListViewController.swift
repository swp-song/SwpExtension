
//
//  DemoListViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoListViewController: EXBaseViewController {

    
    private(set) lazy var demoList = DemoListView()
    
    private var datas : [DemoListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension DemoListViewController {

    override func configUI() {
        self.view.addSubview(self.demoList)
    }
    
    override func configUIAutoLayout() {
        self.demoList.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

extension DemoListViewController : EXTableViewProtocol {
    
    func tableView(_ tableView: EXBaseTableView, didSelectRowAt indexPath: IndexPath, model: NSObject) {
        print(#function)
    }
    
}

extension DemoListViewController {
    
    override func configDatas() {
        self.demoList.exDelegate(self)
    }
    
    override func configClosure() {
        
    }
}


extension DemoListViewController {
    
    @discardableResult func readDatas(_ path : String) -> [DemoListModel] {
        let datas : [[String : Any]]? = NSArray(contentsOfFile: Bundle.main.path(forResource: path, ofType: nil) ?? "") as? [[String : Any]]
        return DemoListModel.models(datas)
    }
}


