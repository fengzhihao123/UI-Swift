//
//  ViewController.swift
//  SecondSwift
//
//  Created by 冯志浩 on 16/6/16.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //1.初始化全局变量
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project"]
    var fontNames = ["PingFangSC-Medium",
        "EuphemiaUCAS-Italic",
        "EuphemiaUCAS"]
    var fontRowIndex = 0
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    let changeFontButton = UIButton(type: .Custom)
    let fontTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Font"
      
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                print(font)
            }
        }
        self.setupTableView()
        self.setupButton()
    }
    //2.初始化tableView
    func setupTableView()  {
        fontTableView.delegate = self
        fontTableView.dataSource = self
       
        fontTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT/2)
        self.view.addSubview(fontTableView)
    }
    //3.初始化button
    func setupButton() {
        
        changeFontButton.frame = CGRectMake(132, 519, 110, 110)
        changeFontButton.backgroundColor = UIColor.grayColor()
          changeFontButton.layer.cornerRadius = 55
        changeFontButton.addTarget(self, action: #selector(ViewController.tap), forControlEvents: .TouchUpInside)
        changeFontButton.setTitle("changeFont", forState: .Normal)
        
        self.view.addSubview(changeFontButton)
    }
    
    func tap() {
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
    }
    
    //4.TableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .None
        let text = data[indexPath.row]
        
            cell.textLabel?.text = text
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex],size:16)
        return cell
    }
   
    //5.TableView Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

