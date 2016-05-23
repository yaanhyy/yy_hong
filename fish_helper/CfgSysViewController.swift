//
//  CfgSysViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/23.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class CfgSysViewController:UIViewController{
    
 
    @IBOutlet weak var tex_do_min1_cfg: UITextField!
    
    @IBOutlet weak var tex_do_min2_cfg: UITextField!
    
    @IBOutlet weak var tex_do_min3_cfg: UITextField!
    @IBOutlet weak var tex_do_max_cfg: UITextField!
    @IBOutlet weak var tex_do_top_cfg: UITextField!
    @IBOutlet weak var tex_salinity_cfg: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func did_cfg_sys_onclick(sender: AnyObject) {
    }
    
    @IBAction func did_oxy_calibration_onclick(sender: AnyObject) {
    }
  
    @IBAction func did_ph7_calibration_onclick(sender: AnyObject) {
    }
    
    @IBAction func did_ph4_calibration_onclick(sender: AnyObject) {
    }
    
    @IBAction func did_reback_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
   
}
