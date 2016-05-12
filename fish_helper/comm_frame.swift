//
//  comm_frame.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/7/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import Foundation
import CocoaAsyncSocket


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

public class user_info_c
{
    var user_name:String?
    var user_pwd:String?
}
var user_info = user_info_c()

public class frame_head_info_c
{
    var dev_id = [UInt8](count: 8, repeatedValue: 0)
    
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


func copy_byte2short(buf_info buf:[UInt8],  buf_addr:Int)->UInt16
{
    
    var a:UInt16 = UInt16(buf[buf_addr])
    var b:UInt16 = UInt16(buf[buf_addr+1])
    a = (a&0xff)<<8;
   // b = (int)buf[buf_addr+1]&0xff;
    var data:UInt16 = (a|b);
    return data;
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
                    var flag:Int = dev_grp.dev_info[i].flag & Int(dev_grp.DEV_ONLINE_FLAG)
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
    
    // System.arraycopy(frame_head_info.dev_id, 0, buf, DEV_ID_ADDR,  DEV_ID_LEN)
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
        send_buf.append(0x76)
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