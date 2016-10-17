//
//  ViewController.swift
//  02-UITextView
//
//  Created by 冯志浩 on 16/10/17.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfield()
        setupTextView()
    }

    func setupTextfield() -> Void {
        let textField = UITextField()
        textField.backgroundColor = UIColor.brown
        textField.frame = CGRect(x: 0, y: 20, width: 300, height: 50)
        textField.placeholder = "textfield..."
        view.addSubview(textField)
    }
    
    func setupTextView() -> Void {
        let textView = FZHTextView()
        textView.backgroundColor = UIColor.gray
        textView.frame = CGRect(x: 0, y: 100, width: 300, height: 200)
        textView.placeholder = "textview..."
        view.addSubview(textView)
    }
}

