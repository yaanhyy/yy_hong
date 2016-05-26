//
//  SysSettingViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/25.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class SysSettingViewController:UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func did_btn_reback_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func did_btn_add_fish_dev_onclick(sender: AnyObject) {
        self.performSegueWithIdentifier("seg_ToDevAdd", sender: nil)
    }
    
    @IBAction func did_btn_add_barn_dev_onclick(sender: AnyObject) {
        self.performSegueWithIdentifier("seg_ToDevAdd", sender: nil)
    }
    
}
