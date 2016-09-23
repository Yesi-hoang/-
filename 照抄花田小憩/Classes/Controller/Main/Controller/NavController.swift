
//
//  NavController.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/9.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

class NavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置全局的UINavigationBar属性
        let bar = UINavigationBar.appearance()
        bar.tintColor = UIColor.blackColor()
        bar.titleTextAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(15), NSForegroundColorAttributeName : UIColor.blackColor()]
        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewController.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .Done, target: self, action: #selector(NavController.back))
        }
        super.pushViewController(viewController, animated: true)
        
    }
        @objc private func back(){
            popViewControllerAnimated(true)
        }
    

   
}
