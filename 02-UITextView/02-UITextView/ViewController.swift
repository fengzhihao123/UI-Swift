//
//  ViewController.swift
//  02-UITextView
//
//  Created by 冯志浩 on 16/10/17.
//  Copyright © 2016年 FZH. All rights reserved.
//  切换输入法的时候有问题

import UIKit

class ViewController: UIViewController {
    let textField = UITextField()
    let textView = FZHTextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupTextfieldNotification()
    }
    
    func setupSubviews() {
        setupButton()
        setupTextfield()
        setupTextView()
    }
    
    func setupButton() {
        let secureBtn = UIButton()
        secureBtn.frame = CGRect(x: 0, y: 120, width: 100, height: 50)
        secureBtn.tag = 1001
        secureBtn.setTitle("secure", for: .normal)
        secureBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        secureBtn.backgroundColor = UIColor.green
        secureBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(secureBtn)
        
        let cornerBtn = UIButton()
        cornerBtn.frame = CGRect(x: 120, y: 120, width: 100, height: 50)
        cornerBtn.tag = 1002
        cornerBtn.setTitle("corner", for: .normal)
        cornerBtn.backgroundColor = UIColor.green
        cornerBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        cornerBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(cornerBtn)
    }

    func setupTextfield() {
        textField.backgroundColor = UIColor.brown
        textField.frame = CGRect(x: 0, y: 500, width: 300, height: 50)
        textField.placeholder = "textfield..."
        view.addSubview(textField)
    }
    
    func setupTextView() {
        textView.backgroundColor = UIColor.gray
        textView.frame = CGRect(x: 0, y: 200, width: 300, height: 100)
        textView.placeholder = "textview..."
        view.addSubview(textView)
    }
    
    func setupTextfieldNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillShow), name:  UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillHide), name:  UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
        self.textView.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK - Event

extension ViewController {
    @objc func btnDidTouch(btn: UIButton) {
        if btn.tag == 1001 {
            textField.isSecureTextEntry = true
        }else if btn.tag == 1002 {
            textField.layer.cornerRadius =  5
        }
    }
    
    @objc func keyWillShow(notification: Notification) {
        let keyboardF: CGRect = ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)!
        let keyboardT: Double = ((notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey]) as? Double)!
        
        UIView.animate(withDuration: keyboardT) {
            self.textField.transform = CGAffineTransform.init(translationX: 0, y: keyboardF.origin.y - self.textField.frame.size.height - self.textField.frame.origin.y)
        }
    }
    
    @objc func keyWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25) {
            self.textField.transform = .identity
        }
    }
}
