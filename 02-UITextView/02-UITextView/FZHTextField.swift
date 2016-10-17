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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupTextfieldNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyWillShow(notification: Notification) -> Void {
        let keyboardF: CGRect = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)!
        if self.frame.origin.y < (keyboardF.origin.y - self.frame.size.height - self.frame.origin.y) {
            return
        }
        UIView.animate(withDuration: 0.25) {
            self.transform = CGAffineTransform.init(translationX: 0, y: keyboardF.origin.y - self.frame.size.height - self.frame.origin.y)
        }
        print(self.frame)
    }
    
    func keyWillHide(notification: Notification) -> Void {
        UIView.animate(withDuration: 0.25) {
            self.frame.origin.y = self.textFieldY
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
