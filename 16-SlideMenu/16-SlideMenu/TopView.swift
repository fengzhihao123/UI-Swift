//
//  TopView.swift
//  16-SlideMenu
//
//  Created by 冯志浩 on 16/7/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit
@objc protocol TopViewDelegate {
    func dismissWithTitle(title: String)
}

class TopView: UIView ,UITableViewDelegate,UITableViewDataSource{
    let tableView = UITableView.init()
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    let dataArr = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    
    var delegate:TopViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() -> Void {
        tableView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300)
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
    }
    
    func showTopView() -> Void {
        let window = UIApplication.sharedApplication().windows.first
        window?.addSubview(self)
        UIView.animateWithDuration(1.0 ) {
            self.transform = CGAffineTransformMakeTranslation(0, 300)
        }
    }
    
    func dismissTopView() -> Void {
        UIView.animateWithDuration(1.0) { 
            self.transform = CGAffineTransformIdentity
        }
    }
//    Mark TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .Default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = dataArr[indexPath.row]
        return cell
        
    }
//    Mark TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let title = dataArr[indexPath.row]
        
        dismissTopView()
        if ((self.delegate?.dismissWithTitle(title)) != nil){
            self.delegate?.dismissWithTitle(title)
        }
    }
}
