//
//  ViewController.swift
//  04-AryDemo
//
//  Created by 冯志浩 on 16/10/19.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aryTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var transferBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnDidTouch(_ sender: UIButton) {
        let aryStr = aryTextField.text
        if aryStr != "" {
            let redIndex = aryStr?.index((aryStr?.startIndex)!, offsetBy: 2)
            let str = aryStr?.substring(from: redIndex!)
            for index in 0..<Int((str?.characters.count)!) {
                
            }
            resultLabel.text = str
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        aryTextField.resignFirstResponder()
    }
}

