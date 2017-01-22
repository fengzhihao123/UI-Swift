//
//  Content.swift
//  07-Qrcode
//
//  Created by 冯志浩 on 2017/1/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

public final class Content {
    private static let _shared = Content()
    private init() { }
    var content = "content"
    public static var shared: Content {
        return _shared
    }
}
