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
        awakeFromNib()
    }
  
    override func awakeFromNib() {
        titleLabel.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        titleLabel.textColor = UIColor.green
        addSubview(titleLabel)
        
        imageView.frame = CGRect(x: 10, y: 50, width: 50, height: 50)
        imageView.backgroundColor = UIColor.yellow
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
