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
    var provinceArr: NSArray = [""]
    var citiesArr: NSArray = [""]
    var areaArr: NSArray = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickView()
        
        let path = Bundle.main.path(forResource: "area", ofType: "plist")
        provinceArr = NSArray.init(contentsOfFile: path!)!
        let dict = provinceArr[4] as! NSDictionary
        citiesArr = dict.value(forKey: "cities") as! NSArray
        
        let dict2 = citiesArr[0] as! NSDictionary
        areaArr = dict2.value(forKey: "areas") as! NSArray
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
        if component == 0 {
            return provinceArr.count
        }else if component == 1{
            return 10
        }else{
            return 10
        }
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
           return "123"
        }else{
            return "234"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        pickerView.reloadAllComponents()
    }
    
}

