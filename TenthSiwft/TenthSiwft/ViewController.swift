//
//  ViewController.swift
//  TenthSiwft
//
//  Created by 冯志浩 on 16/7/1.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
    }
    func setupVideoBackground() {
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        contentURL = url
//        url	NSURL	"file:///Users/fengzhihao/Library/Developer/CoreSimulator/Devices/ED8B880D-6EBD-439C-8D96-089D47534D82/data/Containers/Bundle/Application/42E45DD9-9C39-40DD-B0F6-F8DC2420AA27/SpotifyVideoBackground.app/moments.mp4"
        0x00007fd5fae34f00
//        url	NSURL	"file:///Users/fengzhihao/Library/Developer/CoreSimulator/Devices/ED8B880D-6EBD-439C-8D96-089D47534D82/data/Containers/Bundle/Application/F0F5D67E-0EB4-45F7-B29B-B7EAB6490B83/TenthSiwft.app/moments.mp4"	0x00007fbfda7c22c0
        view.userInteractionEnabled = false
    }

}

