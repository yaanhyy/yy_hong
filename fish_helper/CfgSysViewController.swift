//
//  CfgSysViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/23.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

var sys_dev_index:Int = 0
class CfgSysViewController:UIViewController, GCDAsyncUdpSocketDelegate{
    
 
    @IBOutlet weak var tex_do_min1_cfg: UITextField!
    
    @IBOutlet weak var tex_do_min2_cfg: UITextField!
    
    @IBOutlet weak var tex_do_min3_cfg: UITextField!
    @IBOutlet weak var tex_do_max_cfg: UITextField!
    @IBOutlet weak var tex_do_top_cfg: UITextField!
    @IBOutlet weak var tex_salinity_cfg: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[sys_dev_index].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
        var len = frame_make( 0, frame_type: SYS_CFG_FRM, child_type:SYS_CFG_TYPE_SYNC,  dev_index:sys_dev_index)
        self.send_frame(len:len, manu: dev_grp.dev_info[sys_dev_index].manu_id)

        
    }
    
    func set_value_detect_do(data input:Float)->Int
    {
        
        
        if ((input<0) || (input>25)){
            return  -1
        }
        return 0
    }
    
    @IBAction func did_cfg_sys_onclick(sender: AnyObject) {
        var data:String?
        var data_f:Float = 0
        var dev_index = sys_dev_index
        var res:Int = 0
        
        
        
        if((dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_SIG_CTRL)||(dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_DETECT_CTRL))
        {
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num = 7;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[0] = SYS_CFG_INFO_TYPE_DO_MAX;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[1] = SYS_CFG_INFO_TYPE_DO_MIN1;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[2] = SYS_CFG_INFO_TYPE_DO_MIN2;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[3] = SYS_CFG_INFO_TYPE_DO_MIN3;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[4] = SYS_CFG_INFO_TYPE_DO_MIN4;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[5] = SYS_CFG_INFO_TYPE_DO_UP;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[6] = SYS_CFG_INFO_TYPE_SALT;
        }
        else if((dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_FEED)||(dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_PH))
        {
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num = 6;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[0] = SYS_CFG_INFO_TYPE_DO_MAX;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[1] = SYS_CFG_INFO_TYPE_DO_MIN1;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[2] = SYS_CFG_INFO_TYPE_DO_MIN2;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[3] = SYS_CFG_INFO_TYPE_DO_MIN3;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[4] = SYS_CFG_INFO_TYPE_DO_UP;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[5] = SYS_CFG_INFO_TYPE_SALT;
        }
        else if(dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_MULTI_CTRL)
        {
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num = 6;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[0] = SYS_CFG_INFO_TYPE_DO_MAX;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[1] = SYS_CFG_INFO_TYPE_DO_MIN;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[2] = SYS_CFG_INFO_TYPE_DO_UP;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[3] = SYS_CFG_INFO_TYPE_SALT;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[4] = SYS_CFG_INFO_TYPE_WT_TMP_MAX;
            dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[5] = SYS_CFG_INFO_TYPE_WT_TMP_MIN;
        }
        
        for i in 0..<dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num
        {
            switch (dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[Int(i)])
            {
            case SYS_CFG_INFO_TYPE_DO_MAX:
                data = tex_do_max_cfg.text
                if(data == nil)
                {
                     return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                
                
                dev_grp.dev_info[dev_index].sys_cfg_var.do_max = UInt16(data_f*10);
                
                //comm_frame.dev.dev_info[dev_index].sys_cfg_var.do_max,
                break
            case SYS_CFG_INFO_TYPE_DO_MIN:
                data = tex_do_min1_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }

                dev_grp.dev_info[dev_index].sys_cfg_var.do_min = UInt16(data_f*10);
                //comm_frame.dev.dev_info[dev_index].sys_cfg_var.do_max,
                break;
            case SYS_CFG_INFO_TYPE_DO_UP:
                data = tex_do_top_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                dev_grp.dev_info[dev_index].sys_cfg_var.do_up = UInt16(data_f*10);
                break;
            case SYS_CFG_INFO_TYPE_SALT:
                data = tex_salinity_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
               // res = set_value_detect_do(data: data_f)
              //  if(res != 0)
              //  {
               //     return;
               // }
                dev_grp.dev_info[dev_index].sys_cfg_var.salt_cfg = UInt16(data_f*10);
                break;
            case SYS_CFG_INFO_TYPE_DO_MIN1:
                data = tex_do_min1_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                dev_grp.dev_info[dev_index].sys_cfg_var.do_min1 = UInt16(data_f*10);
                break;
            case SYS_CFG_INFO_TYPE_DO_MIN2:
                data = tex_do_min2_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                dev_grp.dev_info[dev_index].sys_cfg_var.do_min2 = UInt16(data_f*10);
                break;
            case SYS_CFG_INFO_TYPE_DO_MIN3:
                data = tex_do_min3_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                dev_grp.dev_info[dev_index].sys_cfg_var.do_min3 = UInt16(data_f*10);
                break;
            case SYS_CFG_INFO_TYPE_DO_MIN4:
                data = tex_do_min3_cfg.text
                if(data == nil)
                {
                    return
                }
                data_f = Float(data!)!
                res = set_value_detect_do(data: data_f)
                if(res != 0)
                {
                    return;
                }
                dev_grp.dev_info[dev_index].sys_cfg_var.do_min4 = UInt16(data_f*10);
                break;
            default:
                var i = 1
            }
        }
        if((dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH)
        || (dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_MULTI_CTRL))
        {
            if(dev_grp.dev_info[dev_index].sys_cfg_var.do_max < dev_grp.dev_info[dev_index].sys_cfg_var.do_min)
            {
                let alert = UIAlertController(title: "溶氧设置非法",
                                              message: "溶氧上限不应低于溶氧下限", preferredStyle: .Alert)
                let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                return
            }
            if(dev_grp.dev_info[ dev_index].dev_type == DEV_TYPE_FISH_MULTI_CTRL)
            {
                if(dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_max < dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_min)
                {
                    let alert = UIAlertController(title: "温度设置非法",
                                                  message: "温度上限不应低于温度下限", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
                    alert.addAction(action)
                    presentViewController(alert, animated: true, completion: nil)
                    return;
                }
            }
        }
        else if( (dev_grp.dev_info[dev_index].dev_type == DEV_TYPE_FISH_SIG_CTRL)
            || (dev_grp.dev_info[dev_index].dev_type == DEV_TYPE_FISH_DETECT_CTRL)
            || (dev_grp.dev_info[dev_index].dev_type == DEV_TYPE_FISH_FEED)
            || (dev_grp.dev_info[dev_index].dev_type == DEV_TYPE_FISH_PH) )
        {
            //			if(comm_frame.dev.dev_info[dev_index].sys_cfg_var.do_max < comm_frame.dev.dev_info[dev_index].sys_cfg_var.do_min1)
            //			{
            //				new AlertDialog.Builder(this)
            //		         .setTitle("溶氧设置非法")
            //		         .setMessage("溶氧上限不应低于溶氧下限1")
            //		         .setPositiveButton("确定", null)
            //		         .show();
            //				return;
            //			}
          if(dev_grp.dev_info[dev_index].sys_cfg_var.do_max < dev_grp.dev_info[dev_index].sys_cfg_var.do_min1)
          {
                show_info(title: "溶氧设置非法", msg:"溶氧上限不应低于溶氧下限1")
            
                return;
            }
            if(dev_grp.dev_info[dev_index].sys_cfg_var.do_min1 < dev_grp.dev_info[dev_index].sys_cfg_var.do_min2)
            {
                 show_info(title: "溶氧设置非法", msg:"溶氧下限1不应低于溶氧下限2")
               
                return;
            }
            if(dev_grp.dev_info[dev_index].sys_cfg_var.do_min2 < dev_grp.dev_info[dev_index].sys_cfg_var.do_min3)
            {
                show_info(title: "溶氧设置非法", msg:"溶氧下限2不应低于溶氧下限3")
               
                return;
            }
            if(dev_grp.dev_info[ dev_index].dev_type != DEV_TYPE_FISH_FEED)
            {
                if(dev_grp.dev_info[dev_index].sys_cfg_var.do_min3 < dev_grp.dev_info[dev_index].sys_cfg_var.do_min4)
                {
                    show_info(title: "溶氧设置非法", msg:"溶氧下限3不应低于溶氧下限4")

                    return;
                }
            }
        }
        copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[dev_index].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
        var len = frame_make( 0, frame_type: SYS_CFG_FRM, child_type:SYS_CFG_TYPE_VAR,  dev_index:dev_index)
        send_frame(len:len, manu: dev_grp.dev_info[dev_index].manu_id)
    }
    
    
    @IBAction func did_oxy_calibration_onclick(sender: AnyObject) {
        dev_grp.dev_info[sys_dev_index].sys_adj_type = SYS_CFG_ADJ_TYPE_OX
        var len = frame_make( 0, frame_type: SYS_CFG_FRM, child_type:SYS_CFG_TYPE_ADJ,  dev_index:sys_dev_index)
        send_frame(len:len, manu: dev_grp.dev_info[sys_dev_index].manu_id)
    }
  
    @IBAction func did_ph7_calibration_onclick(sender: AnyObject) {
        dev_grp.dev_info[sys_dev_index].sys_adj_type = SYS_CFG_ADJ_TYPE_PH_7
        var len = frame_make( 0, frame_type: SYS_CFG_FRM, child_type:SYS_CFG_TYPE_ADJ,  dev_index:sys_dev_index)
        send_frame(len:len, manu: dev_grp.dev_info[sys_dev_index].manu_id)    }
    
    @IBAction func did_ph4_calibration_onclick(sender: AnyObject) {
        dev_grp.dev_info[sys_dev_index].sys_adj_type = SYS_CFG_ADJ_TYPE_PH_SCALE
        var len = frame_make( 0, frame_type: SYS_CFG_FRM, child_type:SYS_CFG_TYPE_ADJ,  dev_index:sys_dev_index)
        send_frame(len:len, manu: dev_grp.dev_info[sys_dev_index].manu_id)    }
    
    @IBAction func did_reback_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func send_frame(len frame_len: Int, manu manu_id:UInt8)
    {
        
        var address = "115.29.194.177"
        var port:UInt16 = 23458
        var socket:GCDAsyncUdpSocket! = nil
        //    var socketReceive:GCDAsyncUdpSocket! = nil
        var error : NSError?
        
        
        switch manu_id
        {
        case 2:
            address = fish_server1//"115.29.194.177"
        case 3:
            address = fish_server2
        case 4:
            address = fish_server3
        default:
            address = "192.168.2.101"
        }
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
        var buf = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&buf, length:count * sizeof(UInt8))
        var result =  frame_analysis(buf_info: buf, frame_len: count)
        if(buf[Int(FRM_TYPE_ADDR)] == SYS_CFG_RSP_FRM)
        {
            switch result {
            case 0:  //login in
                if(buf[Int(SYS_CFG_RSP_TYPE_ADDR)] == SYS_CFG_RSP_TYPE_VAR)
                {
                    show_info(title: "系统配置回应", msg:"参数配置成功")
                }
                else if(buf[Int(SYS_CFG_RSP_TYPE_ADDR)] == SYS_CFG_RSP_TYPE_ADJ)
                {
                    show_info(title: "系统配置回应", msg:"校准已启动，十分钟后校准完成")
                }
                else if (buf[Int(SYS_CFG_RSP_TYPE_ADDR)] == SYS_CFG_RSP_TYPE_SYNC)
                {
                    var dev_index = sys_dev_index
                    for i in 0..<dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num
                    {
                        switch (dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[Int(i)])
                        {
                        case SYS_CFG_INFO_TYPE_DO_MAX:
                            tex_do_max_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_max)/10)
                            break;
                        case SYS_CFG_INFO_TYPE_DO_MIN:
                          // tex_do_min_cfg.text = (Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_min)/10) as? String
                            break;
                        case SYS_CFG_INFO_TYPE_DO_MIN1:
                            tex_do_min1_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_min1)/10)
                            break;
                        case SYS_CFG_INFO_TYPE_DO_MIN2:
                            tex_do_min2_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_min2)/10)
                            break;
                        case SYS_CFG_INFO_TYPE_DO_MIN3:
                            tex_do_min3_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_min3)/10)
                            break;
                      /*  case SYS_CFG_INFO_TYPE_DO_MIN4:
                            View_ed = (EditText)findViewById(R.id.do_min4_cfg_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.do_min4/10));
                            break;*/
                        case SYS_CFG_INFO_TYPE_DO_UP:
                            tex_do_top_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.do_up)/10)
                            break;
                        case SYS_CFG_INFO_TYPE_SALT:
                            tex_salinity_cfg.text = String(stringInterpolationSegment: Float(dev_grp.dev_info[dev_index].sys_cfg_var.salt_cfg)/10) 
                            break;
                     /*   case SYS_CFG_INFO_TYPE_WT_TMP_MAX:
                            View_ed = (EditText)findViewById(R.id.tmp_max_cfg_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_max/10));
                            break;
                        case SYS_CFG_INFO_TYPE_WT_TMP_MIN:
                            View_ed = (EditText)findViewById(R.id.tmp_min_cfg_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_min/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX:
                            View_ed = (EditText)findViewById(R.id.tmp_air_max_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MIN:
                            View_ed = (EditText)findViewById(R.id.tmp_air_min_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_min/10));
                            break;
                        case SYS_CFG_INFO_TYPE_WET_AIR_MAX:
                            View_ed = (EditText)findViewById(R.id.wet_air_max_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.wet_air_max/10));
                            break;
                        case SYS_CFG_INFO_TYPE_WET_AIR_MIN:
                            View_ed = (EditText)findViewById(R.id.wet_air_min_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.wet_air_min/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX1:
                            View_ed = (EditText)findViewById(R.id.tmp_air_max1_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max1/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX2:
                            View_ed = (EditText)findViewById(R.id.tmp_air_max2_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max2/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX3:
                            View_ed = (EditText)findViewById(R.id.tmp_air_max3_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max3/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX4:
                            View_ed = (EditText)findViewById(R.id.tmp_air_max4_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max4/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_AIR_NORM:
                            View_ed = (EditText)findViewById(R.id.tmp_air_normal_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_normal/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_SOIL_MAX:
                            View_ed = (EditText)findViewById(R.id.tmp_soil_max_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_soil_max/10));
                            break;
                        case SYS_CFG_INFO_TYPE_TMP_SOIL_MIN:
                            View_ed = (EditText)findViewById(R.id.tmp_soil_min_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.tmp_soil_min/10));
                            break;
                        case SYS_CFG_INFO_TYPE_WET_SOIL_MAX:
                            View_ed = (EditText)findViewById(R.id.wet_soil_max_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.wet_soil_max/10));
                            break;
                        case SYS_CFG_INFO_TYPE_WET_SOIL_MIN:
                            View_ed = (EditText)findViewById(R.id.wet_soil_min_ed);
                            View_ed.setText(Float.toString((float)dev_grp.dev_info[dev_index].sys_cfg_var.wet_soil_min/10));
                            break;*/
                        default:
                            var j = 1
                        }
                    }
                }
            case 2:
                if(buf[Int(SYS_CFG_RSP_TYPE_ADDR)] == SYS_CFG_RSP_TYPE_VAR)
                {
                    show_info(title: "系统配置回应", msg:"系统配置版本已过期，正在同步，请稍等十秒再试")
                }
            
            default:
            var i = 1
            }
        }
        
        // print("incoming message: \(data)");
    }
    
    func show_info(title title:String,msg msg:String)
    {
        let alert = UIAlertController(title: title,
                                      message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)    }
}
