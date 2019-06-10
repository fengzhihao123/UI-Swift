//
//  FZHTextField.swift
//  02-UITextView
//
//  Created by 冯志浩 on 16/10/17.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHTextField: UITextField {

    var textFieldY: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextfieldNotification()
    }
    
    //添加对键盘的监听
    func setupTextfieldNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyWillShow(notification: Notification) {
        if let keyboardF = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y < (keyboardF.origin.y - self.frame.size.height - self.frame.origin.y) {
                return
            }
            
            UIView.animate(withDuration: 0.25) {
                self.transform = CGAffineTransform.init(translationX: 0, y: keyboardF.origin.y - self.frame.size.height - self.frame.origin.y)
            }
        }
    }
    
    @objc func keyWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25) {
            self.frame.origin.y = self.textFieldY
        }
    }
    //移除监听
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
