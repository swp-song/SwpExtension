//
//  DemoViewController.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/26.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class DemoViewController: EXBaseViewController {

    
    private(set) lazy var demoTableView = DemoTableView()
    
    private var datas : [DemoListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.endEditing(<#T##force: Bool##Bool#>)
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

extension DemoViewController {

    override func configUI() {
        self.view.addSubview(self.demoTableView)
    }
    
    override func configUIAutoLayout() {
        self.demoTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

extension DemoViewController : EXTableViewProtocol {
    
    func tableView(_ tableView: EXBaseTableView, didSelectRowAt indexPath: IndexPath, model: NSObject) {
        print(#function)
    }
    
    func scrollViewDidScroll(_ tableView: EXBaseTableView) {
//        print(#function)
    }
}

extension DemoViewController {
    
    override func configDatas() {
        self.demoTableView.exDelegate(self)
    }
    
    override func configClosure() {
        
    }
}

extension DemoViewController {
    
    @discardableResult func readDatas(_ path : String) -> [DemoListModel] {
        let datas : [[String : Any]]? = NSArray(contentsOfFile: Bundle.main.path(forResource: path, ofType: nil) ?? "") as? [[String : Any]]
        return DemoListModel.models(datas)
    }
}
