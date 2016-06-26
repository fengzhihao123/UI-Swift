//
//  ViewController.swift
//  SeventhSwift-Refresh
//
//  Created by 冯志浩 on 16/6/26.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    let cellIdentifer = "CellID"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style:.Plain)
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupRefreshControl()
    }
    //创建TableView
    func setupTableView() {
        let emojiTableView = tableViewController.tableView
        emojiTableView.frame = CGRect(x: 0,y: 64,width: SCREEN_WIDTH,height: SCREEN_HEIGHT)
        emojiData = favoriteEmoji
        emojiTableView.dataSource = self
        emojiTableView.delegate = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        self.view.addSubview(emojiTableView)
        
    }
    //创建刷新控件
    func setupRefreshControl(){
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), forControlEvents: .ValueChanged)
        let attributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on\(NSDate())",attributes: attributes)
        self.refreshControl.tintColor = UIColor.blackColor()
    }
    //1.TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(emojiData.count)
        return emojiData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    //refresh message
    func didRoadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
}

