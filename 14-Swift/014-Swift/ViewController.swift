//
//  ViewController.swift
//  014-Swift
//
//  Created by 冯志浩 on 16/7/7.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRectZero
    
    var emojiPickerView = UIPickerView()
    var goButton = UIButton.init(type: .Custom)
    var resultLabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = goButton.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0...100 {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
        setupSubView()
    }
    func setupSubView() -> Void {
        let bgImageView = UIImageView.init(image: UIImage.init(named: "Hyperspace"))
        bgImageView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        
        
        goButton.frame = CGRect(x: 27, y: 458, width: 320, height: 45)
        goButton.setTitle("go", forState: .Normal)
        goButton.layer.cornerRadius = 6
        goButton.backgroundColor = UIColor.blueColor()
        goButton.addTarget(self, action: #selector(goButtonDidTouch), forControlEvents: .TouchUpInside)
        
        resultLabel.frame = CGRect(x: 100, y: 586, width: 375, height: 28)
        resultLabel.textColor = UIColor.whiteColor()
        resultLabel.text = ""
        
        emojiPickerView.frame = CGRect(x: -3, y: 201, width: 383, height: 216)
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
        view.addSubview(bgImageView)
        view.addSubview(goButton)
        view.addSubview(resultLabel)
        view.addSubview(emojiPickerView)
    }
    
    func goButtonDidTouch() -> Void {
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        let isEqual = dataArray1[emojiPickerView.selectedRowInComponent(0)] == dataArray2[emojiPickerView.selectedRowInComponent(1)] &&
            dataArray2[emojiPickerView.selectedRowInComponent(1)] == dataArray3[emojiPickerView.selectedRowInComponent(2)]
        if isEqual {
            resultLabel.text = "Bingo!"
        } else {
            resultLabel.text = "💔"
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        goButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            
            self.goButton.alpha = 1
            
            }, completion: nil)
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        }else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        }else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji",size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
        
    }

}

