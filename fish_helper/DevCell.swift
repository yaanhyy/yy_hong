//
//  Dev_list_item_cell.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/13.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class DevCell: UITableViewCell{
    
    @IBOutlet weak var lab_dev_name: UILabel!
    @IBOutlet weak var img_dev_online: UIImageView!
    @IBOutlet weak var img_notice_switch: UIImageView!
    @IBOutlet weak var pro_water_tmp: UIProgressView!
    @IBOutlet weak var lab_water_tmp: UILabel!
    @IBOutlet weak var pro_oxy: UIProgressView!
    @IBOutlet weak var lab_oxy: UILabel!
    @IBOutlet weak var lab_update_time: UILabel!
    @IBOutlet weak var img_event: UIImageView!
    @IBOutlet weak var img_contactor1: UIImageView!
    @IBOutlet weak var img_contactor2: UIImageView!
    @IBOutlet weak var img_contactor3: UIImageView!
    @IBOutlet weak var img_contactor4: UIImageView!
    
    var dev_item:Dev_item!
    
    func setDevCell(newdev_class: Dev_item){
        lab_dev_name.text = newdev_class.Name
        if newdev_class.online{
            img_dev_online.image = UIImage(named: "online1.png")
        }
        else{
            img_dev_online.image = UIImage(named: "offline1.png")
            
        }
        
        if newdev_class.not_turnon{
            img_notice_switch.image = UIImage(named: "on")
        }
        else{
            img_notice_switch.image = UIImage(named: "off")
            
        }
        
        lab_water_tmp.text = newdev_class.water_tmp/10 as? String
        pro_water_tmp.progress=newdev_class.water_tmp/10
        lab_oxy.text = newdev_class.oxy_val/10 as?String
        pro_oxy.progress = newdev_class.oxy_val/10
        
        lab_update_time.text = newdev_class.update_time
        
    }
    var longPressRecognizer: UILongPressGestureRecognizer?
    
  
    
    // 长按手势判定
    func setTheLongPressRecognizer(newLongPressRecognizer: UILongPressGestureRecognizer?) {
        
        if longPressRecognizer != nil {
            self.removeGestureRecognizer(longPressRecognizer!)
        }
        
        if newLongPressRecognizer != nil {
            self.addGestureRecognizer(newLongPressRecognizer!)
        }
        
        longPressRecognizer = newLongPressRecognizer
    }
    
}
