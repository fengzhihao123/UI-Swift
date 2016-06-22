//
//  InterestCollectionViewCell.swift
//  FiveSwift
//
//  Created by 冯志浩 on 16/6/21.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var featureImageView = UIImageView()
    var interestTitleLabel = UILabel()
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    func updateUI() {
        //1.Label
        interestTitleLabel.frame = CGRectMake(0, SCREEN_HEIGHT * 0.4, SCREEN_WIDTH, 30)
        interestTitleLabel.textAlignment = .Center
        interestTitleLabel.text = interest.title
        
        //2.imageView
         featureImageView.frame = CGRectMake(SCREEN_WIDTH * 0.1, 0, SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.4)
        featureImageView.image = interest.featuredImage
        //3.添加到item上
        self.addSubview(featureImageView)
        self.addSubview(interestTitleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
