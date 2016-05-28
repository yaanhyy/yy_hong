//
//  DevAddViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/26.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class DevAddViewController:UIViewController, GCDAsyncUdpSocketDelegate{
    
    @IBOutlet weak var tex_dev_id: UITextField!
    @IBOutlet weak var tex_dev_name: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tex_dev_id.placeholder="请输设备串号(15位)"
        tex_dev_name.placeholder="请输入设备名(不超过8个字)"
        
        
    }
    
    @IBAction func did_btn_add_onclick(sender: AnyObject) {
        var dev_id:String  = tex_dev_id.text!
        dev_grp.dev_info.append(dev_info_struct())
        var arr_str = dev_id.cStringUsingEncoding(NSUTF8StringEncoding)
        if (arr_str?.count != 17)
        {
            show_info(title:"设置错误", msg:"设备号为16位")
            return
        }
        copy_array_cc(dst_in: &dev_reg_info.dev_id, src_in:arr_str!, dst_start:0, src_start:0, arr_len:Int(DEV_REG_ID_LEN))
        
        
        var gbkEncoding: NSStringEncoding = CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue))
        arr_str =  tex_dev_name.text!.cStringUsingEncoding(gbkEncoding)
        if(arr_str?.count > 17)
        {
            show_info(title:"设置错误", msg:"设备名小于8个字")
            return
        }
        for i in 0..<DEV_REG_DEV_NAME_LEN
        {
            dev_reg_info.dev_name[Int(i)] = 0
        }
        copy_array_cu(dst_in: &dev_reg_info.dev_name, src_in:arr_str!, dst_start:0 , src_start:0, arr_len:(arr_str!.count))
        dev_grp.dev_info[dev_grp.dev_login_num].manu_id  = 2
        copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[dev_grp.dev_login_num].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
        var len = frame_make( 0, frame_type: DEV_REG_FRM, child_type:DEV_REG_DEV_OP_ADD|DEV_REG_DEV_OP_BARN,  dev_index:dev_grp.dev_login_num)
        send_frame(len:len, manu: dev_grp.dev_info[dev_grp.dev_login_num].manu_id)
    }

    @IBAction func did_btn_cancel_onclick(sender: AnyObject) {
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
        if((result & Int(DEV_REG_RSP_RES_OP_DEL)) == Int(DEV_REG_RSP_RES_OP_DEL))
        {
            
        }
        else
        {
            result &= 0x7;
       
        
            switch result {
            case 0:  //login in
 
                show_info(title: "设备注册", msg:"设备注册成功")
            case 1:
                show_info(title: "设备注册失败", msg:"设备ID不存在,请重新注册")
            case 4:
                show_info(title: "设备注册失败", msg:"设备已经被别的用户绑定")
            case 6:
                show_info(title: "设备注册失败", msg:"设备已经被别的用户绑定")
            case 5:
                show_info(title: "设备注册失败", msg:"设备已经被本用户绑定")

            default:
                var i = 1
            }
        
        }
        // print("incoming message: \(data)");
    }
    
    func show_info(title title:String, msg msg:String)
    {
        let alert = UIAlertController(title: title,
                                      message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}
