//
//  RegisterViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/23.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class RegisterViewController:UIViewController, GCDAsyncUdpSocketDelegate{
 
    @IBOutlet weak var tex_user_name: UITextField!
    @IBOutlet weak var tex_password: UITextField!
    @IBOutlet weak var tex_password_agin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //self.view.backgroundColor = UIColor(red: 0,green: 0,blue: 0,alpha: 0)
       
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
            address = fish_server1
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
        switch result {
        case 0:  //login in
            show_info(title: "用户注册", msg:"注册成功")
        case 1:
            show_info(title: "用户注册", msg:"用户名已被注册，请重新输入用户名")
        default:
            var i = 1        // print("incoming message: \(data)");
        }
    }
    
    
 
    
    func show_info(title title:String,msg msg:String)
        
    {
        let alert = UIAlertController(title: title,
                                          message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "确定", style: .Default, handler:{
            (alerts: UIAlertAction!) -> Void in
            self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
            })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
        
    @IBAction func did_btn_ok_onclick(sender: AnyObject) {
        user_info.user_name = tex_user_name.text
        user_info.user_pwd = tex_password.text
        var pwd_again:String = tex_password_agin.text!
        if(user_info.user_name?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 11)
        {
            show_info(title: "用户注册", msg:"用户名需要11位手机号")
        }
        else if(pwd_again == user_info.user_pwd)
        {
            var len = frame_make( 0, frame_type: USER_LOG_FRM, child_type:USER_LOG_TYPE_REG,  dev_index:0)
            send_frame(len:len, manu:2)
        }
        else
        {
            show_info(title: "用户注册", msg:"注册密码不一致，请重新输入")
        }
    }
    @IBAction func did_btn_cancel_onclick(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
