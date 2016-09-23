//
//  TabViewController.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/9.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        addChildViewControllers()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupTabbar(){
        tabBar.tintColor = UIColor.blackColor()
        
    }

    // func logout  if received noto return to main and  po login
    private func addChildViewControllers(){
    addChildViewController(HomeTableViewController(nibName:"HomeTableViewController" , bundle: nil), image: "tb_0", selectedImage: "tb_0_selected", title: NSLocalizedString("tab_theme", comment: ""))
  
        addChildViewController(MallViewController(nibName:"MallViewController" , bundle: nil), image: "tb_1", selectedImage: "tb_1_selected", title: NSLocalizedString("tab_malls", comment: ""))
    // Some login
    addChildViewController(ProfileViewController(nibName:"ProfileViewController" , bundle: nil), image: "tb_2", selectedImage: "tb_2_selected", title: NSLocalizedString("tab_profile", comment: ""))

        selectedIndex = 0
        
    }
    
    private func addChildViewController(controller: UIViewController, image: String, selectedImage: String , title: String) {
        let naVC = NavController(rootViewController: controller)
        naVC.tabBarItem.title = title
        naVC.tabBarItem.image = UIImage.init(named: image)
        naVC.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        naVC.tabBarItem.tag = childViewControllers.count - 1
        addChildViewController(naVC)
    }
    
    // MARK:  UITabBarControllerDelegate
    // 点击profile的时候.判断是否登录. 如果没有登录, 需要跳转到登录界面, 反之则跳转到个人界面
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
//        let isLogin = LoginHelper.sharedInstance.isLogin()
//        if  tabBarController.childViewControllers.indexOf(viewController) == (tabBarController.childViewControllers.count - 1) {
//            if !isLogin {
//                LoginViewController().show()
//            }
//            return isLogin
//        }
//        
        return true
    }

}
