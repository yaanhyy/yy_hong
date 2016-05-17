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
    
    var dev_info_cell:dev_info_struct!
    
    func setDevCell(newdev_class: dev_info_struct){
        lab_dev_name.text = StringToInt(newdev_class.dev_name) as String
        if newdev_class.flag & 0x8 == 0x8{
            img_dev_online.image = UIImage(named: "online1.png")
        }
        else{
            img_dev_online.image = UIImage(named: "offline1.png")
            
        }
        
        if newdev_class.sys_var.op_flag == 1{
            img_notice_switch.image = UIImage(named: "on")
        }
        else{
            img_notice_switch.image = UIImage(named: "off")
            
        }
        
        lab_water_tmp.text = String(newdev_class.sys_var.water_tmp/10) + "℃"
        pro_water_tmp.progress=Float(newdev_class.sys_var.water_tmp/10)
        lab_oxy.text = String(newdev_class.sys_var.oxygen/10)
        pro_oxy.progress = Float(newdev_class.sys_var.oxygen/10)
        
//        newdev_class.cur_time = 
//        newdev_class.dev_cur_time
//        if ((newdev_class.cur_time - newdev_class.last_time)/1000 > 720)&&(newdev_class.last_time != -1) {
//            newdev_class.last_time = newdev_class.last_time
//        }
        
        
        lab_update_time.text = "更新时间："+String(newdev_class.sys_date.year)+"-"+String(newdev_class.sys_date.mon)+"-"+String(newdev_class.sys_date.day)+" "+String(newdev_class.sys_date.hour)+":"+String(newdev_class.sys_date.min)+":"+String(newdev_class.sys_date.sec)
        
        if(newdev_class.sys_var.motor_stat_flag & 0x1 ) == 0x1 {
            img_contactor1.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor1.image = UIImage(named: "aerator_offline.png")
        }
        
        if(newdev_class.sys_var.motor_stat_flag & 0x2) == 0x2{
            img_contactor2.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor2.image = UIImage(named: "aerator_offline.png")
        }
        
        if(newdev_class.sys_var.motor_stat_flag & 0x4) == 0x4{
            img_contactor3.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor3.image = UIImage(named: "aerator_offline.png")
        }
        
        if(newdev_class.sys_var.motor_stat_flag & 0x8) == 0x8{
            img_contactor4.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor4.image = UIImage(named: "aerator_offline.png")
        }
        if newdev_class.dev_type == 8 {
            if (newdev_class.sys_var.motor_stat_flag & 0x10) == 0x10{
                img_contactor4.image = UIImage(named: "aerator_online.png")
            }
            else
            {
                 img_contactor4.image = UIImage(named: "aerator_offline.png")
            }
            
            if (newdev_class.sys_var.motor_stat_flag & 0x20) == 0x20{
                img_contactor4.image = UIImage(named: "aerator_online.png")
            }
            else
            {
                img_contactor4.image = UIImage(named: "aerator_offline.png")
            }
        }
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
    
    //[UInt8]转string
    func StringToInt(bytes:[UInt8])->NSString{
        var gbkEncoding: NSStringEncoding = CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue))
        let data = NSData(bytes: bytes, length: bytes.count)
        let dogString:NSString = NSString(data: data, encoding:gbkEncoding )!
        return dogString
    }
}
