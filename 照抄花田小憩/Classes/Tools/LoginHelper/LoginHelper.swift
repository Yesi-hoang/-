//
//  LoginHelper.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/23.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

private let LoginStatus = "LoginStatus"

class LoginHelper: NSObject {

    // 一句话实现单例
    static let sharedInstance = LoginHelper()
//     一般情况下, 我们可以通过NSHTTPCookieStorage中的NSHTTPCookie来判断登录状态.也可以自定义一个字段来保存.这儿就简单一点了
    // 获取登录状态
    func isLogin() -> Bool {
        if let status: Bool = NSUserDefaults.standardUserDefaults().boolForKey(LoginStatus) {
            return status
        }
        return false
    }
    
    // 保存登录状态
    func saveStatus(status: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(status, forKey: LoginStatus)
    }
}
