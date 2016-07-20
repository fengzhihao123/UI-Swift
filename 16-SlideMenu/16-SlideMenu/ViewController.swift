//
//  ViewController.swift
//  16-SlideMenu
//
//  Created by 冯志浩 on 16/7/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TopViewDelegate {
    let menuTableView = UITableView.init()
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    let topView = TopView.init(frame: CGRect(x: 0, y: -300, width: 414, height: 300))
    var titleStr = "haha"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupTableView()
        setupLeftButton()
    }
    
    func setupLeftButton() -> Void {
        let leftBtn = UIBarButtonItem.init(title: "Menu", style: .Done, target: self, action: #selector(leftDidTouch))
       self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    func leftDidTouch() -> Void {
    topView.showTopView()
    UIView.animateWithDuration(1.0, animations: { 
        self.navigationController?.navigationBar.transform = CGAffineTransformMakeTranslation(0, 300)
        })
    }
    
    func setupAttribute() -> Void {
        view.backgroundColor = UIColor.whiteColor()
        topView.delegate = self
        self.title = "haha"
    }
    
    func setupTableView() -> Void {
        menuTableView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        view.addSubview(menuTableView)
    }
    
//    Mark TopViewDelegate
    func dismissWithTitle(title: String){
        
        UIView.animateWithDuration(1.0, animations: {
            self.navigationController?.navigationBar.transform = CGAffineTransformIdentity
        })
        self.title = title
    }
    
    //Mark TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = MenuTableViewCell.init(style: .Default, reuseIdentifier: "MenuTableViewCell")
        
        
        if indexPath.row == 0 {
            cell.bgImageView.image = UIImage(named: "1")
            cell.introductLabel.text = "Love mountain."
            cell.nameLabel.text = "Allen Wang"
            cell.headImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.bgImageView.image = UIImage(named: "2")
            cell.introductLabel.text = "New graphic design - LIVE FREE"
            cell.nameLabel.text = "Cole"
            cell.headImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.bgImageView.image = UIImage(named: "3")
            cell.introductLabel.text = "Summer sand"
            cell.nameLabel.text = "Daniel Hooper"
            cell.headImageView.image = UIImage(named: "c")
            
        } else {
            cell.bgImageView.image = UIImage(named: "4")
            cell.introductLabel.text = "Seeking for signal"
            cell.nameLabel.text = "Noby-Wan Kenobi"
            cell.headImageView.image = UIImage(named: "d")
            
        }
      
        return cell
    }
    
//    Mark TableView Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200.0
    }
  
}

