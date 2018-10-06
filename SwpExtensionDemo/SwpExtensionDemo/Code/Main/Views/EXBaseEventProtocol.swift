//
//  EXBaseEventProtocol.swift
//  SwpExtensionDemo
//
//  Created by swp_song on 2018/9/27.
//  Copyright © 2018 swp-song. All rights reserved.
//

import UIKit
import Foundation

protocol EXTableViewProtocol : NSObjectProtocol {
    
    func tableView(_ tableView: EXBaseTableView, didSelectRowAt indexPath: IndexPath, model : NSObject) -> Void
    
}

extension EXTableViewProtocol {
    
    func tableView(_ tableView: EXBaseTableView, didSelectRowAt indexPath: IndexPath, model : NSObject) -> Void {}
    
}

