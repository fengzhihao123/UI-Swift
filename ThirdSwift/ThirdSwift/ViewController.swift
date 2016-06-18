//
//  ViewController.swift
//  ThirdSwift
//
//  Created by 冯志浩 on 16/6/17.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,VideoTableViewCellDelegate{

    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var videoTableView = UITableView(frame:CGRectMake(0, 0, 0, 0),style: .Plain)
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    let playVideoBtn = UIButton(type: .Custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PlayVideo"
        self.setupTableView()
    }
    
    func setupTableView() {
        videoTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        videoTableView.delegate = self
        videoTableView.dataSource = self
        //注册自定义的cell
        videoTableView.registerClass(VideoTableViewCell.self, forCellReuseIdentifier:"VideoTableViewCell")
        self.view.addSubview(videoTableView)
    }

    //1.TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = VideoTableViewCell(style:.Default, reuseIdentifier:"VideoTableViewCell")
        let video = data[indexPath.row]
        cell.delegate = self
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        return cell
    }
    
    //2.TableView Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    //3.VideoTabelViewCellDelegate
    func ButtonDidClcik() {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

