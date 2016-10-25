//
//  FZHTableViewCell.swift
//  05-UITableView
//
//  Created by 冯志浩 on 16/10/25.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHTableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var iconImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //取消选中状态
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.frame = CGRect(x: 50, y: 10, width: 100, height: 50)
        titleLabel.textColor = UIColor.blue
        addSubview(titleLabel)
        
        iconImageView.frame = CGRect(x: 180, y: 10, width: 50, height: 50)
        iconImageView.backgroundColor = UIColor.green
        addSubview(iconImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
