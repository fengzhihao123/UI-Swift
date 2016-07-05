//
//  VideoTableViewCell.swift
//  ThirdSwift
//
//  Created by 冯志浩 on 16/6/17.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}
//定义协议
protocol VideoTableViewCellDelegate {
     func ButtonDidClcik()
}

class VideoTableViewCell: UITableViewCell {

    //1.声明实例变量
    var delegate: VideoTableViewCellDelegate?
    var videoScreenshot = UIImageView(image: UIImage.init(named: "videoScreenshot01"))
    var videoTitleLabel = UILabel()
    var videoSourceLabel = UILabel()
    var videoPlayBtn = UIButton(type: .Custom)
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .Default, reuseIdentifier: nil)
     self.awakeFromNib()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //2.1初始化sourceLabel
        videoSourceLabel.frame = CGRectMake(0, 197, SCREEN_WIDTH, 14)
        videoSourceLabel.font = UIFont.systemFontOfSize(10)
        videoSourceLabel.textAlignment = NSTextAlignment.Center
        videoSourceLabel.textColor = UIColor.greenColor()
        //2.2初始化TitleLabel
        videoTitleLabel.frame = CGRectMake(0, 173, SCREEN_WIDTH, 16)
        videoTitleLabel.textColor = UIColor.greenColor()
        videoTitleLabel.font = UIFont.systemFontOfSize(14)
        videoTitleLabel.textAlignment = NSTextAlignment.Center
        //2.3初始化背景图
        videoScreenshot.frame = CGRectMake(0, 0, SCREEN_WIDTH, 220)
        videoScreenshot.backgroundColor = UIColor.greenColor()
        
        //2.4初始化按钮
        videoPlayBtn.frame = CGRectMake((SCREEN_WIDTH - 200)/2, 60, 200, 100)
        videoPlayBtn.setImage(UIImage(named: "playBtn"), forState: .Normal)
        videoPlayBtn.addTarget(self, action: #selector(self.VideoBtnClick), forControlEvents: .TouchUpInside)
 
        //2.5添加到cell上  tip：注意添加顺序
        self.addSubview(videoScreenshot)
        self.addSubview(videoPlayBtn)
        self.addSubview(videoSourceLabel)
        self.addSubview(videoTitleLabel)
        
    }
    
    func VideoBtnClick()  {
        delegate?.ButtonDidClcik()
    }
    
}
