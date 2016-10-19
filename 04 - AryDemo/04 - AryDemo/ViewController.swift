//
//  ViewController.swift
//  04 - AryDemo
//
//  Created by 冯志浩 on 16/10/19.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var resultLabel = UILabel()
    var inputTextfield = UITextField()
    var categoryPickView = UIPickerView()
    var transferBtn = UIButton()
    let titleArr = ["2","10","16"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        
        categoryPickView.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        categoryPickView.delegate = self
        categoryPickView.dataSource = self
        view.addSubview(categoryPickView)
    }
    //MARK:UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titleArr[row]
    }
    
    //MARK:UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
}

