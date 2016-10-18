//
//  ViewController.swift
//  03-UIPickView
//
//  Created by 冯志浩 on 16/10/18.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var pickView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickView()
    }

    func setupPickView() -> Void {
        pickView.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        pickView.delegate = self
        pickView.dataSource = self
        view.addSubview(pickView)
    }
    
    //MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "123"
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
}

