//
//  ViewController.swift
//  SwpExtensionDemo
//
//  Created by Dream on 2018/8/9.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

import SwpExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("".swpBase64Encoding)
        print("123".swpBase64Encoding)
        print(String.SwpBase64Encoding(string: "A"))
        print(String.SwpBase64Encoding(string: "a"))
        print("QQ==".swpBase64Decoding)
        print(String.SwpBase64Decoding(string: "YQ=="))
        
        print(String.SwpMD5Encryption(string: "aaaa"))
        print("123".swpMD5Encryption16Bit)
        print("123".swpMD5Encryption16BitLowercase)
        print("123".swpMD5Encryption16BitUppercased)
        print(String.SwpMD5Encryption16Bit(string: "123"))
        print(String.SwpMD5Encryption16BitLowercase(string: "123"))
        print(String.SwpMD5Encryption16BitUppercased(string: "123"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

