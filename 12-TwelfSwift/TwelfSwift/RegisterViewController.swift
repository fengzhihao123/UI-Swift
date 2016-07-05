//
//  RegisterViewController.swift
//  TwelfSwift
//
//  Created by 冯志浩 on 16/7/5.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    let usernameTextField = UITextField.init()
    let passwordTextField = UITextField.init()
    let titleLabel = UILabel.init()
    
    let loginButton = UIButton.init(type: .Custom)
    let backButton = UIButton.init(type: .Custom)
    
    var centerAlignUsername = NSLayoutConstraint.init()
    var centerAlignPassword = NSLayoutConstraint.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.13,green: 0.64,blue: 0.11,alpha: 1)
        initSubViews()
    }
    func initSubViews() -> Void {
        setupLabel()
        setupButton()
        setupTextfield()
    }
    func setupLabel() -> Void {
        titleLabel.frame = CGRect(x: 150, y: 31, width: 74, height: 24)
        titleLabel.text = "Welcome"
        titleLabel.textColor = UIColor.whiteColor()
        view.addSubview(titleLabel)
    }
    func setupButton() -> Void {
        loginButton.frame = CGRect(x: 112, y: 248, width: 150, height: 50)
        loginButton.backgroundColor = UIColor(red: 0.13, green: 0.58, blue: 0.09, alpha: 1)
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.addTarget(self, action: #selector(loginButtonDidTouch), forControlEvents: .TouchUpInside)
        loginButton.layer.cornerRadius = 5
        view.addSubview(loginButton)
        
        backButton.frame = CGRect(x: 27, y: 30, width: 14, height: 24)
        backButton.setImage(UIImage.init(named: "Back-icon"), forState: .Normal)
        backButton.addTarget(self, action: #selector(backRootVC), forControlEvents: .TouchUpInside)
        view.addSubview(backButton)
    }
    func setupTextfield() -> Void {
        usernameTextField.frame = CGRect(x: 27, y: 93, width: 320, height: 50)
        usernameTextField.backgroundColor = UIColor.whiteColor()
        usernameTextField.placeholder = "  username"
        passwordTextField.frame = CGRect(x: 27, y: 163, width: 320, height: 50)
        passwordTextField.backgroundColor = UIColor.whiteColor()
        passwordTextField.placeholder = "  password"
        usernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        loginButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: UIViewAnimationOptions.CurveEaseOut, animations: { 
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.10, options: .CurveEaseOut, animations: { 
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: { 
            self.loginButton.alpha = 1
            }, completion: nil)
    }
    func loginButtonDidTouch() -> Void {
        let bounds = self.loginButton.bounds
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.enabled = false
            },completion: {finished in self.loginButton.enabled = true})
    }
    func backRootVC() -> Void {
        navigationController?.popToRootViewControllerAnimated(true)
    }
   
}
