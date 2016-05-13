//
//  comm_frame.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/7/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import Foundation



let USER_LOG_FRM:UInt8 = 0;
let USER_LOG_RSP_FRM:UInt8 = 1;
let DEV_REG_FRM:UInt8 = 2;
let DEV_REG_RSP_FRM:UInt8 = 3;
let REAL_DATA_FRM:UInt8 = 4;
let REAL_DATA_RSP_FRM:UInt8 = 5;
let SYS_CFG_FRM:UInt8 = 6;
let SYS_CFG_RSP_FRM:UInt8 = 7;
let MODE_CFG_FRM:UInt8 = 8;
let MODE_CFG_RSP_FRM:UInt8 = 9;
let EVENT_FRM:UInt8 = 0xa;
let EVENT_RSP_FRM:UInt8 = 0xb;
let HIS_INFO_FRM:UInt8 = 0xc;
let HIS_INFO_RSP_FRM:UInt8 = 0xd;
let ENT_DAY_7_FRM:UInt8 = 0xe;
let PUSH_INFO_FRM:UInt8 = 0x10;
let PUSH_INFO_RSP_FRM:UInt8 = 0x11;


//frame head
let DEV_ID_ADDR:UInt8	 = 0;
let DEV_ID_LEN:UInt8	 = 8;
let MANU_ID_ADDR:UInt8	 = DEV_ID_ADDR + DEV_ID_LEN
let MANU_ID_LEN:UInt8	 = 1
let DEV_TYPE_TERM:UInt8	= 1
let DEV_TYPE_FISH:UInt8	= 2
let DEV_TYPE_BARN:UInt8	= 5
let DEV_TYPE_FISH_SIG_CTRL:UInt8	= 6
let DEV_TYPE_FISH_MULTI_CTRL:UInt8	= 7
let DEV_TYPE_FISH_ONLY_CTRL:UInt8	= 8
let DEV_TYPE_FISH_DETECT_CTRL:UInt8	= 9
let DEV_TYPE_BARN_TMP:UInt8	= 10
let DEV_TYPE_FISH_FEED:UInt8	= 11
let DEV_TYPE_BARN_CO2:UInt8	= 12
let DEV_TYPE_FISH_PH:UInt8	= 13

let DEV_TYPE_ADDR:UInt8	 = MANU_ID_ADDR + MANU_ID_LEN;
let DEV_TYPE_LEN:UInt8	 = 1;
let FRM_TYPE_ADDR:UInt8	 = DEV_TYPE_ADDR + DEV_TYPE_LEN;
let FRM_TYPE_LEN:UInt8	 = 1;
let FRAME_LEN_ADDR:UInt8	 = FRM_TYPE_ADDR + FRM_TYPE_LEN;
let FRAME_LEN_LEN:UInt8	= 2;
let FRAME_HEAD_LEN:UInt8	 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
//  USER_LOG_FRM
let USER_LOG_TYPE_LOG:UInt8	= 0x0;
let USER_LOG_TYPE_REG:UInt8	= 0x1;
let USER_LOG_TYPE_CITY:UInt8	= 0x2;
let USER_LOG_TYPE_USER_MODIFY:UInt8	= 0x3;
let USER_LOG_TYPE_USER_CREATE:UInt8	= 0x4;
let USER_LOG_TYPE_ADDR:UInt8	 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
let USER_LOG_TYPE_LEN:UInt8	 = 1;
let USER_LOG_NAME_ADDR:UInt8	 = USER_LOG_TYPE_ADDR+USER_LOG_TYPE_LEN;
let USER_LOG_NAME_LEN:UInt8		= 32;
let USER_LOG_PWD_ADDR:UInt8	 = USER_LOG_NAME_ADDR+USER_LOG_NAME_LEN
let USER_LOG_PWD_LEN:UInt8		= 16;
let USER_LOG_DEV_NUM_ADDR:UInt8	 = USER_LOG_PWD_ADDR + USER_LOG_PWD_LEN;
let USER_LOG_DEV_NUM_LEN:UInt8	 = 1;
let USER_LOG_DEV_INFO_ADDR:UInt8 = USER_LOG_DEV_NUM_ADDR+USER_LOG_DEV_NUM_LEN;

//city_Reg
let USER_REG_CITY_ADDR:UInt8	 = USER_LOG_NAME_ADDR+USER_LOG_NAME_LEN
let USER_REG_CITY_LEN:UInt8	 = 4;
//user_reg
let USER_REG_DEV_CITY_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_REG_DEV_ID_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_REG_DEV_ID_LEN:UInt8	 = 16;
let USER_REG_DEV_NAME_ADDR:UInt8	 = USER_REG_DEV_ID_ADDR+USER_REG_DEV_ID_LEN;
let USER_REG_DEV_NAME_LEN:UInt8	 = 15;
let USER_REG_DEV_PWD_ADDR:UInt8	 = USER_REG_DEV_NAME_ADDR+USER_REG_DEV_NAME_LEN;
let USER_REG_DEV_PWD_LEN:UInt8	 = 16;

//user_modify
let USER_MODIFY_NAME_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_MODIFY_NAME_LEN:UInt8	 = 32;
let USER_MODIFY_PWD_ADDR:UInt8	 = USER_MODIFY_NAME_ADDR+USER_MODIFY_NAME_LEN;
let USER_MODIFY_PWD_LEN:UInt8	 = 16;

/*let USER_LOG_DEV_TYPE_LEN = 1;
	let USER_LOG_DEV_ID_LEN = DEV_ID_LEN;
	let USER_LOG_SYS_VER_LEN = 2;
	let USER_LOG_TIME_VER_LEN = 2;
	let USER_LOG_DEV_INFO_LEN = USER_LOG_DEV_TYPE_LEN+USER_LOG_DEV_ID_LEN
 +USER_LOG_SYS_VER_LEN+USER_LOG_TIME_VER_LEN;*/
//  USER_LOG_RSP_FRM
let USER_LOG_RSP_TYPE_LOG:UInt8	= 0x0
let USER_LOG_RSP_TYPE_REG:UInt8	= 0x1
let USER_LOG_RSP_TYPE_CITY:UInt8	= 0x2
let USER_LOG_RSP_TYPE_USER_MODIFY:UInt8	= 0x3
let USER_LOG_RSP_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN
let USER_LOG_RSP_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_RES_ADDR:UInt8	= USER_LOG_RSP_TYPE_ADDR+USER_LOG_RSP_TYPE_LEN
let USER_LOG_RSP_RES_LEN:UInt8	 = 1
let USER_LOG_RSP_CITY_ADDR:UInt8		=  USER_LOG_RSP_RES_ADDR+USER_LOG_RSP_RES_LEN
let USER_LOG_RSP_CITY_LEN:UInt8	 = 4
let USER_LOG_RSP_NUM_ADDR:UInt8		= USER_LOG_RSP_CITY_ADDR+USER_LOG_RSP_CITY_LEN
let USER_LOG_RSP_NUM_LEN:UInt8	 = 1
let USER_LOG_RSP_ID_TYPE_ADDR:UInt8	 = USER_LOG_RSP_NUM_ADDR+USER_LOG_RSP_NUM_LEN
let USER_LOG_RSP_ID_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_ID_LEN:UInt8	 = DEV_ID_LEN
let USER_LOG_RSP_DEV_NAME_LEN:UInt8	 = 15
let USER_LOG_RSP_MANU_ID_LEN:UInt8	 = 1
let USER_LOG_RSP_SYS_VER_LEN:UInt8	 = 2
let USER_LOG_RSP_MODE_VER_LEN:UInt8	 = 2
let USER_LOG_RSP_ID_TOL_LEN:UInt8	 = USER_LOG_RSP_ID_TYPE_LEN+DEV_ID_LEN+USER_LOG_RSP_DEV_NAME_LEN+USER_LOG_RSP_MANU_ID_LEN+USER_LOG_RSP_SYS_VER_LEN+USER_LOG_RSP_MODE_VER_LEN
let USER_LOG_RSP_USER_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_DIAL_ALARM_LEN:UInt8	 = 2
let USER_LOG_RSP_MSG_ALARM_LEN:UInt8	 = 2

//  REAL_DATA_FRM
let REAL_DATA_CITY_CODE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
let REAL_DATA_CITY_CODE_LEN:UInt8 = 4;
let REAL_DATA_LEN:UInt8 =  REAL_DATA_CITY_CODE_ADDR + REAL_DATA_CITY_CODE_LEN;
//	REAL_DATA_RSP_FRM
let MOTOR_STAT_MANU_ON:UInt8 = 1;
let 	MOTOR_STAT_MANU_OFF:UInt8 = 0;
let MOTOR_STAT_AUTO_OFF:UInt8 =	2;
let MOTOR_STAT_AUTO_ON:UInt8 = 3;
let MOTOR_STAT_TIME_ON:UInt8 = 5;
let MOTOR_STAT_TIME_OFF:UInt8 = 4;


let MAX_VAR_NUM:UInt8 =	16;
let	REAL_DATA_RSP_TIME_ADDR:UInt8 =	(FRAME_LEN_ADDR+FRAME_LEN_LEN);
let REAL_DATA_RSP_TIME_LEN:UInt8 =	4;
let REAL_DATA_SYS_VER_RSP_ADDR:UInt8 =	(REAL_DATA_RSP_TIME_ADDR+REAL_DATA_RSP_TIME_LEN);
let REAL_DATA_SYS_VER_RSP_LEN:UInt8	= 2;
let REAL_DATA_MODE_VER_RSP_ADDR:UInt8 = REAL_DATA_SYS_VER_RSP_ADDR+REAL_DATA_SYS_VER_RSP_LEN;
let REAL_DATA_MODE_VER_RSP_LEN:UInt8 = 2;
/*
	let REAL_DATA_SYS_CFG_RSP_ADDR = (REAL_DATA_MODE_VER_RSP_ADDR+REAL_DATA_MODE_VER_RSP_LEN);
	let REAL_DATA_SYS_CFG_RSP_LEN = 1;
 
	let REAL_DATA_MODE_CFG_RSP_ADDR = ( REAL_DATA_SYS_CFG_RSP_ADDR+REAL_DATA_SYS_CFG_RSP_LEN);
	let REAL_DATA_MODE_CFG_RSP_LEN = 1;
	*/
let	REAL_DATA_NUM_RSP_ADDR:UInt8 = REAL_DATA_MODE_VER_RSP_ADDR + REAL_DATA_MODE_VER_RSP_LEN ;
let	REAL_DATA_NUM_RSP_LEN:UInt8	= 2;
let	REAL_DATA_VAR_RSP_ADDR:UInt8	= (REAL_DATA_NUM_RSP_ADDR+REAL_DATA_NUM_RSP_LEN);
let	REAL_DATA_TYPE_WTMP:UInt8 =	1;
let	REAL_DATA_TYPE_WTMP_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_DO:UInt8	= 2;
let	REAL_DATA_TYPE_DO_LEN:UInt8 =	4;
let	REAL_DATA_TYPE_ATMP:UInt8	= 6;
let	REAL_DATA_TYPE_ATMP_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_STAT:UInt8	= 3;
let	REAL_DATA_TYPE_STAT_LEN:UInt8	= 1;
let	REAL_DATA_TYPE_TMP:UInt8 =	1;
let	REAL_DATA_TYPE_AWET:UInt8	= 8;
let	REAL_DATA_TYPE_AWET_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_SWET:UInt8	= 9;
let	REAL_DATA_TYPE_SWET_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_STMP:UInt8	= 15;
let	REAL_DATA_TYPE_STMP_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_CO2:UInt8	= 16;
let	REAL_DATA_TYPE_CO2_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_STAT_FLAG:UInt8	= 10;
let	REAL_DATA_TYPE_STAT_FLAG_LEN:UInt8 = 1;
let	REAL_DATA_TYPE_PH:UInt8	= 7;
let	REAL_DATA_TYPE_PH_LEN:UInt8 = 2;
let	REAL_DATA_TYPE_AM:UInt8	= 17;
let	REAL_DATA_TYPE_AM_LEN:UInt8 = 2;
let	REAL_DATA_TYPE_ROLL_STAT:UInt8	= 18;
let	REAL_DATA_TYPE_ROLL_STAT_LEN:UInt8 = 2;
//11-13 remain for tmp_wet sh
let	REAL_DATA_TYPE_OP_FLAG:UInt8	= 14;
let	REAL_DATA_TYPE_OP_FLAG_LEN:UInt8 = 1;
let	REAL_DATA_TYPE_FALSE:UInt8	= 0xff;

public class user_info_c
{
    var user_name:String?
    var user_pwd:String?
}
var user_info = user_info_c()

public class frame_head_info_c
{
    var dev_id = [UInt8](count: Int(DEV_ID_LEN), repeatedValue: 0)
    
    var  manu_id:UInt8?
    var dev_type:UInt8 = DEV_TYPE_TERM
    var	frame_type:UInt8?
}
var frame_head_info = frame_head_info_c()


class log_rsp
{
    var result:Int?
    var type:UInt8?
    var city_code:UInt?
    var dev_num:UInt8?
    
}
var log_rsp_data = log_rsp();

var USER_TYPE_NORMAL:UInt8 = 1;
var USER_TYPE_MNG:UInt8 = 2;
var USER_TYPE_SUPER:UInt8 = 3;

public class user_grp_c
{
	var weather = "未知";
    var day_weather:Int = 0;
    var night_weather:Int = 0;
	var tmp="未知";
	var day_tmp:Int?
	var night_tmp:Int?
	var city_name="未知";
	var hour_zone:Int?;
	var city_code="101010100";//peking
	var exit_login_flag:Int = 0;
    
	var user_type:UInt8 = USER_TYPE_NORMAL;
    var created:Bool = false;

	
	 //static public int[] td_weather = new int[8];
	// static public int[] tm_weather = new int[8];
	// static public int[] at_weather = new int[8];
    var data:String?;
	 //static public boolean pIntent_flag = true;
	 //static public String pIntent_title;
}
var user_grp = user_grp_c()

var dev_info_rsp:[dev_info_struct] = [dev_info_struct]()


var send_buf = [UInt8](count: 1024, repeatedValue: 0)

func copy_byte2int(buf_info buf:[UInt8],  buf_addr:Int)->UInt
{
    
    var a:UInt = UInt(buf[buf_addr])<<24
    var b:UInt = UInt(buf[buf_addr+1])<<16
    var c:UInt = UInt(buf[buf_addr+2])<<8
    var d:UInt = UInt(buf[buf_addr+3])
    // b = (int)buf[buf_addr+1]&0xff;
    var data:UInt = (a|b|c|d);
    return data
}

func copy_byte2short(buf_info buf:[UInt8],  buf_addr:Int)->UInt16
{
    
    var a:UInt16 = UInt16(buf[buf_addr])
    var b:UInt16 = UInt16(buf[buf_addr+1])
    a = (a&0xff)<<8;
   // b = (int)buf[buf_addr+1]&0xff;
    var data:UInt16 = (a|b);
    return data;
}

func copy_int2byte(inout buf_info buf:[UInt8], start buf_addr:Int, data_i data:UInt)
{
    buf[buf_addr] = UInt8((data>>24)&0xff);
    buf[buf_addr+1] = UInt8((data>>16)&0xff);
    buf[buf_addr+2] = UInt8((data>>8)&0xff);
    buf[buf_addr+3] = UInt8(data&0xff);
}

func  GetCheckCode(buf_info buf:[UInt8], frame_len len:Int)->UInt16
{
    
    var wCrc:UInt16  = 0xFFFF;
    
    for i in 0 ..< len
    {
        wCrc ^= (UInt16(buf[i]) & 0xff)
        for j in 0..<8
        {
            if ((wCrc & 1)==1)
            {
                wCrc = wCrc >> 1;
                wCrc ^= 0xA001;
            }
            else
            {
                wCrc = wCrc >> 1;
            }
        }
    }
    return wCrc;
}

func CheckCode(buf_info buf:[UInt8], frame_len len:Int)->Bool
{

    var wCrc:UInt16 = 0xFFFF
   
    for i in 0..<(len-2)
    {
        wCrc ^= (UInt16(buf[i]) & 0xff)
        for j in 0..<8
        {
            if ((wCrc & 1)==1)
            {
                wCrc = wCrc >> 1
                wCrc ^= 0xA001;
            }
            else
            {
                wCrc = wCrc >> 1
            }
        }
    }
    var ori_crc:UInt16 = copy_byte2short(buf_info:buf, buf_addr:len-2);
    return (wCrc==ori_crc);
}

func copy_array_cc(inout dst_in dst:[UInt8],src_in  src:[Int8], dst_start dst_start_addr:Int,  src_start src_start_addr:Int, arr_len len:Int)
{
    
    for i in 0..<len
    {
        dst[dst_start_addr+i] = UInt8(src[src_start_addr+i])
    }
}

func copy_array(inout dst_in dst:[UInt8],src_in  src:[UInt8], dst_start dst_start_addr:Int,  src_start src_start_addr:Int, arr_len len:Int)
{
    
    for i in 0..<len
    {
        dst[dst_start_addr+i] = src[src_start_addr+i]
    }
}
func array_equal(dst dst:[UInt8], src src:[UInt8], frame_len len:Int)->Bool
{
    for i in 0..<len
    {
        if(dst[i] != src[i])
        {
            return false
        }
    }
    return true
}

func get_32bit_to_rtc(sys_date date:sys_date_c, smp_time_in smp_time:UInt)
{
    date.year = ((smp_time >> 26) & 0x3f) + 2010;
    date.mon = (smp_time >> 22) & 0xf;
    date.day = (smp_time >> 17) & 0x1f;
    date.hour = (smp_time >> 12) & 0x1f;
    date.min = (smp_time >> 6) & 0x3f;
    date.sec = smp_time  & 0x3f;

}

func frame_analysis(buf_info buf:[UInt8], frame_len rsp_len:Int)->Int
{
    var addr:Int = 0;
    var len:Int = 0;
    if(CheckCode(buf_info:buf, frame_len: rsp_len) == false)
    {
        return -1;
    }
    
    if((buf[9] == 0x1))
    {
        switch (buf[10]) {
        case USER_LOG_RSP_FRM:
            
            log_rsp_data.result = Int(buf[Int(USER_LOG_RSP_RES_ADDR)]);
            log_rsp_data.type = buf[Int(USER_LOG_RSP_TYPE_ADDR)];
            
            if (log_rsp_data.type == USER_LOG_RSP_TYPE_LOG) || (log_rsp_data.type == USER_LOG_RSP_TYPE_REG)
            {
             
            }
            else
            {
            }
            
            if(log_rsp_data.result != 0)
            {
                return log_rsp_data.result!;
            }
            
            if (buf[Int(USER_LOG_RSP_TYPE_ADDR)] == USER_LOG_RSP_TYPE_LOG)
            {
                addr = Int(USER_LOG_RSP_ID_TYPE_ADDR)
                for i in 0..<buf[Int(USER_LOG_RSP_NUM_ADDR)]
                {
                    dev_info_rsp.append(dev_info_struct())
                                   
                    dev_info_rsp[Int(i)].dev_type = buf[addr];
                    addr += Int(USER_LOG_RSP_ID_TYPE_LEN)
                    copy_array(dst_in: &dev_info_rsp[Int(i)].dev_id, src_in:buf, dst_start:0, src_start:addr, arr_len:Int(USER_LOG_RSP_ID_LEN))
                    addr += Int(USER_LOG_RSP_ID_LEN)
                    copy_array(dst_in: &dev_info_rsp[Int(i)].dev_name, src_in:buf, dst_start:0, src_start:addr ,arr_len:Int(USER_LOG_RSP_DEV_NAME_LEN))
                    addr += Int(USER_LOG_RSP_DEV_NAME_LEN)
                    dev_info_rsp[Int(i)].manu_id=buf[addr]
                    addr += Int(USER_LOG_RSP_MANU_ID_LEN)
                    dev_info_rsp[Int(i)].sys_ver = copy_byte2short(buf_info:buf, buf_addr:addr);
                    addr += Int(USER_LOG_RSP_SYS_VER_LEN)
                    dev_info_rsp[Int(i)].mode_ver = copy_byte2short(buf_info:buf, buf_addr:addr);
                    addr += Int(USER_LOG_RSP_MODE_VER_LEN)
                    
                    var dev_num_stat:Int = 0
                    
                    for j in 0..<dev_grp.dev_login_num
                    {
                       if(array_equal(dst:dev_info_rsp[Int(i)].dev_id, src:dev_grp.dev_info[Int(j)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)
                        {
                            //(log_rsp_data.dev_info[i].sys_ver!=(short)0xffff)&&
                            if(dev_info_rsp[Int(i)].sys_ver != dev_grp.dev_info[j].sys_ver)
                            {
                                if(dev_info_rsp[Int(i)].dev_type != DEV_TYPE_FISH_ONLY_CTRL)
                                {
                                    dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                                    //sync
                                    dev_info_rsp[Int(i)].sys_ver = dev_grp.dev_info[j].sys_ver;
                                }
                            }
                            else
                            {
                                dev_info_rsp[Int(i)].flag &= ~dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            }
                            //(log_rsp_data.dev_info[i].mode_ver!=(short)0xffff)&&
                            if((dev_info_rsp[Int(i)].mode_ver != dev_grp.dev_info[j].mode_ver))
                            {
                                dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                                dev_info_rsp[Int(i)].mode_ver = dev_grp.dev_info[j].mode_ver;
                                //sync
                            }
                            else
                            {
                                dev_info_rsp[Int(i)].flag &= ~dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                            }
                            //log_rsp_data.dev_info[i].mode_ver = comm_frame.dev.dev_info[j].mode_ver;
                            
                            break;
                        }
                        dev_num_stat+=1
                    }
                
                    if(dev_num_stat == dev_grp.dev_login_num)//no this dev, init to 0xffff
                    {
                        if(dev_info_rsp[Int(i)].sys_ver != 0xffff)
                        {
                            dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            dev_info_rsp[Int(i)].sys_ver = 0xffff;
                            //sync
                        }
                        
                        if(dev_info_rsp[Int(i)].mode_ver != 0xffff)
                        {
                            dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                            dev_info_rsp[Int(i)].mode_ver = 0xffff;
                            //sync
                        }
                        
                    }
                    
                }
                dev_grp.dev_login_num = Int(buf[Int(USER_LOG_RSP_NUM_ADDR)])
                len = Int(Int(USER_LOG_RSP_ID_TYPE_ADDR) + Int(USER_LOG_RSP_ID_TOL_LEN) * Int(dev_grp.dev_login_num))
                user_grp.user_type =  buf[len]
                len += Int(USER_LOG_RSP_USER_TYPE_LEN)
                if(dev_grp.dev_info.count < dev_info_rsp.count)
                {
                    for i in dev_grp.dev_info.count..<dev_info_rsp.count
                    {
                        dev_grp.dev_info.append(dev_info_struct())
                    }
                }
                
                for i in 0..<dev_grp.dev_login_num
                {
                    dev_grp.dev_info[i].dev_type = dev_info_rsp[i].dev_type;
                    copy_array(dst_in: &dev_grp.dev_info[i].dev_id, src_in:dev_info_rsp[i].dev_id, dst_start:0, src_start:0, arr_len:Int(USER_LOG_RSP_ID_LEN))
                  
                    copy_array(dst_in: &dev_grp.dev_info[i].dev_name, src_in:dev_info_rsp[i].dev_name, dst_start:0, src_start:0, arr_len:Int(USER_LOG_RSP_DEV_NAME_LEN))
                    dev_grp.dev_info[i].manu_id = dev_info_rsp[i].manu_id;
                    //	comm_frame.dev.dev_info[i].mode_ver = log_rsp_data.dev_info[i].mode_ver;
                    //	comm_frame.dev.dev_info[i].sys_ver = log_rsp_data.dev_info[i].sys_ver;
                    var flag:UInt8 = dev_grp.dev_info[i].flag & dev_grp.DEV_ONLINE_FLAG
                    dev_grp.dev_info[i].flag = dev_info_rsp[i].flag;
                    
                    dev_grp.dev_info[i].flag |= flag;
                    dev_grp.dev_info[i].msg_alarm=copy_byte2short(buf_info:buf, buf_addr:len);
                    len += Int(USER_LOG_RSP_MSG_ALARM_LEN);
                    dev_grp.dev_info[i].dial_alarm=copy_byte2short(buf_info:buf, buf_addr:len);
                    len += Int(USER_LOG_RSP_DIAL_ALARM_LEN);
                }
                
            }
            if (buf[Int(USER_LOG_RSP_TYPE_ADDR)] == USER_LOG_RSP_TYPE_REG)
            {
                
            }
        case REAL_DATA_RSP_FRM:
            copy_array(dst_in: &frame_head_info.dev_id, src_in:send_buf, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
            // int dev_index = 0;
           // byte[] dev_id = new byte[DEV_ID_LEN];
           // System.arraycopy(buf, DEV_ID_ADDR, dev_id, 0, DEV_ID_LEN);
            
            var dev_index:Int = 0
            for i in 0..<dev_grp.dev_login_num
            {
                if(array_equal(dst:frame_head_info.dev_id, src:dev_grp.dev_info[Int(i)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)

                {
                    //real_data_rsp_data.sys_ver = comm_frame.dev.dev_info[i].sys_ver;
                    dev_index = i;
                    dev_grp.dev_info[dev_index].real_data_rsp_info.dev_index = UInt(i)
                    dev_grp.dev_info[dev_index].req_flag = 0x1;
                    dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_SYS_VER_RSP_ADDR));
                    dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_MODE_VER_RSP_ADDR));
                    
                    if((dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver != dev_grp.dev_info[Int(i)].mode_ver))
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag  |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG
                        dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver = dev_grp.dev_info[i].mode_ver
                       // FullIntent.mode_sync_dev_index = i;
                        //sync
                    }
                    else
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag &= ~dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                    }
                    
                    if((dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver != dev_grp.dev_info[i].sys_ver))
                    {
                        if(dev_grp.dev_info[dev_index].dev_type != DEV_TYPE_FISH_ONLY_CTRL)
                        {
                            dev_grp.dev_info[dev_index].real_data_rsp_info.flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver = dev_grp.dev_info[i].sys_ver;
                           // FullIntent.sys_sync_dev_index = i;
                        }
                        //sync
                    }
                    else
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag &= ~dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                    }
                    break
                    
                }
            }
            dev_grp.dev_info[dev_index].manu_id = buf[Int(MANU_ID_ADDR)]&0xf
            
            
            //14725836914
            addr = Int(REAL_DATA_VAR_RSP_ADDR)
            dev_grp.dev_info[dev_index].sys_var.var_num = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_NUM_RSP_ADDR))
            
            dev_grp.dev_info[dev_index].smp_time = copy_byte2int(buf_info:buf, buf_addr:Int(REAL_DATA_RSP_TIME_ADDR))
            get_32bit_to_rtc(sys_date:dev_grp.dev_info[dev_index].sys_date, smp_time_in: dev_grp.dev_info[dev_index].smp_time!)
            //Log.e(""+dev_index, ""+i);
           
             
           /*
             comm_frame.dev.dev_info[dev_index].cur_time = System.currentTimeMillis();
            comm_frame.dev.dev_info[dev_index].dev_cur_time = System.currentTimeMillis();
            //Log.e("comm_frame","comm_frame dev_cur_time"+comm_frame.dev.dev_info[dev_index].dev_cur_time);
            //Log.e("comm_frame","comm_frame  cur_time_long  !!!!!!! "+(Math.abs(System.currentTimeMillis()-comm_frame.dev.dev_info[dev_index].dev_cur_time)/1000));
            //Log.e("comm_frame","comm_frame last_time_long  !!!!!!! "+(Math.abs(System.currentTimeMillis()-comm_frame.dev.dev_info[dev_index].last_time)/1000));
            comm_frame.dev.dev_info[dev_index].last_time = get_last_time(dev_index);
            //Log.e("comm_frame","comm_frame last_time"+comm_frame.dev.dev_info[dev_index].last_time);
            comm_frame.dev.dev_info[dev_index].cal_num = 0;
            comm_frame.dev.dev_info[dev_index].send_num = 0;
            if(((Math.abs(comm_frame.dev.dev_info[dev_index].cur_time-comm_frame.dev.dev_info[dev_index].last_time)/1000)>(720))
                &&(comm_frame.dev.dev_info[dev_index].last_time != -1))
            {
                comm_frame.dev.dev_info[dev_index].last_time = comm_frame.dev.dev_info[dev_index].last_time;
                //Log.e("comm_frame","comm_frame last_time  ~~~~~~if~~~~~`` "+comm_frame.dev.dev_info[dev_index].last_time);
            }
           */
            for i in 0..<dev_grp.dev_info[dev_index].sys_var.var_num
            {
                switch (buf[addr])
                {
                case REAL_DATA_TYPE_WTMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_WTMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.water_tmp = Int(copy_byte2int(buf_info:buf, buf_addr:addr))
                   /* int index = comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index;
                    comm_frame.dev.dev_info[dev_index].var.water_tmp_array[index] = comm_frame.dev.dev_info[dev_index].var.water_tmp;
                    comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index++;
                    if(comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index >= dev.DEV_VAR_ARRAY_LEN)
                    {
                        comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index = 0;
                    }*/
                    addr += Int(REAL_DATA_TYPE_WTMP_LEN)
                    
                case REAL_DATA_TYPE_DO:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_DO;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.oxygen = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_DO_LEN)
                    
                case REAL_DATA_TYPE_ATMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_ATMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.air_tmp = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_ATMP_LEN)
                    
                case REAL_DATA_TYPE_STAT:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STAT;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.motor_stat = buf[addr];
                    addr += Int(REAL_DATA_TYPE_STAT_LEN)
                    
                case REAL_DATA_TYPE_AWET:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_AWET;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.air_wet = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_AWET_LEN)
                   
                case REAL_DATA_TYPE_SWET:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_SWET;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.soil_wet = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_SWET_LEN)
                    
                case REAL_DATA_TYPE_STMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.soil_tmp = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_STMP_LEN)
                    
                case REAL_DATA_TYPE_CO2:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_CO2;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.co2 = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_STMP_LEN)
                   
                case REAL_DATA_TYPE_STAT_FLAG:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STAT_FLAG;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.motor_stat_flag = buf[addr];
                    addr += Int(REAL_DATA_TYPE_STAT_FLAG_LEN)
                    
                case REAL_DATA_TYPE_PH:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_PH;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.water_ph = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_PH_LEN)
                   
                    /*		case REAL_DATA_TYPE_FALSE:
                     addr += 1
                     break;*/
                case REAL_DATA_TYPE_ROLL_STAT:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_ROLL_STAT;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.roll_stat = copy_byte2short(buf_info:buf, buf_addr:addr)
                    addr += Int(REAL_DATA_TYPE_ROLL_STAT_LEN)
                    
                case REAL_DATA_TYPE_OP_FLAG:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_OP_FLAG;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.op_flag = buf[addr];
                    addr += Int(REAL_DATA_TYPE_OP_FLAG_LEN)
                    
                default:
                    var i = 1
                    //接收参数
                }
            }
        default:
            return -2
        }
    }
    return 0
}

func  frame_make(dev_type:UInt8, frame_type:UInt8, child_type:UInt8, dev_index:UInt8 ) ->Int
{
    var frame_len:UInt16 = 0
    var len:Int = 0
    
    copy_array(dst_in: &send_buf, src_in:frame_head_info.dev_id, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
    send_buf[Int(MANU_ID_ADDR)] = frame_head_info.manu_id ?? 1
    send_buf[Int(DEV_TYPE_ADDR)] = frame_head_info.dev_type ?? 0
    switch frame_type
    {
    case USER_LOG_FRM:
        if(child_type == USER_LOG_TYPE_LOG)
        {
            //frame_head_info.frame_type = frame_type;
            send_buf[Int(FRM_TYPE_ADDR)] = frame_type
            send_buf[Int(USER_LOG_TYPE_ADDR)] = child_type;
            
            var arr_str = user_info.user_name?.cStringUsingEncoding(NSUTF8StringEncoding)
            copy_array_cc(dst_in: &send_buf, src_in:arr_str!, dst_start:Int(USER_LOG_NAME_ADDR) , src_start:0, arr_len:arr_str!.count)
            
            
            arr_str = user_info.user_pwd?.cStringUsingEncoding(NSUTF8StringEncoding)
            copy_array_cc(dst_in: &send_buf, src_in:arr_str!, dst_start:Int(USER_LOG_PWD_ADDR) , src_start:0, arr_len:arr_str!.count)
            //System.arraycopy(frame_log_info.passwd, 0, buf, USER_LOG_PWD_ADDR, USER_LOG_PWD_LEN);
            //buf[USER_LOG_DEV_NUM_ADDR] = (byte)dev.dev_login_num;
            len =  Int(USER_LOG_PWD_ADDR +  USER_LOG_PWD_LEN);
        }
            
        
        frame_len = UInt16(len - Int(FRAME_HEAD_LEN))
        send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
        send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
            
    case REAL_DATA_FRM:
            var  city_code:UInt  = 1//user_grp.city_code;
            copy_int2byte(buf_info:&send_buf, start:Int(REAL_DATA_CITY_CODE_ADDR), data_i:city_code);
            frame_len = UInt16(REAL_DATA_LEN - REAL_DATA_CITY_CODE_ADDR);
         
            send_buf[Int(FRM_TYPE_ADDR)] = frame_type;
            send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
            send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
            len = Int(REAL_DATA_LEN)
        
    case HIS_INFO_FRM:
        send_buf.append(0x76)
    default:
        send_buf.append(0x76)
        
    }
    var crc_data:UInt16 = GetCheckCode(buf_info:send_buf, frame_len:len)
    send_buf[len] = UInt8(crc_data>>8);
    len += 1;
    send_buf[len] = UInt8(crc_data&0xff);
    len += 1;
    return len
}
/*
class comm_send:UIViewController,GCDAsyncUdpSocketDelegate{
    
 

    func send_frame(frame_len: Int)
    {
        //send login reqsend_buf.append(0x86)
        var address = "192.168.2.101"
        // var address = "114.215.180.76"
        var port:UInt16 = 23458
        var socket:GCDAsyncUdpSocket! = nil
        //    var socketReceive:GCDAsyncUdpSocket! = nil
        var error : NSError?
        
        
        
        //  var send_buf = UInt8[](count: 1024, repeatedValue: 0)
        // var send_buf = Array<UInt8>()
        // send_buf.append(0x86)
        //send_buf.append(0x99)
        // send_buf.append(0x24)
        
        
        
        // var message = NSData(bytes: send_buf as [UInt8], length: send_buf.count)
        var message = NSData(bytes: send_buf , length: frame_len)
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        socket.sendData(message, toHost: address, port: port, withTimeout: 10000, tag: 0)
        do {
            //    try socket.enableBroadcast(true)
            try socket.beginReceiving()
        } catch {
            print(error)
        }
    }
        func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,  withFilterContext filterContext: AnyObject!)
    {
        let count = data.length / sizeof(UInt8)
        
        // create an array of Uint8
        var array = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&array, length:count * sizeof(UInt8))
        print("incoming message: \(data)");
    }
 
}
*/