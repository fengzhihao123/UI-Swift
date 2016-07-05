//
//  ViewController.swift
//  SixthSwiftOfLocation
//
//  Created by 冯志浩 on 16/6/22.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationLabel = UILabel()
    var locationButton = UIButton()
    let locationManager:CLLocationManager = CLLocationManager()
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackgroundImageView()
        self.setupLabelAndButton()
    }
    //创建背景图
    func setupBackgroundImageView(){
        let bgImageView = UIImageView(image: UIImage(named: "bg"))
        bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        self.view.addSubview(bgImageView)
    }
    
    //创建label和button
    func setupLabelAndButton() {
        //1.label
        locationLabel.frame = CGRectMake(20, 64, SCREEN_WIDTH - 40, 50)
        locationLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(locationLabel)
        
        //2.button
        locationButton = UIButton.init(type: .Custom)
        locationButton.frame = CGRectMake(20, SCREEN_HEIGHT * 0.7, SCREEN_WIDTH - 40, 50);
        locationButton.addTarget(self, action: #selector(ViewController.myLocationButtonDidTouch), forControlEvents: .TouchUpInside)
        locationButton.setTitle("find my location", forState: .Normal)
        locationButton.backgroundColor = UIColor.blackColor()
        self.view.addSubview(locationButton)
    }
    //按钮的点击方法
    func myLocationButtonDidTouch() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        //判断是否允许
        if (CLLocationManager.locationServicesEnabled())
        {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
   func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //地理反编码
        CLGeocoder().reverseGeocodeLocation(manager.location!,completionHandler: { (placemarks, error) ->Void in
            if(error != nil){
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0{
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
                
            }else{
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        })
    }
    //解析位置
    func displayLocationInfo(placemark: CLPlacemark?) {
        
        if let containsPlacemark = placemark {
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationLabel.text = locality! +  postalCode! +  administrativeArea! +  country!
        }

    }
    

}

