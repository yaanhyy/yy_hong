//
//  TimeCfgViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/26.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class TimeCfgViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
  
    @IBOutlet weak var tab_time_cfg: UITableView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tab_time_cfg.dataSource = self
        tab_time_cfg.delegate = self
        
        if TimeCfgInfo.time_cfg_num == 0
        {
            TimeCfgInfo.time_cfg_num += 1
        }
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{ return 1}
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{ return Int(TimeCfgInfo.time_cfg_num)}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "time_cfg_cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
        //下面两个属性对应subtitle
//        cell.textLabel
//        cell.textLabel?.text = baby[indexPath.row]
//        cell.detailTextLabel?.text = "baby\(indexPath.row)"
//        
//        //添加照片
//        cell.imageView?.image = UIImage(named: babyImage[indexPath.row])
//        cell.imageView!.layer.cornerRadius = 40
//        cell.imageView!.layer.masksToBounds = true
//        
//        //添加附件
//        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
//        if isFlag[indexPath.row] {
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }else{
//            cell.accessoryType = UITableViewCellAccessoryType.None
//        }
        return cell
    }
    
    
    @IBAction func did_btn_add_onclick(sender: AnyObject) {
        
    }
    
    @IBAction func did_btn_cancel_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func did_btn_reback_onclick(sender: AnyObject) {
         self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
//    @IBAction func did_btn_cancel_onclick(sender: AnyObject) {
//        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
//    }
}

class TimeCfgInfo
{
   
    struct time_cfg_info_st
    {
        var start_hour:UInt8 = 0
        var start_min:UInt8 = 0
        var start_year:UInt8 = 0
        var start_mon:UInt8 = 0
        var start_day:UInt8 = 0
        
        var end_hour:UInt8 = 0
        var end_min:UInt8 = 0
        var end_year:UInt8 = 0
        var end_mon:UInt8 = 0
        var end_day:UInt8 = 0
        var cfg_stat:UInt8 = 0
        //var cur_time_cfg_stat_mode:UInt8 = 0
    }
    
    class TimeCfgInfo
    {
        var i:Int = 0
        var cur_time_cfg_start_hour:Int = 0
        var cur_time_cfg_start_min:Int = 0
        var cur_time_cfg_end_hour:Int = 0
        var cur_time_cfg_end_min:Int = 0
        var cur_time_cfg_stat:Int = 0
        var cur_search_id:Int = 0
        var time_cfg_num:Int = 0
				
    }
    var	cur_search_id:UInt8 = 0
    var cur_time_cfg_start_hour:UInt8 = 0
    var cur_time_cfg_start_min:UInt8 = 0
    var cur_time_cfg_start_year:UInt8 = 0
    var cur_time_cfg_start_mon:UInt8 = 0
    var cur_time_cfg_start_day:UInt8 = 0
    
    var cur_time_cfg_end_hour:UInt8 = 0
    var cur_time_cfg_end_min:UInt8 = 0
    var cur_time_cfg_end_year:UInt8 = 0
    var cur_time_cfg_end_mon:UInt8 = 0
    var cur_time_cfg_end_day:UInt8 = 0
    var cur_time_cfg_stat:UInt8 = 0
    //	var cur_time_cfg_stat_mode:UInt8 = 0
    
    var time_cfg_info:[time_cfg_info_st] = []
    static var time_cfg_num:UInt8 = 0
}

