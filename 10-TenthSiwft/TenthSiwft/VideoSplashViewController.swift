//
//  VideoSplashViewController.swift
//  TenthSiwft
//
//  Created by 冯志浩 on 16/7/1.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode{
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

class VideoSplashViewController: UIViewController {
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    internal var contentURL: NSURL = NSURL() {
        didSet {
            setMoviePlayer(contentURL)
        }
    }
    
    public var videoFrame: CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    public var backgroundColor: UIColor = UIColor.blackColor() {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    public var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NSNotificationCenter.defaultCenter().addObserver(self,
                                                                 selector: #selector(VideoSplashViewController.playerItemDidReachEnd),
                                                                 name: AVPlayerItemDidPlayToEndTimeNotification,
                                                                 object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    override public func viewDidAppear(animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private func setMoviePlayer(url: NSURL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as NSURL? {
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.moviePlayer.player = AVPlayer(URL: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                    }
                }
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }

//    
//    private let moviePlayer = AVPlayerViewController()
//    private var moviePlayerSoundLevel: Float = 1.0
//    internal var videoFrame: CGRect = CGRect()
//    internal var startTime: CGFloat = 0.0
//    internal var duration: CGFloat = 0.0
//    internal var backgroundColor: UIColor = UIColor.blackColor(){
//        didSet {
//            view.backgroundColor = backgroundColor
//        }
//    }
//    internal var contetnURL: NSURL = NSURL(){
//        didSet {
//            setMoviePlayer(contetnURL)
//        }
//    }
//    internal var sound: Bool = true {
//        didSet {
//            if sound {
//                moviePlayerSoundLevel = 1.0
//            }else{
//                moviePlayerSoundLevel = 0.0
//            }
//        }
//    }
//    
//    internal var alpha: CGFloat = CGFloat() {
//        didSet{
//            moviePlayer.view.alpha = alpha
//        }
//    }
//    internal var alwaysRepeat: Bool = true {
//        didSet {
//            if alwaysRepeat {
//                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(VideoSplashViewController.playerItemDidReachEnd), name: AVPlayerItemDidPlayToEndTimeNotification, object: moviePlayer.player?.currentItem)
//            }
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    internal var fillMode: ScalingMode = .ResizeAspectFill {
//        didSet {
//            switch fillMode {
//            case .Resize:
//                moviePlayer.videoGravity = AVLayerVideoGravityResize
//            case .ResizeAspect:
//                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
//            case .ResizeAspectFill:
//                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
//            }
//        }
//    }
//
//    
//    override internal func viewWillDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
//    
//    override internal func viewDidAppear(animated: Bool) {
//        moviePlayer.view.frame = videoFrame
//        moviePlayer.showsPlaybackControls = false
//        view.addSubview(moviePlayer.view)
//        view.sendSubviewToBack(moviePlayer.view)
//    }
//    
//    private func setMoviePlayer(url: NSURL){
//        let videoCutter = VideoCutter()
//        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
//            if let path = videoPath as NSURL? {
//                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
//                dispatch_async(dispatch_get_global_queue(priority, 0)) {
//                    dispatch_async(dispatch_get_main_queue()) {
//                        self.moviePlayer.player = AVPlayer(URL: path)
//                        self.moviePlayer.player?.play()
//                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
//                    }
//                }
//            }
//        }
//    }
//
//    func playerItemDidReachEnd() {
//        moviePlayer.player?.seekToTime(kCMTimeZero)
//        moviePlayer.player?.play()
//    }
    
}
