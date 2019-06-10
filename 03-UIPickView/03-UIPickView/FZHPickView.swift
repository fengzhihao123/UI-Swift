//
//  FZHPickView.swift
//  03-UIPickView
//
//  Created by 冯志浩 on 16/10/19.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHPickView: UIPickerView {
    
    var provinceArr: NSArray = []
    var citiesArr: NSArray = []
    var areaArr: NSArray = []
    var provinceStr = ""
    var citiesStr = ""
    var areaStr = ""
    var selectArr: NSArray = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupData()
        self.delegate = self
        self.dataSource = self
    }
    
    func setupData() -> Void {
        if let path = Bundle.main.path(forResource: "area", ofType: "plist") {
            if let tempProvinceArr = NSArray.init(contentsOfFile: path) {
                for (_, value) in tempProvinceArr.enumerated() {
                    let temp = NSMutableArray.init(array: provinceArr)
                    let dict = value as! NSDictionary
                    temp.add(dict.value(forKey: "state") ?? "")
                    provinceArr = temp
                }
                
                let cityDict = tempProvinceArr.firstObject as! NSDictionary
                let cityArr = cityDict.value(forKey: "cities") as! NSArray
                let tempCitysArr = NSMutableArray.init(array: cityArr)
                for (_, value) in tempCitysArr.enumerated() {
                    let temp = NSMutableArray.init(array: citiesArr)
                    let dict = value as! NSDictionary
                    temp.add(dict.value(forKey: "city") ?? "")
                    citiesArr = temp
                }
                
                let areaDict = tempCitysArr.firstObject as! NSDictionary
                let areaArray = areaDict.value(forKey: "areas") as! NSArray
                areaArr = NSMutableArray.init(array: areaArray)
                
                provinceStr = provinceArr.firstObject as! String
                citiesStr = citiesArr.firstObject as! String
                areaStr = ((areaArr.count == 0) ? "" : areaArr.firstObject as! String)
            }
        }
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FZHPickView: UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return provinceArr.count
        }else if component == 1{
            return citiesArr.count
        }else{
            return areaArr.count
        }
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let path = Bundle.main.path(forResource: "area", ofType: "plist")
        let provinceArray = NSArray.init(contentsOfFile: path!)!
        if component == 0 {
            let tempDict = provinceArray[row] as! NSDictionary
            selectArr = tempDict.value(forKey: "cities") as! NSArray
            let tempArr = NSMutableArray.init(array: citiesArr)
            tempArr.removeAllObjects()
            citiesArr = tempArr
            for (_, value) in selectArr.enumerated() {
                let temp = NSMutableArray.init(array: citiesArr)
                let dict = value as! NSDictionary
                temp.add(dict.value(forKey: "city") ?? "")
                citiesArr = temp
            }
            let areaDict = selectArr.firstObject as! NSDictionary
            areaArr = areaDict.value(forKey: "areas") as! NSArray
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        }else if component == 1{
            if selectArr.count == 0 {
                selectArr = (provinceArray.firstObject as! NSDictionary).value(forKey: "cities") as! NSArray
            }
            
            areaArr = NSMutableArray.init(array: (selectArr[row] as! NSDictionary).value(forKey: "areas") as! NSArray)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        }
        
        let provinceNum = pickerView.selectedRow(inComponent: 0)
        let cityNum = pickerView.selectedRow(inComponent: 1)
        let areaNum = pickerView.selectedRow(inComponent: 2)
        
        provinceStr = provinceArr[provinceNum] as! String
        citiesStr = citiesArr[cityNum] as! String
        if areaArr.count == 0 {
            areaStr = ""
        }else{
            areaStr = areaArr[areaNum] as! String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        if component == 0 {
            label.text = provinceArr[row] as? String
        }else if component == 1{
            label.text = citiesArr[row] as? String
        }else{
            if areaArr.count == 0 {
                label.text = ""
            }else{
                label.text = areaArr[row] as? String
            }
        }
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }
}
