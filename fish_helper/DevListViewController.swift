//
//  DevListViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/9.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import MessageUI

class EmailMenuItem: UIMenuItem{
    var indexPath: NSIndexPath!
}

class DevListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SectionHeaderViewDelegate{

    
      @IBOutlet weak var img_sideslip: UIImageView!
      @IBOutlet weak var img_weather_state: UIImageView!
      @IBOutlet weak var lab_weather_details: UILabel!
      @IBOutlet weak var img_weather_flush: UIImageView!
      @IBOutlet weak var lab_dev_sum: UILabel!
      @IBOutlet weak var img_dev_add: UIImageView!
      @IBOutlet weak var tab_dev_list: UITableView!
      @IBOutlet weak var lab_dev_online: UILabel!
    
    let SectionHeaderViewIdentifier = "DevSectionHeaderViewIdentifier"
    var plays:NSArray!
    var sectionInfoArray:NSMutableArray!
    var pinchedIndexPath:NSIndexPath!
    var opensectionindex:Int!
    var initialPinchHeight:CGFloat!
    
    var playe:NSMutableArray?
    
    var sectionHeaderView:DevSectionHeaderView!
    
    //当缩放手势同时改变了所有单元格高度时使用uniformRowHeight
    var uniformRowHeight: Int!
    
    let DefaultRowHeight = 88
    let HeaderHeight = 48
    
    override func viewDidLoad() {
        super.viewDidLoad()
       plays = played()
        init_view()
        // 为表视图添加缩放手势识别
        var pinchRecognizer = UIPinchGestureRecognizer(target: self, action:"handlePinch:")
        tab_dev_list.addGestureRecognizer(pinchRecognizer)
        
        // 设置Header的高度
        tab_dev_list.sectionHeaderHeight = CGFloat(HeaderHeight)
        
        // 分节信息数组在viewWillUnload方法中将被销毁，因此在这里设置Header的默认高度是可行的。如果您想要保留分节信息等内容，可以在指定初始化器当中设置初始值。
        
        self.uniformRowHeight = DefaultRowHeight
        self.opensectionindex = NSNotFound
        
        let sectionHeaderNib: UINib = UINib(nibName: "DevSectionHeaderView", bundle: nil)
        
        tab_dev_list.registerNib(sectionHeaderNib, forHeaderFooterViewReuseIdentifier: SectionHeaderViewIdentifier)
        
        
    }

    func init_view(){
        init_btn_imgview_onclick(img_sideslip)
        img_sideslip.contentMode = UIViewContentMode.ScaleAspectFit
        
        img_weather_state.contentMode = UIViewContentMode.ScaleAspectFit
        lab_weather_details.adjustsFontSizeToFitWidth = true
        img_weather_flush.contentMode = UIViewContentMode.ScaleAspectFit
        
        img_dev_add.contentMode = UIViewContentMode.ScaleAspectFit
        init_btn_imgview_onclick(img_dev_add)

        init_btn_imgview_onclick(img_weather_flush)
        
        //setData()
        
        self.tab_dev_list.sectionHeaderHeight = CGFloat(66)
       
        tab_dev_list.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyTestCell")
        self.view.addSubview(tab_dev_list)
        
        
        
//        let rec_screen:CGRect = UIScreen.mainScreen().bounds
//        let val_screen_height = rec_screen.height
//        let val_screen_width  = rec_screen.width
        
        //设备数量以上部分的 背景
//        let img_top_views_backgd = UIImageView(image: UIImage(named: "weather_bj.png"))
//        img_top_views_backgd.frame = CGRectMake(0, 0, val_screen_width, val_screen_height/6)
//        self.view.addSubview(img_top_views_backgd)
        
        //侧滑的背景图片
//        img_sideslip=UIImageView(image:UIImage(named:"mulu.png"))
//        img_sideslip.frame=CGRectMake(0,0,val_screen_width*0.1,val_screen_height/24)
//        self.view.addSubview(img_sideslip)
//        init_btn_imgview_onclick(img_sideslip)
        
        //产品推广标签
//        lab_title = UILabel(frame: CGRectMake(val_screen_width*0.1, 0, val_screen_width*0.9, val_screen_height/24))
//        lab_title.text = "护渔宝智能水产监控系统 400-0806390"
//        lab_title.adjustsFontSizeToFitWidth = true
//        //lab_title.backgroundColor = UIColor.clearColor()
//        lab_title.textColor = UIColor.whiteColor()
//        self.view.addSubview(lab_title)
        
//        print(val_screen_height/24)
//        //产品推广和天气分割线
//        lab_underliner = UILabel(frame: CGRectMake(0, val_screen_height/24, val_screen_width, CGFloat(1)))
//        //lab_title.backgroundColor = UIColor.blueColor()
//        self.view.addSubview(lab_underliner)
        
        //天气状态图片
//        img_weather_state = UIImageView(image: UIImage(named: "yun.png"))
//        img_weather_state.frame = CGRectMake(0, val_screen_height/24+1, val_screen_width*0.2, (val_screen_height/6 - val_screen_height/24-1))
//        img_weather_state.contentMode = UIViewContentMode.ScaleAspectFit
//        self.view.addSubview(img_weather_state)
        
        //天气文字描述
//        lab_weather_details = UILabel(frame: CGRectMake(val_screen_width*0.2, val_screen_height/24+1, val_screen_width*0.6, (val_screen_height/6 - val_screen_height/24-1)))
//        lab_weather_details.adjustsFontSizeToFitWidth = true
//        lab_weather_details.preferredMaxLayoutWidth = 2
//        lab_weather_details.textColor = UIColor.whiteColor()
//        self.view.addSubview(lab_weather_details)
        
        //天气刷新图片
//        img_weather_flush = UIImageView(frame: CGRectMake(val_screen_width*0.8, val_screen_height/24+1, val_screen_width*0.2, (val_screen_height/6 - val_screen_height/24-1)))
//        img_weather_flush.contentMode = UIViewContentMode.ScaleAspectFit
//        self.view.addSubview(img_weather_flush)
//        init_btn_imgview_onclick(img_weather_flush)
        
//        //设备数量一栏背景图片设置
//        let img_dev_nums_views_backgd = UIImageView(image:UIImage(named:"clockbg_unpress.png"))
//        img_dev_nums_views_backgd.frame=CGRectMake(0,val_screen_height/6,val_screen_width,val_screen_height/15)
//        self.view.addSubview(img_dev_nums_views_backgd)
        
        //设备数量标签
//        lab_dev_sum = UILabel(frame:CGRectMake(2,val_screen_height/6,val_screen_width*0.45,val_screen_height*1/15))// /15+/6
//        lab_dev_sum.text = "设备数量:15台"
//        lab_dev_sum.adjustsFontSizeToFitWidth = true
//        self.view.addSubview(lab_dev_sum)
        
        //在线设备标签
//        lab_dev_online = UILabel(frame:CGRectMake(2+val_screen_width*0.45,val_screen_height/6,val_screen_width*0.45,val_screen_height*1/15))// /15+/6
//        lab_dev_online.text = "在线设备:0台"
//        lab_dev_online.adjustsFontSizeToFitWidth = true;
//        self.view.addSubview(lab_dev_online)
        
        //设备添加
//        img_dev_add = UIImageView(image:UIImage(named:"dev_add_unpress.png"))
//        img_dev_add.frame=CGRectMake(2+val_screen_width*0.9,val_screen_height/6+1,val_screen_width*0.1-4,val_screen_height*1/15-2)
//        img_dev_add.contentMode = UIViewContentMode.ScaleAspectFit
//        self.view.addSubview(img_dev_add)
//        init_btn_imgview_onclick(img_dev_add)
        
        //列表一栏数据
//        self.dataArray = NSMutableArray()
//        self.dataArray!.addObject("11111")
//        self.dataArray!.addObject("22222")
//        self.dataArray!.addObject("33333")
//        self.dataArray!.addObject("44444")
//        
//        //列表一栏控件UITableView(frame: CGRectMake(0, 0, 320, 600), style: UITableViewStyle.Plain)  
//        tab_dev_list = UITableView(frame: CGRectMake(1, val_screen_height*7/30, val_screen_width-2, val_screen_height*23/30),style: UITableViewStyle.Plain)
//        tab_dev_list.dataSource = self
//        tab_dev_list.delegate = self
//        
//        tab_dev_list.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyTestCell")
//        self.view.addSubview(tab_dev_list)
        
    }
    
    
    
    
    //初始化图片点击事件
    func init_btn_imgview_onclick(imageview:UIImageView){
        //设置允许交互属性
        imageview.userInteractionEnabled = true
        //添加tapGuestureRecognizer手势
        var tapGR = UITapGestureRecognizer(target: self,action:#selector(DevListViewController.did_sideslip_onclick(_:)))
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 检查分节信息数组是否已被创建，如果其已创建，则再检查节的数量是否仍然匹配当前节的数量。通常情况下，您需要保持分节信息与单元格、分节格同步u过您要允许在表视图中编辑信息，您需要在编辑操作中适当更新分节信息。
        
        if self.sectionInfoArray == nil || self.sectionInfoArray.count != self.numberOfSectionsInTableView(tab_dev_list) {
            
            //对于每个场次来说，需要为每个单元格设立一个一致的、包含默认高度的SectionInfo对象。
            var infoArray = NSMutableArray()
            
            for play in self.plays {
                var dic = (play as! Group).dev_items
                var sectionInfo = DevItemSectionInfo()
                sectionInfo.play = play as! Group
                sectionInfo.open = false
                
                var defaultRowHeight = DefaultRowHeight
                var countOfQuotations = 1
                for (var i = 0; i < countOfQuotations; i++) {
                    sectionInfo.insertObject(defaultRowHeight, inRowHeightsAtIndex: i)
                }
                
                infoArray.addObject(sectionInfo)
            }
            
            self.sectionInfoArray  = infoArray
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 这个方法返回 tableview 有多少个section
        return self.plays.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 这个方法返回对应的section有多少个元素，也就是多少行
        var sectionInfo: DevItemSectionInfo = self.sectionInfoArray[section] as! DevItemSectionInfo
        var numStoriesInSection = 1
        var sectionOpen = sectionInfo.open!
        return sectionOpen ? numStoriesInSection : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 返回指定的row 的cell。这个地方是比较关键的地方，一般在这个地方来定制各种个性化的 cell元素。这里只是使用最简单最基本的cell 类型。其中有一个主标题 cell.textLabel 还有一个副标题cell.detailTextLabel,  还有一个 image在最前头 叫cell.imageView.  还可以设置右边的图标，通过cell.accessoryType 可以设置是饱满的向右的蓝色箭头，还是单薄的向右箭头，还是勾勾标记。
        
        let QuoteCellIdentifier = "QuoteCellIdentifier"
        var cell: DevCell = tableView.dequeueReusableCellWithIdentifier(QuoteCellIdentifier) as! DevCell
        
        if MFMailComposeViewController.canSendMail() {
            
            if cell.longPressRecognizer == nil {
                var longPressRecognizer: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
                cell.longPressRecognizer = longPressRecognizer
            }
        }
        else {
            cell.longPressRecognizer = nil
        }
        
        var play:Group = (self.sectionInfoArray[indexPath.section] as! DevItemSectionInfo).play
        cell.dev_item = play.dev_items
        cell.setDevCell(cell.dev_item)
        cell.setTheLongPressRecognizer(cell.longPressRecognizer)
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 返回指定的 section header 的view，如果没有，这个函数可以不返回view
        var sectionHeaderView: DevSectionHeaderView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(SectionHeaderViewIdentifier) as! DevSectionHeaderView
        var sectionInfo: DevItemSectionInfo = self.sectionInfoArray[section] as! DevItemSectionInfo
        sectionInfo.headerView = sectionHeaderView
        
        sectionHeaderView.titleLabel.text = sectionInfo.play.Name
        sectionHeaderView.section = section
        sectionHeaderView.delegate = self
        
        return sectionHeaderView
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // 这个方法返回指定的 row 的高度
        var sectionInfo: DevItemSectionInfo = self.sectionInfoArray[indexPath.section] as! DevItemSectionInfo
        
        return CGFloat(sectionInfo.objectInRowHeightsAtIndex(indexPath.row) as! NSNumber)
        //又或者，返回单元格的行高
    }
    
    // _________________________________________________________________________
    // SectionHeaderViewDelegate
    
   func sectionHeaderView(sectionHeaderView: DevSectionHeaderView, sectionOpened: Int) {
        
        var sectionInfo: DevItemSectionInfo = self.sectionInfoArray[sectionOpened] as! DevItemSectionInfo
        
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
            
            var previousOpenSection: DevItemSectionInfo = self.sectionInfoArray[previousOpenSectionIndex] as! DevItemSectionInfo
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
    
    func sectionHeaderView(sectionHeaderView: DevSectionHeaderView, sectionClosed: Int) {
        
        // 在表格关闭的时候，创建一个包含单元格索引路径的数组，接下来从表格中删除这些行
        var sectionInfo: DevItemSectionInfo = self.sectionInfoArray[sectionClosed] as! DevItemSectionInfo
        
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
    
    // ____________________________________________________________________
    // 缩放操作处理
    
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
            
            let sectionInfo: DevItemSectionInfo = self.sectionInfoArray[newPinchedIndexPath!.section] as! DevItemSectionInfo
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
            
            let sectionInfo: DevItemSectionInfo = self.sectionInfoArray[indexPath!.section] as! DevItemSectionInfo
            sectionInfo.replaceObjectInRowHeightsAtIndex(indexPath!.row, withObject: (newHeight))
            // 也可以设置为 uniformRowHeight = newHeight
            
            // 在单元格高度改变时关闭动画， 不然的话就会有迟滞的现象
            
            let animationsEnabled: Bool = UIView.areAnimationsEnabled()
            UIView.setAnimationsEnabled(false)
            tab_dev_list.beginUpdates()
            tab_dev_list.endUpdates()
            UIView.setAnimationsEnabled(animationsEnabled)
        }
    }
    
    // ________________________________________________________________________
    // 处理长按手势
    
    func handleLongPress(longPressRecognizer: UILongPressGestureRecognizer) {
        
        // 对于长按手势来说，唯一的状态是Began
        // 当长按手势被识别后，将会找寻按压点的单元格的索引路径
        // 如果按压位置存在一个单元格，那么就会创建一个菜单并展示它
        
        if longPressRecognizer.state == UIGestureRecognizerState.Began {
            
            let pressedIndexPath = tab_dev_list.indexPathForRowAtPoint(longPressRecognizer.locationInView(tab_dev_list))
            
            if pressedIndexPath != nil && pressedIndexPath?.row != NSNotFound && pressedIndexPath?.section != NSNotFound {
                
                self.becomeFirstResponder()
                let title = NSBundle.mainBundle().localizedStringForKey("邮件", value: "", table: nil)
                let menuItem: EmailMenuItem = EmailMenuItem(title: title, action: "emailMenuButtonPressed:")
                menuItem.indexPath = pressedIndexPath
                
                let menuController = UIMenuController.sharedMenuController()
                menuController.menuItems = [menuItem]
                
                var cellRect = tab_dev_list.rectForRowAtIndexPath(pressedIndexPath!)
                // 略微减少对象的长宽高（不要让其在单元格上方显示得太高）
                cellRect.origin.y = cellRect.origin.y + 40.0
                menuController.setTargetRect(cellRect, inView: tab_dev_list)
                menuController.setMenuVisible(true, animated: true)
            }
        }
    }
    
    func emailMenuButtonPressed(menuController: UIMenuController) {
        
        let menuItem: EmailMenuItem = UIMenuController.sharedMenuController().menuItems![0] as! EmailMenuItem
        if menuItem.indexPath != nil {
            self.resignFirstResponder()
            self.sendEmailForEntryAtIndexPath(menuItem.indexPath)
        }
    }
    
    func sendEmailForEntryAtIndexPath(indexPath: NSIndexPath) {
        
        let play: Group = self.plays[indexPath.section] as! Group
        let quotation: Dev_item = play.dev_items
        
        // 在实际使用中，可以调用邮件的API来实现真正的发送邮件
        print("用以下语录发送邮件: \(quotation.Name)")
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        //if result.Value== MFMailComposeResultFailed.value {
        // 在实际使用中，显示一个合适的警告框来提示用户
        //print("邮件发送失败,错误信息: \(error)")
        //}
    }
    
    func played() -> NSArray {
        
        if playe == nil {
            
//            var url = NSBundle.mainBundle().URLForResource("PlaysAndQuotations", withExtension: "plist")
//            var playDictionariesArray = NSArray(contentsOfURL: url!)
//            playe = NSMutableArray(capacity: playDictionariesArray!.count)
            playe = NSMutableArray(capacity: 3)
            for i in 1...3 {
                
                let play: Group! = Group()
                play.Name = "设备"+"\(i)"
                
                //var quotationDictionaries:NSArray = playDictionary["quotations"] as! NSArray
                //var quotations = NSMutableArray(capacity: quotationDictionaries.count)
                
                //for quotationDictionary in quotationDictionaries {
                    
                    //var quotationDic:NSDictionary = quotationDictionary as! NSDictionary
                play.dev_items.Name = play.Name
                play.dev_items.not_turnon = true
                play.dev_items.update_time="更新时间：2015/5/14 14:20:00"
                play.dev_items.water_tmp = 80
                play.dev_items.oxy_val = 100
                    //quotation.setValuesForKeysWithDictionary(quotationDic as! [String: AnyObject])
                
                //}
                playe!.addObject(play)
            }
        }
        
        return playe!
    }

  

}
