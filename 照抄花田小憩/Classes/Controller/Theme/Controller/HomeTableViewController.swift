//
//  HomeTableViewController.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/23.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
      // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: SeupView
    func setupNaviBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "TOP", style: .Plain, target: self, action: #selector(HomeTableViewController.topButtonClick))
    }
    
    private lazy var menuButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named:"menu"), forState: .Normal)
        button.frame.size = CGSizeMake(20.0, 20.0)
        button.addTarget(self, action: #selector(HomeTableViewController.menuButtonClick(_:)), forControlEvents: .TouchDown)
        return button
    }()
    
    
    private lazy var blurView: BlurView = {
        let blur = BlurView(effect: UIBlurEffect(style: .Light))
        // delegate datas
        return blur
    }()
    
    // MARK: Click Event
    @objc private func menuButtonClick(btn: UIButton) {
        // selected
        btn.selected = !btn.selected
        if menuButton.selected {
      // show view
            tableView.addSubview(blurView)
            blurView.snp_makeConstraints { (make) in
                //            make.top.equalTo(64.0)
                //            make.leading.trailing.equalTo(tableView)
                //            make.bottom.equalTo(49)
                make.top.equalTo(tableView.contentOffset.y+64)
                make.size.equalTo(CGSize(width: ScreenWidth, height: ScreenHeight-49-64))
            }
        blurView.transform = CGAffineTransformMakeTranslation(0, -ScreenHeight)
        }
        
        // make animation for button
        
        
        UIView.animateWithDuration(0.5, animations: { 
            if self.menuButton.selected{
                btn.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
                self.blurView.transform = CGAffineTransformIdentity
                self.tableView.scrollEnabled = false
                self.tableView.bringSubviewToFront(self.blurView)
            }else {
                btn.transform = CGAffineTransformIdentity
                self.blurView.transform = CGAffineTransformMakeTranslation(0, -ScreenHeight)
                self.tableView.scrollEnabled = true
            }
            
            }) { (completee) in
                if !self.menuButton.selected{
               self.blurView.removeFromSuperview()
            }
        }
    }

    @objc private func topButtonClick() {
        
        self.navigationController?.pushViewController(TopViewController(nibName: "TopViewController", bundle: nil), animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        return cell
    }
   
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
