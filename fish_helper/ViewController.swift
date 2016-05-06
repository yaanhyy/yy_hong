//
//  ViewController.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/1/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
class ViewController: UIViewController , GCDAsyncUdpSocketDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert() {
    //    let alert = UIAlertController(title: "Hello, World",
     //                                 message: "This is my first app!", preferredStyle: .Alert)
    //    let action = UIAlertAction(title: "Disai OK", style: .Default, handler: nil)
     //   alert.addAction(action)
     //   presentViewController(alert, animated: true, completion: nil)
        //send login req
        var address = "192.168.2.100"
        var port:UInt16 = 23458
        var socket:GCDAsyncUdpSocket!
        var socketReceive:GCDAsyncUdpSocket!
        var error : NSError?
        let message = "love you!baby".dataUsingEncoding(NSUTF8StringEncoding)
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        socket.sendData(message, toHost: address, port: port, withTimeout: 1000, tag: 0)
        do {
        //    try socket.enableBroadcast(true)
            try socket.beginReceiving()

        } catch {
            print(error)
        }
        print(error)    }
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,      withFilterContext filterContext: AnyObject!) {
        print("incoming message: \(data)");
    }
}

