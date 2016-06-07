//
//  RegisterViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/23.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class RegisterViewController:UIViewController, GCDAsyncUdpSocketDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
 
    @IBOutlet weak var tex_user_name: UITextField!
    @IBOutlet weak var tex_password: UITextField!
    @IBOutlet weak var tex_password_agin: UITextField!
    
    @IBOutlet weak var img_zone_isopen: UIImageView!
    @IBOutlet weak var lab_zone_name: UIButton!
 
    @IBOutlet weak var pik_zone_list: UIPickerView!
    
    var bol_zone_isOpen:Bool = false
    var pickerDir:NSDictionary!
    var province:NSArray!
    var city:NSArray!
    var area:NSArray!
    var selectedArray:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        did_getPickerData()
          //pik_zone_list =
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
            print("1")       // print("incoming message: \(data)");
        }
    }
    
    
 
    
    func show_info(title title:String,msg:String)
        
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

    @IBAction func did_zone_list(sender: AnyObject) {
        if !bol_zone_isOpen
        {
            bol_zone_isOpen = true
            pik_zone_list.hidden = false
            img_zone_isopen.image = UIImage(named: "adown.png")
        }
        else
        {
            bol_zone_isOpen = false
            pik_zone_list.hidden = true
            img_zone_isopen.image = UIImage(named: "aright.png")
        }
    }
    
    /*------------------------------------------------------------
     *
     *   地区下拉列表实现
     *
     --------------------------------------------------------------*/
    func did_getPickerData()
    {
        let path = NSBundle.mainBundle().pathForResource("area", ofType: "plist")
        print("path = "+path!)
        self.province =  NSArray(contentsOfFile: path!)
        self.city = self.province[0].objectForKey("cities") as! NSArray
        self.area = self.city[0].objectForKey("areas") as! NSArray
    
//        
//        
//        self.province = self.pickerDir.allKeys
//        self.selectedArray = self.pickerDir.objectForKey(self.pickerDir.allKeys[0]) as! NSArray
//        if self.selectedArray.count > 0
//        {
//            self.city = self.selectedArray[0].allKeys
//        }
//        if self.city.count > 0
//        {
//            self.area = self.selectedArray[0].objectForKey(self.city[0]) as! NSArray
//        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        if component == 0
        {
            return self.province.count
        }
        else if component == 1
        {
            return self.city.count
        }
        else
        {
            return self.area.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return self.province[row].objectForKey("state") as? String
        }
        else if component == 1
        {
            return self.city[row].objectForKey("state") as? String
        }
        else
        {
            return self.area[row] as? String
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        switch (component) {
//        case 0:
//            self.city = self.province[row].objectForKey("cities")
//            self.pik_zone_list.selectRow(0, inComponent: 1, animated: true)
//            self.pik_zone_list.reloadComponent(1)
//            
//            self.area = self.city[0].objectForKey("areas")
//            self.pik_zone_list.selectRow(0, inComponent: 2, animated: true)
//            self.pik_zone_list.reloadComponent(2)
//            
//            areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
//            [self.locatePicker selectRow:0 inComponent:2 animated:YES];
//            [self.locatePicker reloadComponent:2];
//            
//            self.locate.state = [[provinces objectAtIndex:row] objectForKey:@"state"];
//            self.locate.city = [[cities objectAtIndex:0] objectForKey:@"city"];
//            if ([areas count] > 0) {
//                self.locate.district = [areas objectAtIndex:0];
//            } else{
//                self.locate.district = @"";
//            }
//            break;
//        case 1:
//            areas = [[cities objectAtIndex:row] objectForKey:@"areas"];
//            [self.locatePicker selectRow:0 inComponent:2 animated:YES];
//            [self.locatePicker reloadComponent:2];
//            
//            self.locate.city = [[cities objectAtIndex:row] objectForKey:@"city"];
//            if ([areas count] > 0) {
//                self.locate.district = [areas objectAtIndex:0];
//            } else{
//                self.locate.district = @"";
//            }
//            break;
//        case 2:
//            if ([areas count] > 0) {
//                self.locate.district = [areas objectAtIndex:row];
//            } else{
//                self.locate.district = @"";
//            }
//            break;
//        default:
//            break;
//        }

        
        
        if component == 0
        {
            //self.selectedArray = (self.province[row]) as! NSArray
            if self.province.count > 0
            {
                self.city = self.province[0].objectForKey("cities") as! NSArray
            }
            else
            {
                self.city = nil
            }
            
            if self.city.count > 0
            {
                self.area = self.city[0].objectForKey("areas") as! NSArray
            }
            else
            {
                self.area  = nil
            }
        }
        
        pik_zone_list.selectedRowInComponent(1)
        pik_zone_list.reloadComponent(1)
        pik_zone_list.selectedRowInComponent(2)
        
        if component == 1
        {
            if self.selectedArray.count > 0 && self.city.count > 0
            {
                self.area = self.selectedArray[0].objectForKey(self.city[row]) as! NSArray
            }
            else
            {
                self.area = nil
            }
            pik_zone_list.selectRow(1, inComponent: 2, animated: true)
        }
        pik_zone_list.reloadComponent(2)
    }
    
}



