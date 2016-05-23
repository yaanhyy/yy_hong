//
//  CfgMenuViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/23.
//  Copyright © 2016年 洪远洋. All rights reserved.
//
import UIKit

class CfgMenuViewController:UIViewController{
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        
    }
    
    
  
    @IBAction func did_btn_reback_onclick(sender: AnyObject) {
         self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func did_btn_sys_cfg_onclick(sender: AnyObject) {
        self.performSegueWithIdentifier("seg_ToCfgSys", sender: nil)//跳转到CfgSysViewController.swift, 设置参数配置
    }
    
    @IBAction func did_btn_auto_cfg_onclick(sender: AnyObject) {
    }
    
    @IBAction func did_btn_time_cfg_onclick(sender: AnyObject) {
    }
    @IBAction func did_btn_feed_ctl_onclick(sender: AnyObject) {
    }
}
