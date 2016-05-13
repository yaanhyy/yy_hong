//
//  DevListViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/9.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class DevListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
      var img_sideslip: UIImageView!
      var img_weather_state: UIImageView!
      var lab_weather_details: UILabel!
      var img_weather_flush: UIImageView!
      var lab_dev_sum: UILabel!
      var img_dev_add: UIImageView!
      var tab_dev_list: UITableView!
      var lab_dev_online: UILabel!
      var lab_title: UILabel!
      var lab_underliner: UILabel!
    
    var dataArray: NSMutableArray?
        var baby = ["宝宝0","宝宝1","宝宝2","宝宝3","宝宝4","宝宝5","宝宝6","宝宝7","宝宝8","宝宝9","宝宝10","宝宝11"]
    
        var babyImage = ["宝宝0.jpg","宝宝1.jpg","宝宝2.jpg","宝宝3.jpg","宝宝4.jpg","宝宝5.jpg","宝宝6.jpg","宝宝7.jpg","宝宝8.jpg","宝宝9.jpg","宝宝10.jpg","宝宝11.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    func init_views(){
        
        let rec_screen:CGRect = UIScreen.mainScreen().bounds
        let val_screen_height = rec_screen.height
        let val_screen_width  = rec_screen.width
        
        //设备数量以上部分的 背景
        let img_top_views_backgd = UIImageView(image: UIImage(named: "weather_bj.png"))
        img_top_views_backgd.frame = CGRectMake(0, 0, val_screen_width, val_screen_height/6)
        self.view.addSubview(img_top_views_backgd)
        
        //侧滑的背景图片
        img_sideslip=UIImageView(image:UIImage(named:"mulu.png"))
        img_sideslip.frame=CGRectMake(0,0,val_screen_width*0.1,val_screen_height/24)
        self.view.addSubview(img_sideslip)
        init_btn_imgview_onclick(img_sideslip)
        
        //产品推广标签
        lab_title = UILabel(frame: CGRectMake(val_screen_width*0.1, 0, val_screen_width*0.9, val_screen_height/24))
        lab_title.text = "护渔宝智能水产监控系统 400-0806390"
        lab_title.adjustsFontSizeToFitWidth = true
        //lab_title.backgroundColor = UIColor.clearColor()
        lab_title.textColor = UIColor.whiteColor()
        self.view.addSubview(lab_title)
        
        print(val_screen_height/24)
        //产品推广和天气分割线
        lab_underliner = UILabel(frame: CGRectMake(0, val_screen_height/24, val_screen_width, CGFloat(1)))
        //lab_title.backgroundColor = UIColor.blueColor()
        self.view.addSubview(lab_underliner)
        
        //天气状态图片
        img_weather_state = UIImageView(image: UIImage(named: "yun.png"))
        img_weather_state.frame = CGRectMake(0, val_screen_height/24+1, val_screen_width*0.2, (val_screen_height/6 - val_screen_height/24-1))
        img_weather_state.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(img_weather_state)
        
        //天气文字描述
        lab_weather_details = UILabel(frame: CGRectMake(val_screen_width*0.2, val_screen_height/24+1, val_screen_width*0.6, (val_screen_height/6 - val_screen_height/24-1)))
        lab_weather_details.adjustsFontSizeToFitWidth = true
        lab_weather_details.preferredMaxLayoutWidth = 2
        lab_weather_details.textColor = UIColor.whiteColor()
        self.view.addSubview(lab_weather_details)
        
        //天气刷新图片
        img_weather_flush = UIImageView(frame: CGRectMake(val_screen_width*0.8, val_screen_height/24+1, val_screen_width*0.2, (val_screen_height/6 - val_screen_height/24-1)))
        img_weather_flush.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(img_weather_flush)
        init_btn_imgview_onclick(img_weather_flush)
        
        //设备数量一栏背景图片设置
        let img_dev_nums_views_backgd = UIImageView(image:UIImage(named:"clockbg_unpress.png"))
        img_dev_nums_views_backgd.frame=CGRectMake(0,val_screen_height/6,val_screen_width,val_screen_height/15)
        self.view.addSubview(img_dev_nums_views_backgd)
        
        //设备数量标签
        lab_dev_sum = UILabel(frame:CGRectMake(2,val_screen_height/6,val_screen_width*0.45,val_screen_height*1/15))// /15+/6
        lab_dev_sum.text = "设备数量:15台"
        lab_dev_sum.adjustsFontSizeToFitWidth = true
        self.view.addSubview(lab_dev_sum)
        
        //在线设备标签
        lab_dev_online = UILabel(frame:CGRectMake(2+val_screen_width*0.45,val_screen_height/6,val_screen_width*0.45,val_screen_height*1/15))// /15+/6
        lab_dev_online.text = "在线设备:0台"
        lab_dev_online.adjustsFontSizeToFitWidth = true;
        self.view.addSubview(lab_dev_online)
        
        //设备添加
        img_dev_add = UIImageView(image:UIImage(named:"dev_add_unpress.png"))
        img_dev_add.frame=CGRectMake(2+val_screen_width*0.9,val_screen_height/6+1,val_screen_width*0.1-4,val_screen_height*1/15-2)
        img_dev_add.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(img_dev_add)
        init_btn_imgview_onclick(img_dev_add)
        
        //列表一栏数据
        self.dataArray = NSMutableArray()
        self.dataArray!.addObject("11111")
        self.dataArray!.addObject("22222")
        self.dataArray!.addObject("33333")
        self.dataArray!.addObject("44444")
        
        //列表一栏控件UITableView(frame: CGRectMake(0, 0, 320, 600), style: UITableViewStyle.Plain)  
        tab_dev_list = UITableView(frame: CGRectMake(1, val_screen_height*7/30, val_screen_width-2, val_screen_height*23/30),style: UITableViewStyle.Plain)
        tab_dev_list.dataSource = self
        tab_dev_list.delegate = self
        
        tab_dev_list.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyTestCell")
        self.view.addSubview(tab_dev_list)
        
        
        
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
    

    //不同item个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //多少个item
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataArray!.count
    }
    //绘制cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel?.text = "Row #  \(self.dataArray!.objectAtIndex(indexPath.row))"
        return cell
    }
    
    var isFlag = [Bool](count : 12, repeatedValue: false)
    //删除实现
        func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
                let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
                    (action: UITableViewRowAction,indexPath: NSIndexPath) -> Void in
                    let menu = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                         let cancelAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: nil)
                        let facebookAction = UIAlertAction(title: "facebook", style: UIAlertActionStyle.Default, handler: nil)
            
                        let twitterAction = UIAlertAction(title: "twitter", style: UIAlertActionStyle.Default, handler: nil)
                        menu.addAction(facebookAction)
                        menu.addAction(twitterAction)
                        menu.addAction(cancelAction)
                        self.presentViewController(menu, animated: true, completion: nil)
                    })
                let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {
                (action: UITableViewRowAction,indexPath: NSIndexPath) -> Void in
                self.baby.removeAtIndex(indexPath.row)
                self.babyImage.removeAtIndex(indexPath.row)
                self.isFlag.removeAtIndex(indexPath.row)
                self.tab_dev_list.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            })
        return [shareAction,deleteAction]
	}
    //
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
