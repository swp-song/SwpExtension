
//
//  DemoBaseCellProtocol.swift
//  swp_song
//
//  Created by swp-song on 2018/9/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//



import Foundation

protocol DemoBaseCellProtocol : NSObjectProtocol {
    
    func configCell() -> Void
    
    func setUpUI() -> Void
    
    func setUIAutoLayout() -> Void
    
    func setDatas(_ datas : NSObject?) -> Self
}








