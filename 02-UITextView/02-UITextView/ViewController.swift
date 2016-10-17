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
        setupButton()
        setupTextfield()
        setupTextView()
        setupTextfieldNotification()
    }
    
    func setupButton() -> Void {
        let secureBtn = UIButton()
        secureBtn.frame = CGRect(x: 0, y: 20, width: 100, height: 50)
        secureBtn.tag = 1001
        secureBtn.setTitle("secure", for: .normal)
        secureBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        secureBtn.backgroundColor = UIColor.green
        secureBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(secureBtn)
        
        let cornerBtn = UIButton()
        cornerBtn.frame = CGRect(x: 120, y: 20, width: 100, height: 50)
        cornerBtn.tag = 1002
        cornerBtn.setTitle("corner", for: .normal)
        cornerBtn.backgroundColor = UIColor.green
        cornerBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        cornerBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(cornerBtn)
    }

    func setupTextfield() -> Void {
        textField.backgroundColor = UIColor.brown
        textField.frame = CGRect(x: 0, y: 500, width: 300, height: 50)
        textField.placeholder = "textfield..."
        view.addSubview(textField)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupTextfieldNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyWillShow(notification: Notification) -> Void {
        let keyboardF: CGRect = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)!
        let keyboardT: Double = ((notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]) as? Double)!
        
        UIView.animate(withDuration: keyboardT) {
            self.textField.transform = CGAffineTransform.init(translationX: 0, y: keyboardF.origin.y - self.textField.frame.size.height - self.textField.frame.origin.y)
        }
    }
    
    func keyWillHide(notification: Notification) -> Void {
        UIView.animate(withDuration: 0.25) {
            self.textField.transform = .identity
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
        self.textView.resignFirstResponder()
    }
    
    func setupTextView() -> Void {
        textView.backgroundColor = UIColor.gray
        textView.frame = CGRect(x: 0, y: 200, width: 300, height: 100)
        textView.placeholder = "textview..."
        view.addSubview(textView)
    }
    
    func btnDidTouch(btn: UIButton) -> Void {
        if btn.tag == 1001{
            textField.isSecureTextEntry = true
        }else if btn.tag == 1002{
            textField.layer.cornerRadius =  5
        }
    }
}

