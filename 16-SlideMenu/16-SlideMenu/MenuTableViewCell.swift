//
//  MenuTableViewCell.swift
//  16-SlideMenu
//
//  Created by 冯志浩 on 16/7/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    let bgImageView = UIImageView.init()
    let headImageView = UIImageView.init()
    let nameLabel = UILabel.init()
    let introductLabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //1.
        self.addSubview(bgImageView)
        
        //2.
        nameLabel.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
        nameLabel.textColor = UIColor.whiteColor()
        bgImageView.addSubview(nameLabel)
        //3.
        introductLabel.frame = CGRect(x: 50, y: 80, width: 100, height: 30)
        introductLabel.textColor = UIColor.lightGrayColor()
        bgImageView.addSubview(introductLabel)
        //4.
        headImageView.frame = CGRect(x: 10, y: 50, width: 30, height: 30)
        headImageView.layer.cornerRadius = 15
        headImageView.layer.masksToBounds = true
        bgImageView.addSubview(headImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView.frame = self.bounds
        
    }

}
