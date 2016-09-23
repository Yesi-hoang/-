//
//  AppDelegate.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/9.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
// set Window 
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // RootView Controller setting

        if isNewVersion() {
            
          self.window?.rootViewController = NewFeatureViewController()
            
        }else{
            
            self.window?.rootViewController = TabViewController()
//            self.window?.rootViewController = HomeTableViewController(nibName: "HomeTableViewController", bundle: nil)

        }
        
        setAppKeys()
        
        //logout status
        LoginHelper.sharedInstance.saveStatus(false)
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    private let YBundleShortVersionString = "SLBundleShortVersionString"
    // MARK: - Judge version
    private func isNewVersion() -> Bool {
        
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        let oldVersion = NSUserDefaults.standardUserDefaults().objectForKey(YBundleShortVersionString) ?? ""
        if (currentVersion.compare(oldVersion as! String)) == .OrderedDescending {
            // 保存当前版本
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: YBundleShortVersionString)
            return true
            
        }
        return false
    }
    
        // MARK: - Set app keys
    private func setAppKeys() {
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

