//
//  ViewController.swift
//  TwelfSwift
//
//  Created by 冯志浩 on 16/7/5.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let signUpBtn = UIButton.init(type: .Custom)
    let loginBtn = UIButton.init(type: .Custom)
    let headImageView = UIImageView.init(image: UIImage.init(named: "login-secondary-logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.13,green: 0.64,blue: 0.11,alpha: 1)
        setupHeadImage()
        setupButton()
    }
    func setupHeadImage() -> Void {
        headImageView.frame = CGRect(x: 78, y: 86, width: 218, height: 66)
        view.addSubview(headImageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    func setupButton() -> Void {
        signUpBtn.frame = CGRect(x: 27,y: 527,width: 320,height: 50)
        signUpBtn.backgroundColor = UIColor.whiteColor()
        signUpBtn.layer.cornerRadius = 5
        signUpBtn.setTitle("signup", forState: .Normal)
        signUpBtn.setTitleColor(UIColor(red: 0.13,green: 0.64,blue: 0.11,alpha: 1), forState: .Normal)
        view.addSubview(signUpBtn)
        
        loginBtn.frame = CGRect(x: 27,y: 597,width: 320,height: 50)
        loginBtn.setTitle("login", forState: .Normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        //13/58/09
        loginBtn.backgroundColor = UIColor(red: 0.13,green: 0.58,blue: 0.09,alpha: 1)
        loginBtn.addTarget(self, action: #selector(buttonClick), forControlEvents: .TouchUpInside)
        view.addSubview(loginBtn)
    }

    func buttonClick() -> Void {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: false)
    }

}

