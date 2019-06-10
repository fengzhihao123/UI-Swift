//
//  ViewController.swift
//  07-Qrcode
//
//  Created by 冯志浩 on 2017/1/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let contentLabel = UILabel()
    let scanButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        contentLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
        view.addSubview(contentLabel)
        scanButton.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        scanButton.addTarget(self, action: #selector(scanningFunc), for: .touchUpInside)
        scanButton.setTitle("scan", for: .normal)
        scanButton.backgroundColor = UIColor.blue
        view.addSubview(scanButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentLabel.text = Content.shared.content
    }
    
    @objc func scanningFunc() {
        let qrVC = QRViewController()
        navigationController?.pushViewController(qrVC, animated: true)
    }
}

