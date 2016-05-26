//
//  DevAddViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/26.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class DevAddViewController:UIViewController{
    
    @IBOutlet weak var tex_dev_id: UITextField!
    @IBOutlet weak var tex_dev_name: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func did_btn_add_onclick(sender: AnyObject) {
        
    }

    @IBAction func did_btn_cancel_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
}
