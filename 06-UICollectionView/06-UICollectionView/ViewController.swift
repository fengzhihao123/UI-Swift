//
//  ViewController.swift
//  06-UICollectionView
//
//  Created by 冯志浩 on 16/10/26.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView? = nil
    let cellHeightArr: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() -> Void {
        //初始化layout
        let layout = FZHCollectionViewLayout()

        //创建collectionView
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.brown
        //注册cell
        collectionView?.register(FZHCollectionViewCell.self, forCellWithReuseIdentifier: "FZHCollectionViewCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView!)

    }
    //MARK:UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FZHCollectionViewCell", for: indexPath) as! FZHCollectionViewCell
        return item
    }
    
}

