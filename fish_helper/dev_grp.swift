//
//  dev_grp.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/11/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import Foundation

var LOGIN_PWD_STR:Int = 1;
var LOGIN_AUTO_LOGIN:Int  = 2
var  HIS_INFO_ITEM_NUM:Int = 24*6;
var  HIS_INFO_ITEM_OVERLAP_DAY:Int = 7;
var  HIS_INFO_ITEM_NUM_OVERLAP:Int = 24*6*HIS_INFO_ITEM_OVERLAP_DAY;
var  HIS_INFO_HOUR_NUM:Int = 24;
var  HISTORY_BARN_DAY_MAX_NUM:Int = 7;
var  MAX_EVENT_NUM:Int = 10;

public class his_load_date
{
    var year:Int?
    var mon:Int?
    var day:Int?
}

class event_st
{
    var ver:UInt16?
    var type:UInt8?
    var stat:UInt8?
    var timestamp:UInt?
}

public class sys_cfg_var_class
{
    var sys_var_num:UInt16?
    var sys_var_type:[UInt8]?
    var do_min:UInt16?
    var do_min1:UInt16?
    var do_min2:UInt16?
    var do_min3:UInt16?
    var do_min4:UInt16?
    var do_max:UInt16?
    var do_up:UInt16?
    var salt_cfg:UInt16?
    var tmp_air_min:UInt16?
    var tmp_air_max:UInt16?
    var wet_air_min:UInt16?
    var wet_air_max:UInt16?
    var wet_soil_min:UInt16?
    var wet_soil_max:UInt16?
    var tmp_wt_min:UInt16?
    var tmp_wt_max:UInt16?
    var tmp_air_max1:UInt16?
    var tmp_air_max2:UInt16?
    var tmp_air_max3:UInt16?
    var tmp_air_max4:UInt16?
    var tmp_air_normal:UInt16?
    var tmp_soil_min:UInt16?
    var tmp_soil_max:UInt16?
}

public class real_data_rsp
{
    var dev_id:[UInt8] = [UInt8](count: 8, repeatedValue: 0)
    var dev_index:UInt?
    var sys_ver:UInt16?
    var mode_ver:UInt16?
    var event_ver:UInt16?
    var flag:UInt8?
}

struct dev_info_struct
{
    
    
    /* public sys_date date;
     public sys_date event_date;
     public sys_var var;
     public byte his_day_type;
     public short his_data_num;
     public byte his_data_yday_num;
     public byte his_data_y2day_num;
     public byte his_data_today_num;
     public byte his_data_y7day_num;
     var his_data_today_time:UInt
     public his_load_date his_data_y7day_time=new his_load_date();
     public his_load_date his_data_y2day_time=new his_load_date();
     public his_load_date his_data_yday_time=new his_load_date();
     public byte his_data_day_cache; //1 yday, 2y2day, 4today 8 y7day
     public byte his_date_type;
     public boolean[] his_data_y7day_draw = new boolean[]{true,true,true,true,true,true,true};
     public his_info_item_class[] his_info_real_item;
     public his_info_item_class[] his_info_today_item;
     public his_info_item_class[] his_info_yday_item;
     public his_info_item_class[] his_info_y2day_item;
     public his_info_item_class[] his_info_ymoreday_item;
     public his_info_item_class[] his_info_y3day_item;
     public his_info_item_class[] his_info_y4day_item;
     public his_info_item_class[] his_info_y5day_item;
     public his_info_item_class[] his_info_y6day_item;
     public his_info_item_class[] his_info_y10day_item;
     public his_info_item_class[] his_info_y8day_item;
     public his_info_item_class[] his_info_y9day_item;
     public his_info_item_class[] his_info_item;
     public List<dev_group.his_info_item_class[]> his_info_y7day_item;*/
    var sys_adj_type:UInt8?
    var sys_adj_tmp:Float?
    var dev_id = [UInt8](count: Int(USER_LOG_RSP_ID_LEN), repeatedValue: 0)
    var manu_id:UInt8?
    var dev_name = [UInt8](count: Int(USER_LOG_RSP_DEV_NAME_LEN), repeatedValue: 0)
    var dev_pwd:[UInt8] = [UInt8]()
    var fish_type:[UInt8] = [UInt8]()
    var	dev_type:UInt8?
    var pool_type:UInt8?
    var pool_area:UInt16?
    var pool_depth:UInt8?
    var fish_num:UInt?
    var sys_ver:UInt16?
    var mode_ver:UInt16?
    var event_type:UInt8?
    var event_num:UInt8?
    var  event_info:[event_st] = [event_st]()
    var smp_time:UInt?
    var dev_cur_time:Int = -1;
    var last_time:UInt?
    var cur_time:UInt?
    var cal_num:UInt?
    var send_num:UInt?
    var send_cnt:UInt?
    var flag:Int = 0
    var req_flag:UInt8?
    var dial_alarm:UInt16?
    var msg_alarm:UInt16?
    var Offline_detect_flag:UInt8?
    var low_ox_cnt:UInt8?
    var sys_cfg_var:sys_cfg_var_class = sys_cfg_var_class()
    var his_barn_day_num:UInt8?
    // public history_barn_day_item_st[] his_barn_day_item;
    var real_data_rsp_info:real_data_rsp =  real_data_rsp()
   
}

class dev_group
{
    var dev_login_num:Int = 0;
    var dev_online_num:Int = 0;
    var DEV_REG_NUM:Int = 32;
    var DEV_GRP_FLAG_REG:Int = 0x1;
    var dev_grp_flag:Int = 0;
    
    var  DEV_MODE_CFG_SYNC_SYS_FLAG = 0x1;
    var  DEV_MODE_CFG_SYNC_MODE_FLAG = 0x2;
    var  DEV_MODE_CFG_REQ_EVENT_FLAG = 0x4;
    var  DEV_ONLINE_FLAG = 0x8;
    var dev_info:[dev_info_struct] = [dev_info_struct]()   
}

var dev_grp = dev_group()