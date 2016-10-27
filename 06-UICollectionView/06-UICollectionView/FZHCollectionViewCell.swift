//
//  FZHCollectionViewCell.swift
//  06-UICollectionView
//
//  Created by 冯志浩 on 16/10/26.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHCollectionViewCell: UICollectionViewCell {
    let titleLabel = UILabel()
    let imageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        awakeFromNib()
    }
  
    override func awakeFromNib() {
        titleLabel.frame = CGRect(x: 10, y: 10, width: 80, height: 30)
        titleLabel.text = "1234"
        titleLabel.textColor = UIColor.green
        addSubview(titleLabel)
        
        imageView.frame = CGRect(x: 10, y: 50, width: 50, height: 50)
        //随机色
        let redNum = CGFloat(arc4random() % 255)
        let greenNum = CGFloat(arc4random() % 255)
        let blueNum = CGFloat(arc4random() % 255)
        let bgColor = UIColor.init(red: redNum/255, green: greenNum/255, blue: blueNum/255, alpha: 0.5)
        
        imageView.backgroundColor = bgColor
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
