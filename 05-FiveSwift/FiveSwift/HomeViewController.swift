//
//  HomeViewController.swift
//  FiveSwift
//
//  Created by 冯志浩 on 16/6/21.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var backgroundImageView = UIImageView()
    var interestCollectionViewCell = InterestCollectionViewCell()
    let cellID = "InterestCollectionViewCell"
    private var interests = Interest.createInterests()
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置背景图
        let bgImageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        bgImageView.image = UIImage.init(named: "blue")
        self.view.addSubview(bgImageView)
        //2.初始化collectionView
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        //2.1初始化layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT/2)
        //2.2初始化collectionView
        let interestCollectionView = UICollectionView(frame:CGRectMake(0, 0, SCREEN_WIDTH ,SCREEN_HEIGHT), collectionViewLayout:flowLayout)
        interestCollectionView.showsHorizontalScrollIndicator = true
        interestCollectionView.collectionViewLayout = flowLayout
        //2.3准守协议
        interestCollectionView.delegate = self
        interestCollectionView.dataSource = self
        //2.4注册cell
        interestCollectionView.registerClass(InterestCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        interestCollectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(interestCollectionView)
    }
    
    //1.UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
      
        interestCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! InterestCollectionViewCell
        interestCollectionViewCell.interest = self.interests[indexPath.item]
        interestCollectionViewCell.backgroundColor = UIColor.clearColor()
        return interestCollectionViewCell
    }
    
}
