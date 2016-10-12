//
//  ViewController.swift
//  01-LabelAndButton
//
//  Created by 冯志浩 on 16/10/12.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let titleLabel = UILabel()
    
    let attributeBtn = UIButton.init(type: .custom)
    let obliqueBtn = UIButton.init(type: .custom)
    
    let attributeTag = 1000
    let obliqueTag = 1001
    
    let text = "《DOTA 2》是一款由Valve开发免费的多人在线战斗竞技类游戏（MOBA）。2011年Dota2开始在Windows平台上进行测试，它的前身是魔兽争霸三及扩展版本冰封王座中的一张自定义游戏地图。截至2013年6月，Dota2支持Windows系统、OS X系统及Linux系统。Dota2是steam平台上活跃人数最多的游戏之一，最高在线人数超过100万。Dota2的游戏比赛在两个队伍间进行，每个队伍有五名玩家，每个队伍都有一条优势路。每个队伍的游戏目标是摧毁对面要塞中的远古遗迹。每个玩家从111位能力风格技能迥异的英雄中选择一位进行操控。在比赛中，玩家在相互对抗的过程中为各自的英雄收集金钱、经验及道具。Dota2的发展开始于2009年，曾受雇于Valve的Iceforg作为当时dota模组的领导设计者。"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButtton()
    }
    
    //Label
    func setupLabel() -> Void {
        titleLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 0)
        //设置高度自适应该属性必须设为0
        titleLabel.numberOfLines = 0
        titleLabel.text = text
        //此语句作用label自适应高度
        titleLabel.sizeToFit()
        view.addSubview(titleLabel)
    }
    //Button
    func setupButtton() -> Void {
        attributeBtn.frame = CGRect(x: 150, y: 30, width: 80, height: 20)
        attributeBtn.setTitle("attribute", for: .normal)
        attributeBtn.tag = attributeTag
        attributeBtn.backgroundColor = UIColor.black
        attributeBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        //设置Btn的圆角
        attributeBtn.layer.cornerRadius = 5.0
        view.addSubview(attributeBtn)
        
        obliqueBtn.frame = CGRect(x: 20, y: 30, width: 80, height: 20)
        obliqueBtn.tag = obliqueTag
        obliqueBtn.setTitle("oblique", for: .normal)
        obliqueBtn.backgroundColor = UIColor.black
        obliqueBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        obliqueBtn.layer.cornerRadius = 5.0
        view.addSubview(obliqueBtn)
    }
    
    func btnDidTouch(btn:UIButton) -> Void {
        if btn.tag ==  attributeTag{//改变部分字体颜色
            let str = "是一款由Valve开发免费的多人在线战斗竞技类游戏"
            let range = NSRange.init(location: 3, length: 5)
            let mutableStr = NSMutableAttributedString.init(string: str)
            //常用属性
            //NSFontAttributeName:字体
            //NSForegroundColorAttributeName:字体颜色
            //NSBackgroundColorAttributeName:背景色
            mutableStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: range)
            titleLabel.attributedText = mutableStr
        }else{//设置本文倾斜度
            titleLabel.transform = CGAffineTransform.init(rotationAngle: 0.2)
        }
    }

}

