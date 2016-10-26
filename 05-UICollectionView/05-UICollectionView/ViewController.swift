//
//  ViewController.swift
//  05-UICollectionView
//
//  Created by 冯志浩 on 16/10/26.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() -> Void {
        collectionView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 400)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
   
    //MARK:UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = UICollectionViewCell.init()
        return coll
    }
    
    //MARK:UICollectionViewDelegate
    
}

