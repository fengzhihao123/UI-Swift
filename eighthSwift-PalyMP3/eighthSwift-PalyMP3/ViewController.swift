//
//  ViewController.swift
//  eighthSwift-PalyMP3
//
//  Created by 冯志浩 on 16/6/27.
//  Copyright © 2016年 FZH. All rights reserved.
//
//以后需要添加的功能：播放时长，播放时在暂停处开始
import UIKit
import AVFoundation
class ViewController: UIViewController {

    var timer = NSTimer()
    
    var audioPlayer = AVAudioPlayer()
    let gradientLayer = CAGradientLayer()
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        UIApplication.sharedApplication().statusBarHidden = true
        self.setupButton()
    }
    func setupButton() -> Void {
        //play
        let playBtn = UIButton.init(type: .Custom)
        playBtn.frame = CGRect(x: (SCREEN_WIDTH - 200)/3,y: SCREEN_HEIGHT * 0.3,width: 100,height: 100)
        playBtn.setImage(UIImage(named: "play"), forState: .Normal)
        playBtn.layer.cornerRadius = 10.0
        playBtn.addTarget(self, action: #selector(buttonClick), forControlEvents: .TouchUpInside)
        playBtn.tag = 1001
        self.view.addSubview(playBtn)
        //pause
        let pauseBtn = UIButton.init(type: .Custom)
        pauseBtn.frame = CGRect(x: (SCREEN_WIDTH - 200)/3 * 2 + 100,y: SCREEN_HEIGHT * 0.3,width: 100,height: 100)
        pauseBtn.setImage(UIImage(named: "pause"), forState: .Normal)
        pauseBtn.layer.cornerRadius = 10.0
        pauseBtn.addTarget(self, action: #selector(buttonClick), forControlEvents: .TouchUpInside)
        pauseBtn.tag = 1002
        self.view.addSubview(pauseBtn)
    }
    
    func buttonClick(btn:UIButton) {
        
        let bgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOfURL: bgMusic)
            if btn.tag == 1001 {
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
            }
            if btn.tag == 1002 {
                audioPlayer.pause()
                timer.invalidate()
            }
        }
        catch let audioError as NSError{
            print(audioError)
        }
    }
    
    func randomColor() -> Void {
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue,green: greenValue,blue: blueValue,alpha: 1.0)
    }
}

