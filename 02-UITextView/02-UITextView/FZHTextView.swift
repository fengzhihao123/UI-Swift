//
//  FZHTextView.swift
//  02-UITextView
//
//  Created by 冯志浩 on 16/10/17.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHTextView: UITextView {

    var placeholder = "placeholder"
    var placeholderColor = UIColor.black
    var placeHolderLabel = UILabel()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        placeholder = "placeholder"
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeholderColor = UIColor.lightGray
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(noti:)), name:  UITextView.textDidChangeNotification, object: nil)
    }
    
    @objc func textChanged(noti: NSNotification) {
        if placeholder.count == 0 {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            if self.text.count == 0 {
                self.viewWithTag(999)?.alpha = 1
            } else {
                self.viewWithTag(999)?.alpha = 0
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if placeholder.count > 0 {
            placeHolderLabel.frame = CGRect(x: 5, y: 5, width: self.bounds.size.width - 16, height: 0)
            placeHolderLabel.lineBreakMode = .byWordWrapping
            placeHolderLabel.numberOfLines = 0
            placeHolderLabel.font = self.font
            placeHolderLabel.backgroundColor = UIColor.clear
            placeHolderLabel.textColor = placeholderColor
            placeHolderLabel.alpha = 0
            placeHolderLabel.tag = 999
            addSubview(placeHolderLabel)
            placeHolderLabel.text = placeholder
            placeHolderLabel.sizeToFit()
            sendSubviewToBack(placeHolderLabel)
        }
        
        if text.count == 0 && placeholder.count > 0 {
            self.viewWithTag(999)?.alpha = 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
