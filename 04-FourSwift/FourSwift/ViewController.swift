//
//  ViewController.swift
//  FourSwift
//
//  Created by 冯志浩 on 16/6/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView = UIScrollView()
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.隐藏状态栏
        UIApplication.sharedApplication().statusBarHidden = true
        //2.初始化scrollview
        self.setupScrollView()
    }
    func setupScrollView(){
        //2.1设置初始属性
        self.scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height)
        self.scrollView.pagingEnabled = true
        //2.2添加子控件
        let leftImageView = UIImageView(image: UIImage(named: "left"))
        leftImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        self.scrollView.addSubview(leftImageView)
        
        let rightImageView = UIImageView(image: UIImage(named: "right"))
        rightImageView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH , SCREEN_HEIGHT)
        self.scrollView.addSubview(rightImageView)
       
        //2.3添加到根视图
        self.view.addSubview(self.scrollView)
    }
}

