//
//  comm_frame.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/7/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import Foundation
import CocoaAsyncSocket



var send_buf:[UInt8] = [UInt8]()
class comm_send: GCDAsyncUdpSocketDelegate{
    
    
    func frame_analysis()
    {
        
    }
    
    func  frame_make(dev_type:UInt8, frame_type:UInt8 ) ->Int
    {
        var frame_len:Int = 0
        switch frame_type
        {
            case 1:
                send_buf.append(0x86)
            case 2:
                send_buf.append(0x86)
            default:
                send_buf.append(0x86)
            
        }
        
        return frame_len
    }
    
    func sned_frame(frame_len:Int)
    {
        //send login reqsend_buf.append(0x86)        
        var address = "192.168.2.102"
        var port:UInt16 = 23458
        var socket:GCDAsyncUdpSocket!
        var socketReceive:GCDAsyncUdpSocket!
        var error : NSError?

        //  var send_buf = UInt8[](count: 1024, repeatedValue: 0)
        // var send_buf = Array<UInt8>()
       // send_buf.append(0x86)
        //send_buf.append(0x99)
       // send_buf.append(0x24)



       // var message = NSData(bytes: send_buf as [UInt8], length: send_buf.count)
        var message = NSData(bytes: send_buf as [UInt8], length: frame_len)
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        socket.sendData(message, toHost: address, port: port, withTimeout: 10000, tag: 0)
        do {
            //    try socket.enableBroadcast(true)
            try socket.beginReceiving()
        } catch {
            print(error)
        }
    }

    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,      withFilterContext filterContext: AnyObject!)
    {
        let count = data.length / sizeof(UInt8)
    
        // create an array of Uint8
        var array = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&array, length:count * sizeof(UInt8))
        print("incoming message: \(data)");
    }
}