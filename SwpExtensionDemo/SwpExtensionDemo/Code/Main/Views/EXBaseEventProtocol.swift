//
//  EXBaseEventProtocol.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit
import Foundation

@objc protocol EXTableViewProtocol : NSObjectProtocol {
    
    typealias EXTableViewCallBack<T, M> = (_ tableView : T, _ indexPath : IndexPath, _ model : M) -> Void
    
    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, model : NSObject) -> Void
    
}

//extension EXTableViewProtocol {
//
//    func tableView<T, M>(_ tableView: T, didSelectRowAt indexPath: IndexPath, model : M) -> Void { }
//
//}

