//
//  DevListViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/9.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import MessageUI
import CocoaAsyncSocket

class EmailMenuItem: UIMenuItem{
    var indexPath: NSIndexPath!
}

class DevListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SectionHeaderViewDelegate, GCDAsyncUdpSocketDelegate{

    
      @IBOutlet weak var img_sideslip: UIImageView!
      @IBOutlet weak var img_weather_state: UIImageView!
      @IBOutlet weak var lab_weather_details: UILabel!
      @IBOutlet weak var img_weather_flush: UIImageView!
      @IBOutlet weak var lab_dev_sum: UILabel!
      @IBOutlet weak var img_dev_add: UIImageView!
      @IBOutlet weak var tab_dev_list: UITableView!
      @IBOutlet weak var lab_dev_online: UILabel!
    
    let SectionHeaderViewIdentifier = "SectionHeaderViewIdentifier"
    //var plays:NSArray!
 
    var pinchedIndexPath:NSIndexPath!
    var opensectionindex:Int!
    var initialPinchHeight:CGFloat!
    
    //var playe:NSMutableArray?
    var arr_dev_list:NSMutableArray!
    
    var sectionHeaderView:SectionHeaderView!
    
    var timer:NSTimer!
    
    
    //当缩放手势同时改变了所有单元格高度时使用uniformRowHeight
    var uniformRowHeight: Int!
    
    let DefaultRowHeight = 200
    let HeaderHeight = 38
    
    var focus_dev_index:Int = 0

    
    /******************************************************************
     *
     *   发送函数
     *
     ******************************************************************/
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
    //定时器触发函数
    func did_request_real_data()
    {
        print("tick...")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            dispatch_sync(dispatch_get_main_queue(),{
                print("异步线程")
                for i in 0..<dev_grp.dev_info.count{
                    copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[i].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
                    var len = frame_make( 0, frame_type: REAL_DATA_FRM, child_type:0,  dev_index:i)
                    self.send_frame(len:len , manu:dev_grp.dev_info[i].manu_id)
                }
            })
        })
        
    }
    
    /******************************************************************
     *
     *   数据接收函数
     *
     ******************************************************************/
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,  withFilterContext filterContext: AnyObject!)
    {
        let count = data.length / sizeof(UInt8)
        
        // create an array of Uint8
        var buf = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&buf, length:count * sizeof(UInt8))
        var result =  frame_analysis(buf_info: buf, frame_len: count)
        print(result)
        switch result {
        case 0:  //login in
            print(dev_grp.dev_info[0])
           
            print("获取实时帧成功")
            
            dev_grp.dev_online_num = 0
            for j in 0..<dev_grp.dev_login_num
            {
                var i:Int = 0
                while(i<8)
                {
                    
                    if buf[i] != dev_grp.dev_info[j].dev_id[i]
                    {
                        break
                    }
                    if ((buf[i] == dev_grp.dev_info[j].dev_id[i])) && (i == 7){
                        i = 8
                        break
                    }
                    i += 1
                    
                }
                if i == 8
                {
                    var dateString = String(dev_grp.dev_info[j].sys_date.year)+"-"+String(dev_grp.dev_info[j].sys_date.mon)+"-"+String(dev_grp.dev_info[j].sys_date.day)+" "+String(dev_grp.dev_info[j].sys_date.hour)+":"+String(dev_grp.dev_info[j].sys_date.min)+":"+String(dev_grp.dev_info[j].sys_date.sec)
                    //print("dev_grp.dev_info[j].dateString = "+dateString)
                    print("j = "+"\(j)")
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    dev_grp.dev_info[j].last_time = NSDate().timeIntervalSinceDate(dateFormatter.dateFromString(dateString)!)
                    print("last_time = "+"\(dev_grp.dev_info[j].last_time )")
                    if (dev_grp.dev_info[j].last_time > 180) && (dev_grp.dev_info[j].last_time != -1)
                    {
                        dev_grp.dev_info[j].flag &= ~0x8
                    }
                    else
                    {
                        dev_grp.dev_info[j].flag |= 0x8
                        
                    }
                }
            }
            tab_dev_list.reloadData()
       
            //tab_dev_list.reloadData()
            //self.performSegueWithIdentifier("btn_login", sender: nil)
//        case 1:
//            let alert = UIAlertController(title: "登陆错误",
//                                          message: "用户不存在，请注册后使用", preferredStyle: .Alert)
//            let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(action)
//            presentViewController(alert, animated: true, completion: nil)
//        case 2:
//            let alert = UIAlertController(title: "登陆错误",
//                                          message: "登陆密码错误，请重新输入", preferredStyle: .Alert)
//            let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(action)
//            presentViewController(alert, animated: true, completion: nil)
            break
        default:
            print("获取实时针失败！")
            break
        }
        // print("incoming message: \(data)");
    }
    
    
    
    /******************************************************************
     *
     *   界面初始化
     *
     ******************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        //注册定时器
        if(timer == nil){
            timer = NSTimer.scheduledTimerWithTimeInterval(60,target:self,selector:Selector("did_request_real_data"),userInfo:nil,repeats:true)
        }
        
        init_view()
        // 为表视图添加缩放手势识别
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action:"handlePinch:")
        tab_dev_list.addGestureRecognizer(pinchRecognizer)
        
        // 设置Header的高度
        tab_dev_list.sectionHeaderHeight = CGFloat(HeaderHeight)
        
        // 分节信息数组在viewWillUnload方法中将被销毁，因此在这里设置Header的默认高度是可行的。如果您想要保留分节信息等内容，可以在指定初始化器当中设置初始值。
        
        self.uniformRowHeight = DefaultRowHeight
        self.opensectionindex = NSNotFound
        
        let sectionHeaderNib: UINib = UINib(nibName: "SectionHeaderView", bundle: nil)
        
        tab_dev_list.registerNib(sectionHeaderNib, forHeaderFooterViewReuseIdentifier: SectionHeaderViewIdentifier)
        
        //实时帧请求接口
        for i in 0..<dev_grp.dev_info.count{
            //dev_index = UInt8(i)
            copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[i].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
            var len = frame_make( 0, frame_type: REAL_DATA_FRM, child_type:0,  dev_index:i)
            self.send_frame(len:len, manu: dev_grp.dev_info[i].manu_id)
        }
        
        //table代理
        tab_dev_list.delegate = self
        tab_dev_list.dataSource = self
  
        
    }
    
    func setData(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            dispatch_sync(dispatch_get_main_queue(),{
                print("异步线程")
                dev_grp.dev_online_num = 0
                for i in 0..<dev_grp.dev_login_num{
                    print("dev_grp.dev_Info "+"\(i)"+"last_time = "+"\(dev_grp.dev_info[i].last_time)")
                    if (dev_grp.dev_info[i].last_time > 180) && (dev_grp.dev_info[i].last_time != -1){
                        //dev_grp.dev_online_num -= 1
                    }
                    else
                    {
                        dev_grp.dev_online_num += 1
                    }
                    print("dev_grp.dev_info[i].last_time = "+"\(dev_grp.dev_info[i].last_time)")
                    
                }
            })
        })

    }

    //界面view初始化
    func init_view(){
        init_btn_imgview_onclick(img_sideslip)
        img_sideslip.contentMode = UIViewContentMode.ScaleAspectFit
        
        img_weather_state.contentMode = UIViewContentMode.ScaleAspectFit
        lab_weather_details.adjustsFontSizeToFitWidth = true
        img_weather_flush.contentMode = UIViewContentMode.ScaleAspectFit
        
        img_dev_add.contentMode = UIViewContentMode.ScaleAspectFit
        init_btn_imgview_onclick(img_dev_add)

        init_btn_imgview_onclick(img_weather_flush)
        
        lab_dev_sum.text = "设备总数："+String(dev_grp.dev_login_num)
        lab_dev_online.text =  "在线设备："+String(dev_grp.dev_online_num)
        
    }
    
    
    /******************************************************************
     *
     *   主界面点击事件添加
     *
     ******************************************************************/
    
    @IBAction func did_btn_setting_onclick(sender: AnyObject) {
         self.performSegueWithIdentifier("seg_ToSysSetting", sender: nil)
    }
    @IBAction func did_btn_quit_onclick(sender: AnyObject) {
         self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    //初始化图片点击事件
    func init_btn_imgview_onclick(imageview:UIImageView){
        //设置允许交互属性
        imageview.userInteractionEnabled = true
        //添加tapGuestureRecognizer手势
        var tapGR = UITapGestureRecognizer(target: self,action: #selector(DevListViewController.did_sideslip_onclick(_:)))
        if imageview == img_sideslip{
           tapGR = UITapGestureRecognizer(target: self,action:#selector(DevListViewController.did_sideslip_onclick(_:)))
        }
        else if imageview == img_weather_flush{
            tapGR = UITapGestureRecognizer(target: self,action:#selector(DevListViewController.did_weather_flush_onclick(_:)))
        }
        imageview.addGestureRecognizer(tapGR)
        
    }
    //侧滑手势处理函数
    func did_sideslip_onclick(sender:UITapGestureRecognizer) {
       
            self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //天气刷新手势处理函数
    func did_weather_flush_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
   //数据分组
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
      
        if self.arr_dev_list == nil || self.arr_dev_list.count != self.numberOfSectionsInTableView(tab_dev_list) {
            print("数据需要更新")
            
            var infoArray = NSMutableArray()
            
            for play in dev_grp.dev_info {
                var dic = (play as! dev_info_struct)
                var sectionInfo = DevItemSectionInfo()
                sectionInfo.play = play as! dev_info_struct
                sectionInfo.open = false
                
                var defaultRowHeight = DefaultRowHeight
                var countOfQuotations = 1
                for (var i = 0; i < countOfQuotations; i++) {
                    sectionInfo.insertObject(defaultRowHeight, inRowHeightsAtIndex: i)
                }
                
                infoArray.addObject(sectionInfo)
            }
            
            self.arr_dev_list  = infoArray
        }
    }
    
    /******************************************************************
     *
     *   转换函数
     *
     ******************************************************************/
    //[UInt8]转string
    func StringToInt(bytes:[UInt8])->NSString{
        var gbkEncoding: NSStringEncoding = CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue))
        let data = NSData(bytes: bytes, length: bytes.count)
        let dogString:NSString = NSString(data: data, encoding:gbkEncoding )!
        return dogString
    }

    
    /******************************************************************
     *
     *   折叠tableview函数实现 （包括table 和 section）
     *
     ******************************************************************/
    //tabview方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 这个方法返回 tableview 有多少个section
        return dev_grp.dev_login_num
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 这个方法返回对应的section有多少个元素，也就是多少行
        var sectionInfo: DevItemSectionInfo = self.arr_dev_list[section] as! DevItemSectionInfo
        var numStoriesInSection = 1
        var sectionOpen = sectionInfo.open!
        return sectionOpen ? numStoriesInSection : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 返回指定的row 的cell。这个地方是比较关键的地方，一般在这个地方来定制各种个性化的 cell元素。这里只是使用最简单最基本的cell 类型。其中有一个主标题 cell.textLabel 还有一个副标题cell.detailTextLabel,  还有一个 image在最前头 叫cell.imageView.  还可以设置右边的图标，通过cell.accessoryType 可以设置是饱满的向右的蓝色箭头，还是单薄的向右箭头，还是勾勾标记。
        
        let QuoteCellIdentifier = "DevCellIdentifier"
        var cell: DevCell = tab_dev_list.dequeueReusableCellWithIdentifier(QuoteCellIdentifier) as! DevCell
        
        
            
         if cell.longPressRecognizer == nil {
                var longPressRecognizer: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
                cell.longPressRecognizer = longPressRecognizer
         }
      
        init_did_cellView_onclick(cell.img_cell_backgd,cell: cell)
        init_did_cellView_onclick(cell.img_notice_switch, cell: cell)
        init_did_cellView_onclick(cell.img_event, cell: cell)
        
        var play:dev_info_struct = (self.arr_dev_list[indexPath.section] as! DevItemSectionInfo).play
        focus_dev_index = indexPath.section
        //cell.dev_info_cell = play
        cell.setDevCell( indexPath.section)
        cell.setTheLongPressRecognizer(cell.longPressRecognizer)
        return cell
    }
    

    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 返回指定的 section header 的view，如果没有，这个函数可以不返回view
        var sectionHeaderView: SectionHeaderView = tab_dev_list.dequeueReusableHeaderFooterViewWithIdentifier(SectionHeaderViewIdentifier) as! SectionHeaderView
        var sectionInfo: DevItemSectionInfo = self.arr_dev_list[section] as! DevItemSectionInfo
        sectionInfo.headerView = sectionHeaderView
        
        
        
        
        sectionHeaderView.lab_dev_name.text = StringToInt(dev_grp.dev_info[section].dev_name) as String
//        sectionHeaderView.lab_dev_name.text = String(dev_grp.dev_info[section].dev_name) as String
        if(dev_grp.dev_info[section].flag  & 0x8) == 0x8{
            sectionHeaderView.lab_dev_online.text = "在线"
        }
        else{
            sectionHeaderView.lab_dev_online.text = "离线"
        }
        sectionHeaderView.lab_dev_name.textColor=UIColor.blackColor()
        sectionHeaderView.lab_dev_online.textColor = UIColor.blackColor()
        sectionHeaderView.section = section
        sectionHeaderView.delegate = self
        
        return sectionHeaderView
    }
    
    // 这个方法返回指定的 row 的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var sectionInfo: DevItemSectionInfo = self.arr_dev_list[indexPath.section] as! DevItemSectionInfo
        
        return CGFloat(sectionInfo.objectInRowHeightsAtIndex(indexPath.row) as! NSNumber)
        //又或者，返回单元格的行高
    }
    
    
    // SectionHeaderViewDelegate
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, sectionOpened: Int) {
        
        var sectionInfo: DevItemSectionInfo = self.arr_dev_list[sectionOpened] as! DevItemSectionInfo
        
        sectionInfo.open = true
        
        //创建一个包含单元格索引路径的数组来实现插入单元格的操作：这些路径对应当前节的每个单元格
        
        var countOfRowsToInsert = 1
        var indexPathsToInsert = NSMutableArray()
        
        for (var i = 0; i < countOfRowsToInsert; i++) {
            indexPathsToInsert.addObject(NSIndexPath(forRow: i, inSection: sectionOpened))
        }
        
        // 创建一个包含单元格索引路径的数组来实现删除单元格的操作：这些路径对应之前打开的节的单元格
        
        var indexPathsToDelete = NSMutableArray()
        
        var previousOpenSectionIndex = self.opensectionindex
        if previousOpenSectionIndex != NSNotFound {
            
            var previousOpenSection: DevItemSectionInfo = self.arr_dev_list[previousOpenSectionIndex] as! DevItemSectionInfo
            previousOpenSection.open = false
            previousOpenSection.headerView.toggleOpenWithUserAction(false)
            var countOfRowsToDelete = 1
            for (var i = 0; i < countOfRowsToDelete; i++) {
                indexPathsToDelete.addObject(NSIndexPath(forRow: i, inSection: previousOpenSectionIndex))
            }
        }
        
        // 设计动画，以便让表格的打开和关闭拥有一个流畅（很屌）的效果
        var insertAnimation: UITableViewRowAnimation
        var deleteAnimation: UITableViewRowAnimation
        if previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex {
            insertAnimation = UITableViewRowAnimation.Top
            deleteAnimation = UITableViewRowAnimation.Bottom
        }else{
            insertAnimation = UITableViewRowAnimation.Bottom
            deleteAnimation = UITableViewRowAnimation.Top
        }
        
        // 应用单元格的更新
        tab_dev_list.beginUpdates()
        tab_dev_list.deleteRowsAtIndexPaths(indexPathsToDelete as! [NSIndexPath], withRowAnimation: deleteAnimation)
        tab_dev_list.insertRowsAtIndexPaths(indexPathsToInsert as! [NSIndexPath], withRowAnimation: insertAnimation)
        
        self.opensectionindex = sectionOpened
        
        tab_dev_list.endUpdates()
    }
    
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, sectionClosed: Int) {
        
        // 在表格关闭的时候，创建一个包含单元格索引路径的数组，接下来从表格中删除这些行
        var sectionInfo: DevItemSectionInfo = self.arr_dev_list[sectionClosed] as! DevItemSectionInfo
        
        sectionInfo.open = false
        var countOfRowsToDelete = tab_dev_list.numberOfRowsInSection(sectionClosed)
        
        if countOfRowsToDelete > 0 {
            var indexPathsToDelete = NSMutableArray()
            for (var i = 0; i < countOfRowsToDelete; i++) {
                indexPathsToDelete.addObject(NSIndexPath(forRow: i, inSection: sectionClosed))
            }
            tab_dev_list.deleteRowsAtIndexPaths(indexPathsToDelete as! [NSIndexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
        self.opensectionindex = NSNotFound
    }
    
    /******************************************************************
     *
     *   缩放操作处理
     *
     ******************************************************************/
    func handlePinch(pinchRecognizer: UIPinchGestureRecognizer) {
        
        // 有手势识别有很多状态来对应不同的动作：
        // * 对于 Began 状态来说，是用缩放点的位置来找寻单元格的索引路径，并将索引路径与缩放操作进行绑定，同时在 pinchedIndexPath 中保留一个引用。接下来方法获取单元格的高度，然后存储其在缩放开始前的高度。最后，为缩放的单元格更新比例。
        // * 对于 Changed 状态来说，是为缩放的单元格更新比例（由 pinchedIndexPath 支持）
        // * 对于 Ended 或者 Canceled状态来说，是将 pinchedIndexPath 属性设置为 nil
        
        NSLog("pinch Gesture")
        if pinchRecognizer.state == UIGestureRecognizerState.Began {
            
            let pinchLocation = pinchRecognizer.locationInView(tab_dev_list)
            let newPinchedIndexPath = tab_dev_list.indexPathForRowAtPoint(pinchLocation)
            self.pinchedIndexPath = newPinchedIndexPath
            
            let sectionInfo: DevItemSectionInfo = self.arr_dev_list[newPinchedIndexPath!.section] as! DevItemSectionInfo
            self.initialPinchHeight = sectionInfo.objectInRowHeightsAtIndex(newPinchedIndexPath!.row) as! CGFloat
            NSLog("pinch Gesture began")
            // 也可以设置为 initialPinchHeight = uniformRowHeight
            
            self.updateForPinchScale(pinchRecognizer.scale, indexPath: newPinchedIndexPath!)
        }else {
            if pinchRecognizer.state == UIGestureRecognizerState.Changed {
                self.updateForPinchScale(pinchRecognizer.scale, indexPath: self.pinchedIndexPath)
            }else if pinchRecognizer.state == UIGestureRecognizerState.Cancelled || pinchRecognizer.state == UIGestureRecognizerState.Ended {
                self.pinchedIndexPath = nil
            }
        }
    }
    
    func updateForPinchScale(scale: CGFloat, indexPath:NSIndexPath?) {
        
        let section:NSInteger = indexPath!.section
        let row:NSInteger = indexPath!.row
        let found:NSInteger = NSNotFound
        if  (section != found) && (row != found) && indexPath != nil {
            
            var newHeight:CGFloat!
            if self.initialPinchHeight > CGFloat(DefaultRowHeight) {
                newHeight = round(self.initialPinchHeight)
            }else {
                newHeight = round(CGFloat(DefaultRowHeight))
            }
            
            var sectioninfo = DevItemSectionInfo()
            let sectionInfo: DevItemSectionInfo = self.arr_dev_list[indexPath!.section] as! DevItemSectionInfo
            sectionInfo.replaceObjectInRowHeightsAtIndex(indexPath!.row, withObject: (newHeight))
           
            let animationsEnabled: Bool = UIView.areAnimationsEnabled()
            UIView.setAnimationsEnabled(false)
            tab_dev_list.beginUpdates()
            tab_dev_list.endUpdates()
            UIView.setAnimationsEnabled(animationsEnabled)
        }
    }
    
    
    
    
    /******************************************************************
     *     
     *   cell中手势函数
     *
     ******************************************************************/
    // 处理长按手势
    func handleLongPress(longPressRecognizer: UILongPressGestureRecognizer) {
        
        // 对于长按手势来说，唯一的状态是Began
        // 当长按手势被识别后，将会找寻按压点的单元格的索引路径
        // 如果按压位置存在一个单元格，那么就会创建一个菜单并展示它
        
        if longPressRecognizer.state == UIGestureRecognizerState.Began {
            
            let pressedIndexPath = tab_dev_list.indexPathForRowAtPoint(longPressRecognizer.locationInView(tab_dev_list))
            
            if pressedIndexPath != nil && pressedIndexPath?.row != NSNotFound && pressedIndexPath?.section != NSNotFound {
                
                self.becomeFirstResponder()
                print("长按手势")
//                let title = NSBundle.mainBundle().localizedStringForKey("邮件", value: "", table: nil)
//                let menuItem: EmailMenuItem = EmailMenuItem(title: title, action: "emailMenuButtonPressed:")
//                menuItem.indexPath = pressedIndexPath
//                
//                let menuController = UIMenuController.sharedMenuController()
//                menuController.menuItems = [menuItem]
//                
//                var cellRect = tab_dev_list.rectForRowAtIndexPath(pressedIndexPath!)
//                // 略微减少对象的长宽高（不要让其在单元格上方显示得太高）
//                cellRect.origin.y = cellRect.origin.y + 40.0
//                menuController.setTargetRect(cellRect, inView: tab_dev_list)
//                menuController.setMenuVisible(true, animated: true)
            }
        }
    }
    //cell中控件添加手势函数
    func init_did_cellView_onclick(img:UIImageView,cell:DevCell){
        img.userInteractionEnabled = true
        var signTap:UITapGestureRecognizer!
        if img == cell.img_cell_backgd {
            signTap = UITapGestureRecognizer(target: self, action: "did_cell_backgd_onlick:")
        }
        else if img == cell.img_event {
            signTap = UITapGestureRecognizer(target: self, action: "did_img_event_onclick:")
        }
        else if img == cell.img_notice_switch {
            signTap = UITapGestureRecognizer(target: self, action: "did_img_notice_switch_onclick:")
        }
        img.addGestureRecognizer(signTap)
        //signTap.view!.tag = indexPath.section
    }
    //处理cell整体点击手势
    func did_cell_backgd_onlick(recognizer: UITapGestureRecognizer){
        print("cell 整体点击事件响应")
        self.performSegueWithIdentifier("seg_ToFullintent", sender: self)
    }
    //处理cell事件图片点击手势
    func did_img_event_onclick(recognizer: UITapGestureRecognizer){
        print("事件查询事件响应")
        print(focus_dev_index)
    }
    //处理cell开关通知图片点击手势
    func did_img_notice_switch_onclick(recognizer: UITapGestureRecognizer){
        print("开关事件响应")
        print(focus_dev_index)
    }
    
    
    /******************************************************************
     *
     *   发送邮件
     *
     ******************************************************************/
    func emailMenuButtonPressed(menuController: UIMenuController) {
        
        let menuItem: EmailMenuItem = UIMenuController.sharedMenuController().menuItems![0] as! EmailMenuItem
        if menuItem.indexPath != nil {
            print("email...")
            self.resignFirstResponder()
            self.sendEmailForEntryAtIndexPath(menuItem.indexPath)
        }
    }
    
    func sendEmailForEntryAtIndexPath(indexPath: NSIndexPath) {
        
        //let play: [dev_info_struct] = dev_grp.dev_info[indexPath.section]
         let play: [dev_info_struct] = dev_grp.dev_info
        let quotation: dev_info_struct = play[indexPath.section]
        
        // 在实际使用中，可以调用邮件的API来实现真正的发送邮件
        print("用以下语录发送邮件: \(quotation.dev_name)")
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        //if result.Value== MFMailComposeResultFailed.value {
        //在实际使用中，显示一个合适的警告框来提示用户
        //print("邮件发送失败,错误信息: \(error)")
        //}
    }
    
    //界面销毁是销毁必须销毁的东西
    override func viewDidDisappear(animated: Bool) {
       
        if timer != nil{
            timer.invalidate()
            print("定时器取消。。。")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        
        // Pass the selected object to the new view controller.
        print("prepare")
        if segue.identifier == "seg_ToFullintent" {
            let dev=segue.destinationViewController as! FullintentViewController
           
            dev.fullintent_focus_dev_index=focus_dev_index
            sys_dev_index = focus_dev_index
            print(dev.fullintent_focus_dev_index)
        }
    }
  

}
