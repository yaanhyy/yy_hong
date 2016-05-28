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
    @IBOutlet weak var img_cell_backgd: UIImageView!
    
    
    func setDevCell(index:Int){
        
        lab_dev_name.text = StringToInt(dev_grp.dev_info[index].dev_name) as String
        print("dev_grp.dev_info[index].last_time = " + "\(dev_grp.dev_info[index].last_time)")
        if (dev_grp.dev_info[index].last_time > 180) && (dev_grp.dev_info[index].last_time != -1) {
           
             img_dev_online.image = UIImage(named: "offline1.png")
        }
        else{
            img_dev_online.image = UIImage(named: "online1.png")
            
        }
        
        if dev_grp.dev_info[index].sys_var.op_flag == 1{
            img_notice_switch.image = UIImage(named: "on")
        }
        else{
            img_notice_switch.image = UIImage(named: "off")
            
        }
        
        lab_water_tmp.text = String(Float(dev_grp.dev_info[index].sys_var.water_tmp)/10) + "℃"
        lab_oxy.text = String(Float(dev_grp.dev_info[index].sys_var.oxygen)/10)+"mg"
        //pro_water_tmp.transform = CGAffineTransformMakeScale(1.0, 3.0)
        pro_water_tmp.progress = 50
        //pro_oxy.transform = CGAffineTransformMakeScale(1.0, 3.0)
        pro_oxy.progress = 30
        pro_water_tmp.setProgress(Float(dev_grp.dev_info[index].sys_var.water_tmp)/500, animated: true)
        pro_oxy.setProgress(Float(dev_grp.dev_info[index].sys_var.oxygen)/300, animated: true)

       
        //        dev_grp.dev_info[index].cur_time =
//        dev_grp.dev_info[index].dev_cur_time
//        if ((dev_grp.dev_info[index].cur_time - dev_grp.dev_info[index].last_time)/1000 > 720)&&(dev_grp.dev_info[index].last_time != -1) {
//            dev_grp.dev_info[index].last_time = dev_grp.dev_info[index].last_time
//        }
        
//
        lab_update_time.text = "更新时间："+String(dev_grp.dev_info[index].sys_date.year)+"-"+String(dev_grp.dev_info[index].sys_date.mon)+"-"+String(dev_grp.dev_info[index].sys_date.day)+" "+String(dev_grp.dev_info[index].sys_date.hour)+":"+String(dev_grp.dev_info[index].sys_date.min)+":"+String(dev_grp.dev_info[index].sys_date.sec)
      
        
        if(dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x1 ) == 0x1 {
            img_contactor1.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor1.image = UIImage(named: "aerator_offline.png")
        }
        
        if(dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x2) == 0x2{
            img_contactor2.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor2.image = UIImage(named: "aerator_offline.png")
        }
        
        if(dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x4) == 0x4{
            img_contactor3.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor3.image = UIImage(named: "aerator_offline.png")
        }
        
        if(dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x8) == 0x8{
            img_contactor4.image = UIImage(named: "aerator_online.png")
        }
        else{
            img_contactor4.image = UIImage(named: "aerator_offline.png")
        }
        if dev_grp.dev_info[index].dev_type == 8 {
            if (dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x10) == 0x10{
                img_contactor4.image = UIImage(named: "aerator_online.png")
            }
            else
            {
                 img_contactor4.image = UIImage(named: "aerator_offline.png")
            }
            
            if (dev_grp.dev_info[index].sys_var.motor_stat_flag & 0x20) == 0x20{
                img_contactor4.image = UIImage(named: "aerator_online.png")
            }
            else
            {
                img_contactor4.image = UIImage(named: "aerator_offline.png")
            }
        }
    }
    
   
    
    //开关手势
//    func did_notice_switch_onclick(sender:UITapGestureRecognizer){
//        if self.dev_info_cell.sys_var.op_flag == 1 {
//            self.dev_info_cell.sys_var.op_flag = 0
//            img_notice_switch.image = UIImage(named: "off")
//        }
//        else{
//            self.dev_info_cell.sys_var.op_flag = 1
//            img_notice_switch.image = UIImage(named: "on")
//        }
//        
//    }
    
    //查询事件手势
//    func did_event_onclick(sender:UITapGestureRecognizer){
//        
//        print("时间查询手势响应")
//        
//    }
    
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
