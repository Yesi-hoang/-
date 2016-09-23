//
//  LoginViewController.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/23.
//  Copyright © 2016年 Yesi. All rights reserved.
//  不是使用登陆成功发送全局通知的情况

import UIKit

class LoginViewController: UIViewController {
// modal 出自己
    func show() {
        print("modal出LoginViewController， 待完善")
       
    }
    
    @IBAction func quitButtonClick(sender: AnyObject) {
        
        dismissViewControllerAnimated(true) {
            print("🌺Logout")
        }
    }
    
  
    @IBAction func loginButtonClick(sender: AnyObject) {
        
        
        LoginHelper.sharedInstance.saveStatus(true)

        dismissViewControllerAnimated(true) {
            print("🌺Logout")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
