//
//  ViewController.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/1/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController ,UITextFieldDelegate, GCDAsyncUdpSocketDelegate{

    //@IBOutlet weak var login_backgd: UIImageView!
    @IBOutlet weak var user_name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var result_message_lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //login_backgd.backgroundColor
        //btnLgoin.layer.cornerRadius=4.0
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        let height = screenSize.height * 0.75
//        let width  = user_name.bounds.width;
//        user_name.frame = CGRectMake(25, height, width, 40)
//        self.view.addSubview(user_name)
        user_name.placeholder="请输入用户名"
        //user_name.becomeFirstResponder()
        user_name.keyboardType = UIKeyboardType.NumberPad
        user_name.delegate = self
        password.returnKeyType = UIReturnKeyType.Done
        password.placeholder="请输入密码"
        password.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchview(sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }
   
  
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {

        textField.resignFirstResponder()

        return true;
    }
 

    
    @IBAction func did_login_onclick(sender: AnyObject) {        /**登陆验证成功**/
       
        user_info.user_name = user_name.text
        user_info.user_pwd = password.text
        
        var len = frame_make( 0, frame_type: USER_LOG_FRM, child_type:USER_LOG_TYPE_LOG,  dev_index:0)
        send_frame(len:len, manu:2)
    
        /*
        if user_name.text == "admin" && password.text == "123"{
            self.performSegueWithIdentifier("btn_login", sender: nil)
        }else{
            result_message_lable.text = "username or passward is error!"
        }*/
    }
    
    @IBAction func did_register_onclick(sender: AnyObject) {
        self.performSegueWithIdentifier("seg_ToRegister", sender: nil)
        //self.performSegueWithIdentifier("seg_ToRegister", sender: nil)  btn_login
    }
//    @IBAction func did_register_onclick(sender: AnyObject) {
//       // copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[0].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
//       // var len = frame_make( 0, frame_type: REAL_DATA_FRM, child_type:0,  dev_index:0)
//       // copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[0].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
//       // var len = frame_make( 0, frame_type: HIS_INFO_FRM, child_type:0,  dev_index:0)
//        
//        /*copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[0].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
//        var len = frame_make( 0, frame_type: MODE_CFG_FRM, child_type:MODE_CFG_TYPE_CTRL,  dev_index:0)
//        send_frame(len:len, manu: dev_grp.dev_info[0].manu_id)*/
//        
//        self.performSegueWithIdentifier("seg_ToRegister", sender: nil)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
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
                address = "115.29.194.177"
            case 3:
                address = "114.215.180.76"
            case 4:
                address = "112.74.33.204"
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
            //var i = 1
           self.performSegueWithIdentifier("btn_login", sender: nil)
        case 1:
            let alert = UIAlertController(title: "登陆错误",
                                          message: "用户不存在，请注册后使用", preferredStyle: .Alert)
            let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        case 2:
            let alert = UIAlertController(title: "登陆错误",
                                           message: "登陆密码错误，请重新输入", preferredStyle: .Alert)
            let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        default:
            var i = 1
        }
        // print("incoming message: \(data)");
    }
    
    
    
}

