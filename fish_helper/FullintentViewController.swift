//
//  FullintentViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/17.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class FullintentViewController:UIViewController,GCDAsyncUdpSocketDelegate{
    
    @IBOutlet weak var lab_dev_name: UILabel!
    @IBOutlet weak var img_dev_online: UILabel!
    @IBOutlet weak var lab_more_day: UILabel!
    @IBOutlet weak var lab_seven_days: UILabel!
    @IBOutlet weak var lab_two_day: UILabel!
    @IBOutlet weak var lab_yesterday: UILabel!
    @IBOutlet weak var lab_today: UILabel!
    @IBOutlet weak var view_top: UIView!
    @IBOutlet weak var view_bottom: UIView!
    @IBOutlet weak var view_start: UIView!
    @IBOutlet weak var view_stop: UIView!
    @IBOutlet weak var view_auto: UIView!
    @IBOutlet weak var view_setting: UIView!
    @IBOutlet weak var img_reback: UIImageView!
    
    var dev_name:String!
    var his_stat:UInt8 = 0
    
    var HIS_STAT_LOADING:UInt8 = 0
    var HIS_STAT_DISP:UInt8 = 1
    var HIS_STAT_DISP_HIS:UInt8 = 2
    var HIS_STAT_FAIL:UInt8 = 3
    var fullintent_focus_dev_index:Int = 0
    var var_sel_index:UInt8 = 0
    var tmp_sum:Float = 0    
    var his_data_type:Bool = true //one day ; false is severn days
    override func viewDidLoad() {
        super.viewDidLoad()
        
        init_datas()
        init_views()
        send_commond()
    }
    
    func init_datas(){
        //dev = dev_grp.dev_info[fullintent_focus_dev_index]
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
    
    var val_severn_days_sum:UInt8 = 0;
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,  withFilterContext filterContext: AnyObject!)
    {
        let count = data.length / sizeof(UInt8)
        
        // create an array of Uint8
        var buf = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&buf, length:count * sizeof(UInt8))
        var result =  frame_analysis(buf_info: buf, frame_len: count)
        switch result {
        case 0:  //login in
            var i = 1
            
            if his_data_type
            {
                his_stat = HIS_INFO_TYPE_TIME
                did_clear_drawing_onclick()//清除所有点
                did_top_draw_onclick(view_top)
                did_bottom_draw_onclick(view_bottom)
            }
            else
            {
                if val_severn_days_sum < 7{
                    
                     dev_grp.dev_info[fullintent_focus_dev_index].his_info_item7.addObject(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item)
                    val_severn_days_sum++
                    let date = NSDate().dateByAddingTimeInterval(-(86400*Double(val_severn_days_sum)))
                    let calendar = NSCalendar.currentCalendar()
                    let components = calendar.components([.Day , .Month , .Year], fromDate: date)
                    year1 =  UInt16(components.year)
                    month1 = UInt16(components.month)-1
                    day1 = UInt16(components.day)
                    send_commond()
                    
                }
                else{
                    his_stat = HIS_INFO_TYPE_TIME
                    did_clear_drawing_onclick()//清除所有点
                    did_top_draw_onclick(view_top)
                    did_bottom_draw_onclick(view_bottom)
                }
               
            }
            
            
        default:
            var i = 0
        }
        // print("incoming message: \(data)");
    }

    
    func send_commond(){
       
        copy_array(dst_in: &frame_head_info.dev_id, src_in: dev_grp.dev_info[fullintent_focus_dev_index].dev_id, dst_start: 0, src_start: 0, arr_len: Int(DEV_ID_LEN))
         var len = frame_make( 0, frame_type: HIS_INFO_FRM, child_type:0,  dev_index:fullintent_focus_dev_index)
        send_frame(len:len, manu: dev_grp.dev_info[fullintent_focus_dev_index].manu_id)
        
    }
    
    //初始化
    func init_views(){
        
        init_btn_imgview_onclick(img_reback)
        init_btn_imgview_onclick(view_setting)
        init_btn_imgview_onclick(view_auto)
        init_btn_imgview_onclick(view_stop)
        init_btn_imgview_onclick(view_start)
        
        his_stat = HIS_STAT_LOADING
        
        if dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_FISH_ONLY_CTRL
        {
            
//            var i:UInt8 = 0;
//            if HIS_INFO_TYPE_FISH == his_info.his_type
//            {
                did_clear_drawing_onclick()
                did_top_draw_onclick(view_top)
                did_bottom_draw_onclick(view_bottom)
//            }
//            else if HIS_INFO_TYPE_HOUR == his_info.his_type
//            {
//                did_clear_drawing_onclick()
//                 did_top_draw_onclick(view_top)
//                did_bottom_draw_onclick(view_bottom)
//            }
        }
        else
        {
//            tmp_layout_tmp=(LinearLayout) findViewById(R.id.dev_tmp_chart);
//            tmp_layout_tmp.setVisibility(View.GONE);
//            tmp_layout_ox=(LinearLayout) findViewById(R.id.dev_do_chart);
//            tmp_layout_ox.setVisibility(View.GONE);
//            TextView trend_text = (TextView) findViewById(R.id.tx_trend);
//            layout_moter=(LinearLayout) findViewById(R.id.dev_moter_chart);
//            layout_moter.setVisibility(View.VISIBLE);
//            init_moter_stat();
        }
        
        
        if dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_FISH_ONLY_CTRL
        {
            //get_sys_cfg(focus_dev_index);
        }
        //String id = DevId2st(dev_grp.dev_info[fullintent_focus_dev_index].dev_id);
        var id:String = StringToInt(dev_grp.dev_info[fullintent_focus_dev_index].dev_name) as String
       lab_dev_name.text = id
        if(dev_grp.dev_info[fullintent_focus_dev_index].flag & 0x8) == 0x8
        {
            //dev_stat_draw = context.getResources().getDrawable(R.drawable.online1);在线
        }
        else
        {
            //dev_stat_draw = context.getResources().getDrawable(R.drawable.offline1);离线
        }
//        ／／dev_name.setCompoundDrawablesWithIntrinsicBounds(null, null, dev_stat_draw,null);
        
        if(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_FISH_PH)
        {
            //dev_name.setText(id);
            lab_dev_name.text = id
        }
        else if dev_grp.dev_info[fullintent_focus_dev_index].dev_type == DEV_TYPE_FISH_PH
        {
//            imageView_ln1 = (LinearLayout) findViewById(R.id.ln_do);
//            imageView_ln1.setVisibility(View.VISIBLE);
//            imageView_ln2 = (LinearLayout) findViewById(R.id.ln_ph);
//            imageView_ln2.setVisibility(View.VISIBLE);
//            LinearLayout var = (LinearLayout) findViewById(R.id.ln_dev);
//            var.setVisibility(View.GONE);
//            var = (LinearLayout) findViewById(R.id.fullscreen_intent0_controls);
//            //	Drawable draw = #ffA8B4B9
//            //	var.setBackgroundDrawable(null);
//            var.setBackgroundColor(0xffA8B4B9);
//            display_var_sel_stat();
        }
        else
        {
//            imageView_ln1 = (LinearLayout) findViewById(R.id.ln_air);
//            imageView_ln1.setVisibility(View.VISIBLE);
//            imageView_ln2 = (LinearLayout) findViewById(R.id.ln_soil);
//            imageView_ln2.setVisibility(View.VISIBLE);
//            imageView_ln3 = (LinearLayout) findViewById(R.id.ln_co2);
//            imageView_ln3.setVisibility(View.VISIBLE);
//            LinearLayout var = (LinearLayout) findViewById(R.id.ln_dev);
//            var.setVisibility(View.GONE);
//            var = (LinearLayout) findViewById(R.id.fullscreen_intent0_controls);
//            //	Drawable draw = #ffA8B4B9
//            //	var.setBackgroundDrawable(null);
//            var.setBackgroundColor(0xffA8B4B9);
//            display_var_sel_stat();
        }
        
        
//        mFullThread = new FullTread();
//        mFullThread.start();
//        imageView_auto = (ImageView)findViewById(R.id.bt_mode_change);
//        imageView_start = (ImageView)findViewById(R.id.sp_power_on);
//        imageView_stop = (ImageView)findViewById(R.id.sp_power_off);
//        
//        
//        imageView_today = (LinearLayout)findViewById(R.id.sp_today);
//        imageView_yday = (LinearLayout)findViewById(R.id.sp_yday);
//        imageView_y2day = (LinearLayout)findViewById(R.id.sp_y2day);
//        imageView_y7day = (LinearLayout)findViewById(R.id.sp_y7day);
//        imageView_ymoreday = (LinearLayout)findViewById(R.id.sp_moreday);
        
//        today_ent(null);
//        display_motor_stat();
        
        //	dev_name.post(new Runnable() {
        //      public void run() {
//        if((dev_grp.dev_info[fullintent_focus_dev_index].flag &dev_group.DEV_ONLINE_FLAG) == dev_group.DEV_ONLINE_FLAG)
//        {
//            dev_stat_draw = context.getResources().getDrawable(R.drawable.online1);
//        }
//        else
//        {
//            dev_stat_draw = context.getResources().getDrawable(R.drawable.offline1);
//        }
//        dev_name.setCompoundDrawablesWithIntrinsicBounds(null, null, dev_stat_draw,null);
    }
    
    func get_sys_cfg(index:UInt8){
//        var id:String = nil;
//        var i:UInt8 = 0;
//        var iaddr:UInt8 = 0;
//        var dev_buf:[UInt8] = new byte[32];//max num once read
//        byte[] mid_buf = new byte[4];
//        
//        try {
//            //FileInputStream fos = context.openFileInput(dev_info.TIME_CFG_INFO_FILE);
//            id = DevId2Hexst(dev_grp.dev_info[index].dev_id);
//            FileInputStream fos = context.openFileInput(dev_info.SYS_CFG_INFO_FILE+id);
//            if(fos==null)
//            {
//                return -1;
//            }
//            fos.read(dev_buf, addr, SYS_CFG_NUM_LEN);
//            dev_grp.dev_info[index].sys_cfg_var.sys_var_num = dev_buf[addr];
//            for(i=0; i<dev_grp.dev_info[index].sys_cfg_var.sys_var_num; i++)
//            {
//                addr = 0;
//                fos.read(dev_buf, addr, SYS_CFG_INFO_TYPE_LEN);
//                dev_grp.dev_info[index].sys_cfg_var.sys_var_type[i] = dev_buf[addr];
//                switch (dev_buf[addr])
//                {
//                case SYS_CFG_INFO_TYPE_DO_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_max = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_min = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_UP:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_up = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_SALT:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_SALT_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.salt_cfg = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_max = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_min = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_WET_AIR_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_WET_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.wet_air_max = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_WET_AIR_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_WET_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.wet_air_min = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_MIN1:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_min1 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_MIN2:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_min2 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_MIN3:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_min3 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_DO_MIN4:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_DO_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.do_min4 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_WT_TMP_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_wt_max = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_WT_TMP_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_wt_min = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MAX1:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_max1 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MAX2:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_max2 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MAX3:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_max3 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_MAX4:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN);
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_max4 = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_AIR_NORM:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN); 
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_air_normal = copy_byte2short(dev_buf, addr); 
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_SOIL_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN); 
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_soil_max = copy_byte2short(dev_buf, addr);
//                    break;
//                case SYS_CFG_INFO_TYPE_TMP_SOIL_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN); 
//                    dev_grp.dev_info[index].sys_cfg_var.tmp_soil_min = copy_byte2short(dev_buf, addr); 
//                    break;
//                case SYS_CFG_INFO_TYPE_WET_SOIL_MAX:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN); 
//                    dev_grp.dev_info[index].sys_cfg_var.wet_soil_max = copy_byte2short(dev_buf, addr); 
//                    break;
//                case SYS_CFG_INFO_TYPE_WET_SOIL_MIN:
//                    addr = 0;
//                    fos.read(dev_buf, addr, SYS_CFG_INFO_TMP_LEN); 
//                    dev_grp.dev_info[index].sys_cfg_var.wet_soil_min = copy_byte2short(dev_buf, addr); 
//                    break;
//                }
//                
//            }
//            fos.close();
//        }catch (Exception e) {
//            e.printStackTrace();
//        }	
//        
//        return 0;
    }
    
    /******************************************************************
     *
     *   给控件添加手势
     *
     ******************************************************************/
    func init_btn_imgview_onclick(view:UIView){
        //设置允许交互属性
        view.userInteractionEnabled = true
        //添加tapGuestureRecognizer手势
        var tapGR:UITapGestureRecognizer!
        if view == img_reback{
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_reback_onclick(_:)))
        }
        else if view == view_start{
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_start_onclick(_:)))
        }
        else if view == view_stop {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_stop_onclick(_:)))
        }
        else if view == view_auto {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_auto_onclick(_:)))
        }
        else if view == view_setting {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_setting_onclick(_:)))
        }
        else if view == lab_seven_days {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_severn_days_onclick(_:)))
        }
        else if view == lab_today {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_one_day_onclick(_:)))
        }
        else if view == view_setting {
            tapGR = UITapGestureRecognizer(target: self,action:#selector(FullintentViewController.did_setting_onclick(_:)))
        }
        view.addGestureRecognizer(tapGR)
        
    }
    //返回手势处理函数
    func did_reback_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //开始手势处理函数
    func did_start_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //停止手势处理函数
    func did_stop_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //自动手势处理函数
    func did_auto_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //设置手势处理函数
    func did_setting_onclick(sender:UITapGestureRecognizer) {
        
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //七天手势处理函数
    func did_severn_days_onclick(sender:UITapGestureRecognizer){
        his_stat = HIS_STAT_LOADING
        his_data_type = false
        send_commond()
    }
    //一天手势处理函数
    func did_one_day_onclick(sender:UITapGestureRecognizer){
        his_stat = HIS_STAT_LOADING
        his_data_type = true
        send_commond()
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
     *   画曲线函数集
     *
     ******************************************************************/
    //上半部分曲线图
    func did_top_draw_onclick(view:UIView){

        var length:Int8 = 7
        
        var iq:Int = 0
        var width:CGFloat = view.bounds.width
        var height:CGFloat = view.bounds.height
    
        if((his_stat == HIS_STAT_FAIL) )
        {
            var lab_message:UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: width-20, height: height*0.1))
            lab_message.font = UIFont.boldSystemFontOfSize(width/18)
            lab_message.text = "读取历史数据记录失败，请稍后登陆查询"
            lab_message.textColor = UIColor.whiteColor()
        }
        else if (dev_grp.dev_info[fullintent_focus_dev_index].his_data_num != 0 )||(his_stat == HIS_STAT_LOADING)
        {
            
            var equal:UInt8=14;//13
            //-------------∂ØÃ¨ ˝æ›
            var tmp_max:Float!
            var tmp_min:Float!
            
            var tmp_max_arr = [Float](count:7,repeatedValue:0)
            var tmp_min_arr = [Float](count:7,repeatedValue:0)
            
            
            if(var_sel_index < 2)
            {
                
                for i in 0..<7{
                    tmp_max_arr[i] = -50
                    tmp_min_arr[i] = 127
                }
                tmp_max = -50;
                tmp_min = 127;//(float)100;//128.1 «Œﬁ¥´∏–∆˜µƒ«Èøˆ º‰∏ÙŒ™5.8
                
            }
            else if(var_sel_index ==  2)
            {
                
                for i in 0..<7{
                    tmp_max_arr[i] = 0;
                    tmp_min_arr[i] = 10000;
                }
                tmp_max=0;
	            tmp_min=10000;
                
            }
            else{
                
                for i in 0..<7{
                    tmp_max_arr[i] = 40;
                    tmp_min_arr[i] = 0;
                }
                tmp_max = 40;
                tmp_min = 0;
                
            }
            
            tmp_sum = 0;            
            
            for iq in 0..<dev_grp.dev_info[fullintent_focus_dev_index].his_info_item.count
            {
                    if dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].valid == 1
                    {
                        
                        var tmp:Float = 0
                        if var_sel_index == 0
                        {
                            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].tmp)/10
                            }
                            else
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].tmp_air)/10
                            }
                        }
                        else if var_sel_index == 1
                        {
                            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN) && (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].ph)/10
                            }
                            else
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].soil_tmp)/10
                            }
                            
                        }
                        else if(var_sel_index == 2)
                        {
                            tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].co2)
                        }
                        tmp_sum = tmp_sum + tmp;
                        
                        if(tmp > tmp_max)
                        {
                            tmp_max = tmp;
                        }
                        if(tmp < tmp_min)
                        {
                            tmp_min = tmp;
                        }
                        
                    }
            }
                var data_t:Float  = (tmp_max+2)
                tmp_max = data_t;
                data_t = (tmp_min - 1)
                tmp_min = data_t;
           
            //    			Log.e("his_data_num",""+dev_grp.dev_info[fullintent_focus_dev_index].his_data_num);
            var width_slice:Float =  Float(width)/Float(HIS_INFO_HOUR_NUM)
            var tmp_px = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)
            var tmp_py = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)
            
            
//            float[][] tmp_px_arr = new float[length][dev_group.HIS_INFO_HOUR_NUM];
//            float[][] tmp_py_arr = new float[length][dev_group.HIS_INFO_HOUR_NUM];
            
            var tmp_val:[Float] = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)

            //获取值
                var j:Int=0;
                for iq in 0..<dev_grp.dev_info[fullintent_focus_dev_index].his_info_item.count
                {
                    tmp_px[iq] = Float(iq)*(Float(width)/Float(equal)*12)/Float(HIS_INFO_HOUR_NUM)
                    if dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].valid == 1
                    {
                        var tmp:Float=0;
                        if var_sel_index == 0
                        {
                            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].tmp)/10
                            }
                            else
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].tmp_air)/10
                            }
                        }
                        else if var_sel_index == 1
                        {
                            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].ph)/10
                            }
                            else
                            {
                                tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].soil_tmp)/10
                            }
                        }
                        else
                        {
                            tmp = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].co2)
                        }
                        if iq%2 == 0 {
                            tmp_val[j] = tmp
                            j++
                        }
                        //Log.e("tmp_val"+iq,""+tmp_val[iq]);
                        tmp_py[iq] = Float(Float(height)*0.7-(tmp-tmp_min)*(Float(height)*0.7/(tmp_max-tmp_min))+Float(width)/10)
                        //Log.e("tmp_py: "+" "+iq,""+tmp_py[iq]);
                    }
                }
//            }
            //----------------±≥æ∞
            var line_tem_px0:Float = Float(1 * Float(width)/Float(equal))
            var line_tem_px1:Float = Float(2*Float(width)/Float(equal))
            var line_tem_px2:Float = Float(3*Float(width)/Float(equal))
            var line_tem_px3:Float = Float(4*Float(width)/Float(equal))
            var line_tem_px4:Float = Float(5*Float(width)/Float(equal))
            var line_tem_px5:Float = Float(6*Float(width)/Float(equal))
            var line_tem_px6:Float = Float(7*Float(width)/Float(equal))
            var line_tem_px7:Float = Float(8*Float(width)/Float(equal))
            var line_tem_px8:Float = Float(9*Float(width)/Float(equal))
            var line_tem_px9:Float = Float(10*Float(width)/Float(equal))
            var line_tem_px10:Float = Float(11*Float(width)/Float(equal))
            var line_tem_px11:Float = Float(12*Float(width)/Float(equal))
            var line_tem_px12:Float = Float(13*Float(width)/Float(equal))
            var line_tem_x = [Float](arrayLiteral: line_tem_px0,line_tem_px1,line_tem_px2,line_tem_px3,line_tem_px4,line_tem_px5,line_tem_px6,line_tem_px7,line_tem_px8,line_tem_px9,line_tem_px10,line_tem_px11,line_tem_px12)
            
            var s:Float = (5+(6%13))
            //Log.e("s",""+s);
            var t:UInt = UInt(s)
            //Log.e("i",""+t);
            
            for ii in 0..<13
            {
                did_two_point_line(CGFloat(line_tem_x[ii])+CGFloat(line_tem_px0/3),y0:height/7+(width/96+1)/2,x1:CGFloat(line_tem_x[ii])+CGFloat(line_tem_px0)/3,y1:height*0.87,color: 1,v: view_top)
                //canvas.drawLine((float)(line_tem_x[ii]+line_tem_px0/3),(float)(height/7+(width/96+1)/2),(float)line_tem_x[ii]+line_tem_px0/3,(float)(height*0.87),p_xy);
            }

            did_two_point_line(CGFloat(line_tem_px0)+CGFloat(line_tem_px0)/3,y0: (height/7+(width/96+1)/2),x1: CGFloat(line_tem_px0)+CGFloat(line_tem_px0)/3,y1: height*0.87,color: 1,v: view_top)
            did_two_point_line(CGFloat(line_tem_px12)+CGFloat(line_tem_px0)/3, y0: (height/7+(width/96+1)/2), x1: CGFloat(line_tem_px12)+CGFloat(line_tem_px0)/3, y1: (height*0.87),color: 1,v: view_top)
            //canvas.drawLine((float)line_tem_px0+line_tem_px0/3,(float)(height/7+(width/96+1)/2),(float)line_tem_px0+line_tem_px0/3,(float)(height*0.87),p1);
            //canvas.drawLine((float)line_tem_px12+line_tem_px0/3,(float)(height/7+(width/96+1)/2),(float)line_tem_px12+line_tem_px0/3,(float)(height*0.87),p1);
            var iii:Int;
            for iii in 1..<7
            {
                did_two_point_line(CGFloat(line_tem_px0)+CGFloat(line_tem_px0)/3, y0: (CGFloat(iii)*height/7+(width/96+1)/2), x1: width-width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y1: (CGFloat(iii)*height/7+(width/96+1)/2),color: 1,v: view_top)
                //canvas.drawLine((float)line_tem_px0+line_tem_px0/3,(float)(iii*height/7+(width/96+1)/2),(float)width-width/equal+line_tem_px0/3,(float)(iii*height/7+(width/96+1)/2),p_xy);
            }
            did_two_point_line(CGFloat(line_tem_px0)+CGFloat(line_tem_px0)/3, y0: (6*height/7+(width/96+1)/2), x1: width-width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y1: (6*height/7+(width/96+1)/2),color: 1,v: view_top)
          
            var time_jj = [String](arrayLiteral: "0:00","    ","4:00","    ","8:00","    ","12:00","    ","16:00","    ","20:00","","24:00")
            //String[] time_jjj=new String[]{"   ","40","32","24","16","  8","  0"};
            var time_jjj:[String];
            if(tmp_max<0){
                time_jjj=[String](arrayLiteral: "","100","80","60","40","20","0")
            }
            else{
                time_jjj=[String](arrayLiteral: "",String(tmp_max),
                    String(4*(tmp_max-tmp_min)/5+tmp_min),
                    String(3*(tmp_max-tmp_min)/5+tmp_min),
                    String(2*(tmp_max-tmp_min)/5+tmp_min),
                    String(1*(tmp_max-tmp_min)/5+tmp_min),
                    String(tmp_min))
            }
           
            for jj in 0..<13
            {
                //p1.setTextSize(width/30);//…Ë÷√◊÷ÃÂ¥Û–°12(480*800)
                did_drawlable_onlick(CGFloat(line_tem_x[jj])-width/60,y0: (height*0.96),text: time_jj[jj],color: 1,view: view_top)
                //canvas.drawText(time_jj[jj], line_tem_x[jj]-width/60, (float)(height*0.96), p1);
            }
            // jjj;
            for jjj in 1..<7
            {
                //p1.setTextSize(width/30);//…Ë÷√◊÷ÃÂ¥Û–°12(480*800)
                //canvas.drawText(time_jjj[jjj], (float)(line_tem_px0-width/20), (float)(jjj*height/7+(width/96+1)/2+width/60), p1);
                did_drawlable_onlick(CGFloat(line_tem_px0)-width/15,y0: (CGFloat(jjj)*height/7+(width/96+1)/2+width/60),text: time_jjj[jjj],color: 1,view: view_top)
                //canvas.drawText(time_jjj[jjj],(float)(line_tem_px0-width/15), (float)(jjj*height/7+(width/96+1)/2+width/60), p1);
            }
            //-----------------------------------------------------------------------------◊¯±Íœ‘ æend
            
            //    			Log.e("","3333333333333333 "+his_stat);
            if(his_stat == HIS_STAT_LOADING)
            {
                //p1.setTextSize(width / 18);// …Ë÷√◊÷ÃÂ¥Û–°
                var label:UILabel = UILabel(frame: CGRect(x: (width * 0.03), y: (height * 0.1), width: width*0.6, height: height*0.3))
                label.text="温度（加载中）"
                label.textColor = UIColor.whiteColor()
                label.font = UIFont.boldSystemFontOfSize(12.0)
                label.backgroundColor = UIColor.clearColor()
                label.textAlignment = NSTextAlignment.Center
                label.userInteractionEnabled = true

            }
            else
            {
                
                var k:Int=0
                    //
                //var pointArray:[CGPoint] = [CGPoint]()
                for i in 0..<HIS_INFO_HOUR_NUM-1
                {
                    
                        if(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i].valid == 1)&&(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i+1].valid == 1)
                        {
                            
                            did_two_point_line(CGFloat(tmp_px[i])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[i]), x1: CGFloat(tmp_px[i+1])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y1: CGFloat(tmp_py[i+1]),color: 2,v: view_top)
                            //canvas.drawLine((float)tmp_px[i]+width/equal+line_tem_px0/3, (float)(tmp_py[i]), (float)tmp_px[i+1]+width/equal+line_tem_px0/3, (float)tmp_py[i+1], pp[1]);//p4
                            
                            if i%2 == 0 {
                                //Log.e("tmp_val "+" "+k,""+tmp_val[k]);
                                //Log.e("tmp_py "+" "+k,""+(float)(tmp_py[i]-5));
                                if (k==0)&&(tmp_val[k+1]<=tmp_val[k])
                                {
                                    did_drawlable_onlick(CGFloat(tmp_px[i])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[i]), text: String(tmp_val[k]), color: 2,view: view_top)
                                    //canvas.drawText(""+(float)tmp_val[k], (float)tmp_px[i]+width/equal+line_tem_px0/3, (float)(tmp_py[i])-5, p1);
                                }
                                else if (k==0)&&(tmp_val[k+1]>tmp_val[k]) {
                                    did_drawlable_onlick(CGFloat(tmp_px[i])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[i]), text: String(tmp_val[k]), color: 2,view: view_top)
                                    //canvas.drawText(""+(float)tmp_val[k], (float)tmp_px[i]+width/equal+line_tem_px0/3, (float)(tmp_py[i])+5, p1);
                                }
                                else if(tmp_val[k]<tmp_val[k+1]){
                                    did_drawlable_onlick(CGFloat(tmp_px[i])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[i]), text: String(tmp_val[k]), color: 2,view: view_top)
                                    //canvas.drawText(""+(float)tmp_val[k], (float)tmp_px[i]+width/equal+line_tem_px0/3, (float)(tmp_py[i])-8, p1);
                                }
                                else {
                                    did_drawlable_onlick(CGFloat(tmp_px[i])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[i]), text: String(tmp_val[k]), color: 2,view: view_top)
                                    //canvas.drawText(""+(float)tmp_val[k], (float)tmp_px[i]+width/equal+line_tem_px0/3, (float)(tmp_py[i])-10, p1);
                                }
                                
                                k++;
                            }
                          
                        }
                        
                }
                
                    if dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[HIS_INFO_HOUR_NUM-1].valid == 1
                    {
                        did_two_point_line(CGFloat(tmp_px[HIS_INFO_HOUR_NUM-1])+width/CGFloat(equal)+CGFloat(line_tem_px0)/3, y0: CGFloat(tmp_py[HIS_INFO_HOUR_NUM-1]), x1: CGFloat(line_tem_px12)+CGFloat(line_tem_px0)/3, y1: CGFloat(tmp_py[HIS_INFO_HOUR_NUM-1]),color: 2,v: view_top)
                    }

                
                var label:UILabel = UILabel(frame: CGRect(x: (width * 0.02), y: (height * 0.01), width: width*0.4, height: height*0.11))
                label.textColor = UIColor.whiteColor()
                label.font = UIFont.boldSystemFontOfSize(12.0)
                label.backgroundColor = UIColor.clearColor()
                label.textAlignment = NSTextAlignment.Center
                label.userInteractionEnabled = true
                view_top.addSubview(label)
                
                if(var_sel_index == 0)
                {
                    
                    if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
                    {
                        
                        label.text="平均水温("+String(Float(Int(tmp_sum*10)/Int(dev_grp.dev_info[fullintent_focus_dev_index].his_data_num))/10)+")°C"
                    }
                    else
                    {
                        label.text="空气温度 "+String(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.air_tmp/10)
                    }
                }
                else if(var_sel_index == 1)
                {
                    if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
                    {
                        label.text = "PH:"+String(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.ph/10)
                        //canvas.drawText("PH : " +(float)dev_grp.dev_info[fullintent_focus_dev_index].var1.ph/10 , (float)(width*0.03), (float)(height*0.1),  p1);
                    }
                    else
                    {
                        label.text = "土壤温度: "+String(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.soil_tmp/10)
                        //canvas.drawText("Õ¡»¿Œ¬∂»: " +(float)dev_grp.dev_info[fullintent_focus_dev_index].var1.soil_tmp/10 , (float)(width*0.03), (float)(height*0.1),  p1);
                    }
                }
                else
                {
                    label.text = "二氧化碳: "+String(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.co2)
                    //canvas.drawText("∂˛—ıªØÃº: " +(float)dev_grp.dev_info[fullintent_focus_dev_index].var1.co2 , (float)(width*0.03), (float)(height*0.1),  p1);
                }
                //p4.setTextSize(width/20);
            }
            
        }
        else
        {
            var label:UILabel = UILabel(frame: CGRect(x: (width * 0.02), y: (height * 0.1), width: width*0.4, height: height*0.11))
            label.text="本日没有历史纪录"
            label.textColor = UIColor.whiteColor()
            label.font = UIFont.boldSystemFontOfSize(14.0)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = NSTextAlignment.Center
            label.userInteractionEnabled = true
            view_top.addSubview(label)
            
        }
    }

    //画下半部分曲线
    func did_bottom_draw_onclick(view:UIView){
        var days:Int8 = 7
        
        var iq:Int = 0
        var width:CGFloat = view.bounds.width
        var height:CGFloat = view.bounds.height
        var power_sum:UInt8 = 0
        var ox_sum:Float = 0
       
        
            var up_up:Float = 0
            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
            {
                up_up=Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_cfg_var.do_max)/10;
            }
            else
            {
                up_up=Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_cfg_var.wet_air_max)/10;
            }
            var down_down:Float = 0
            if (dev_grp.dev_info[fullintent_focus_dev_index].dev_type == DEV_TYPE_FISH_SIG_CTRL)||(dev_grp.dev_info[fullintent_focus_dev_index].dev_type == DEV_TYPE_FISH_DETECT_CTRL)
            {
                down_down=Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_cfg_var.do_min4)/10;//0
            }
            else if(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
            {
                down_down=Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_cfg_var.do_min1)/10;//0
            }
            else
            {
                down_down=Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_cfg_var.wet_air_min)/10;//0
            }
            
            if(his_stat==HIS_STAT_FAIL)
            {
                
                var lab_message:UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: width-20, height: height*0.1))
                lab_message.font = UIFont.boldSystemFontOfSize(width/18)
                lab_message.text = "读取历史数据记录失败，请稍后登陆查询"
                lab_message.textColor = UIColor.whiteColor()

            }
            else if (dev_grp.dev_info[fullintent_focus_dev_index].his_data_num != 0 )||(his_stat == HIS_STAT_LOADING)
            {
                var equal:(UInt8)=14
                
                var var_max:Float = -1
                var var_min:Float = 100
                var do_up:Float=0;
                var do_down:Float=0;
                var do_up_arr:[Float] = [Float](count:7,repeatedValue:0)
                var do_down_arr:[Float] = [Float](count:7,repeatedValue:0)
                var var_max_arr:[Float] = [Float](count:7,repeatedValue:0)
                var var_min_arr:[Float] = [Float](count:7,repeatedValue:0)
                for i in 0..<Int(days)
                {
                    var_max_arr[i] = -1
                    var_min_arr[i] = 100
                    
                    do_up_arr[i] = 0;
                    do_down_arr[i] = 0;
                }
                power_sum = 0;
                ox_sum = 0;
                var var1:Float = 0;

                    for(iq=0; iq<dev_grp.dev_info[fullintent_focus_dev_index].his_info_item.count; iq++)
                    {
                        if dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].valid == 1
                        {
                            if(var_sel_index == 0)
                            {
                                if (dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].ox)/10;
                                }
                                else
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].wet_air)/10;
                                }
                            }
                            else if(var_sel_index == 1)
                            {
                                if (dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP)
                                {
                                    
                                }
                                else
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].soil_wet)/10;
                                }
                            }
                            else
                            {
                                var1 = 0;
                            }
                            
                            ox_sum += var1
                            if(var1 > var_max)
                            {
                                var_max = var1;
                            }
                            if(var1 < var_min)
                            {
                                var_min = var1;
                            }
                            if(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].stat == 1)
                            {
                                power_sum++;
                            }
                        }
                    }
                    
                    /*int data_t  = (int)(do_max+1);
                     do_max = data_t;
                     data_t = (int)do_min;
                     do_min = data_t;*/
                    //----------------比较上下限值与曲线最值
                    var data_t:Float  = Float(var_max+2);/*do_max+1，拉大纵向距离*/
                    if(data_t>up_up)
                    {
                        var_max=data_t;
                    }else{
                        var_max=(up_up+1);
                    }
                    data_t = (var_min - 1);
                    if(data_t<down_down)
                    {
                        var_min=data_t;
                    }else{
                        var_min=down_down;
                    }
                    if(var_min == 0){
                        var_min = 0
                    }
                    do_up=Float((Float(height)*0.7-(up_up-var_min)*(Float(height)*0.7/(var_max-var_min))+Float(width)/10)+Float(width)/100)
                    do_down=Float( (Float(height)*0.7-(down_down-var_min)*(Float(height)*0.7/(var_max-var_min))+Float(width)/10)+Float(width)/100)
//                }
                
                
                //上下限
                
                //向下平移width/100
                var width_slice:Float = Float(width)/Float(HIS_INFO_HOUR_NUM)
                var ox_px = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)
                var ox_py = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)
//                var ox_px_arr = new float[length][dev_group.HIS_INFO_HOUR_NUM];
//                var ox_py_arr = new float[length][dev_group.HIS_INFO_HOUR_NUM];
                //	float[] ox_text = new float[dev_group.HIS_INFO_HOUR_NUM];
//                var ox_val_arr = new float[length][dev_group.HIS_INFO_HOUR_NUM];
                var ox_val = [Float](count:HIS_INFO_HOUR_NUM,repeatedValue:0)
                var1 = 0;
                

                var k:UInt8 = 0;
                    for(iq=0; iq<dev_grp.dev_info[fullintent_focus_dev_index].his_info_item.count; iq++)
                    {
                        ox_px[iq] = Float((Float(iq)*(Float(width)/Float(equal)*12)/Float(HIS_INFO_HOUR_NUM)));
                        if(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].valid == 1)
                        {
                            if(var_sel_index == 0)
                            {
                                if((dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].ox)/10;
                                }
                                else
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].wet_air)/10;
                                }
                            }
                            else if(var_sel_index == 1)
                            {
                                if((dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
                                {
                                    
                                }
                                else
                                {
                                    var1 = Float(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[iq].soil_wet)/10;
                                }
                            }
                            else
                            {
                                var1 = 0; //no sunshine
                            }
                            //		ox_text[iq]=var;
                            /*if(ox < do_min)
                             {
                             do_min = ox;
                             }
                             else if(ox > do_max)
                             {
                             do_max = ox;
                             }*/
                            if(iq % 2 == 0){
                                ox_val[Int(k)] = var1;
                                k++;
                            }
                            if((var1<=100) && (var1 >= -1))
                            {
                                ox_py[iq] = Float((Float(height)*0.7-(var1-var_min)*(Float(height)*0.7/(var_max-var_min))+Float(width)/10)-Float(width)/100);
                            }
                            else
                            {
                                ox_py[iq]=0;
                            }
                            
                        }
                    }
//                }
                
                
                //----------------背景
                var line_do_px0:Float = Float(1 * Float(width)/Float(equal))
                var line_do_px1:Float = Float(2*Float(width)/Float(equal))
                var line_do_px2:Float = Float(3*Float(width)/Float(equal))
                var line_do_px3:Float = Float(4*Float(width)/Float(equal))
                var line_do_px4:Float = Float(5*Float(width)/Float(equal))
                var line_do_px5:Float = Float(6*Float(width)/Float(equal))
                var line_do_px6:Float = Float(7*Float(width)/Float(equal))
                var line_do_px7:Float = Float(8*Float(width)/Float(equal))
                var line_do_px8:Float = Float(9*Float(width)/Float(equal))
                var line_do_px9:Float = Float(10*Float(width)/Float(equal))
                var line_do_px10:Float = Float(11*Float(width)/Float(equal))
                var line_do_px11:Float = Float(12*Float(width)/Float(equal))
                var line_do_px12:Float = Float(13*Float(width)/Float(equal))
                var line_do_x = [Float](arrayLiteral: line_do_px0,line_do_px1,line_do_px2,line_do_px3,line_do_px4,line_do_px5,line_do_px6,line_do_px7,line_do_px8,line_do_px9,line_do_px10,line_do_px11,line_do_px12)
               
                for(var ii:Int=0;ii<Int(equal-1);ii++)
                {//竖线
                     did_two_point_line(CGFloat(line_do_x[ii])+CGFloat(line_do_px0/3),y0:height/7+(width/96+1)/2,x1:CGFloat(line_do_x[ii])+CGFloat(line_do_px0)/3,y1:height*0.87,color: 1,v: view_bottom)
                    //canvas.drawLine((float)(line_do_x[ii]+line_do_px0/3),(float)(height/7+(width/96+1)/2),(float)line_do_x[ii]+line_do_px0/3,(float)(height*0.87),p_xy);
                }
                
               did_two_point_line(CGFloat(line_do_px0)+CGFloat(line_do_px0/3),y0:height/7+(width/96+1)/2,x1:CGFloat(line_do_px0)+CGFloat(line_do_px0)/3,y1:height*0.87,color: 1,v: view_bottom)
               did_two_point_line(CGFloat(line_do_px12)+CGFloat(line_do_px0/3),y0:height/7+(width/96+1)/2,x1:CGFloat(line_do_px12)+CGFloat(line_do_px0)/3,y1:height*0.87,color: 1,v: view_bottom)
                //canvas.drawLine((float)line_do_px0+line_do_px0/3,(float)(height/7+(width/96+1)/2),(float)line_do_px0+line_do_px0/3,(float)(height*0.87),p1);
                //canvas.drawLine((float)line_do_px12+line_do_px0/3,(float)(height/7+(width/96+1)/2),(float)line_do_px12+line_do_px0/3,(float)(height*0.87),p1);
                //int iii;//line_do_px0/3为x 平移
                for(var iii:Int=1;iii<Int(days);iii++)
                {//横线
                    did_two_point_line(CGFloat(line_do_px0)+CGFloat(line_do_px0)/3, y0: (CGFloat(iii)*height/7+(width/96+1)/2), x1: width-width/CGFloat(equal)+CGFloat(line_do_px0)/3, y1: (CGFloat(iii)*height/7+(width/96+1)/2),color: 1,v: view_bottom)
                    
                    //canvas.drawLine((float)line_do_px0+line_do_px0/3,(float)(iii*height/7+(width/96+1)/2),(float)width-width/equal+line_do_px0/3,(float)(iii*height/7+(width/96+1)/2),p_xy);
                }
                did_two_point_line(CGFloat(line_do_px0)+CGFloat(line_do_px0)/3, y0: (6*height/7+(width/96+1)/2), x1: width-width/CGFloat(equal)+CGFloat(line_do_px0)/3, y1: (6*height/7+(width/96+1)/2),color: 1,v: view_bottom)
                //canvas.drawLine((float)line_do_px0+line_do_px0/3,(float)(6*height/7+(width/96+1)/2),(float)width-width/equal+line_do_px0/3,(float)(6*height/7+(width/96+1)/2),p1);
                //上下限
                did_two_point_line(CGFloat(line_do_px0)+CGFloat(line_do_px0)/3, y0: CGFloat(do_up)-height*0.02, x1: width-width/CGFloat(equal)+CGFloat(line_do_px0)/3, y1: CGFloat(do_up)-height*0.02,color: 5,v: view_bottom)
                
                did_drawlable_onlick((width*0.9-width/CGFloat(equal)+CGFloat(line_do_px0)/3),y0: CGFloat(do_up)-height*0.02,text: String(up_up),color: 5,view: view_bottom)
                did_drawlable_onlick((width*0.9-width/CGFloat(equal)+CGFloat(line_do_px0)/3),y0: CGFloat(do_down)-height*0.04,text: String(down_down),color: 5,view: view_bottom)
                //canvas.drawText(""+down_down, (float)(width*0.9-width/equal+line_do_px0/3), (float)(do_down-height*0.04), p5);
                
                var time_jj = [String](arrayLiteral: "0:00","    ","4:00","    ","8:00","    ","12:00","    ","16:00","    ","20:00","    ","24:00")
                var time_jjj:[String]=[String](arrayLiteral:"",String(var_max),
                    String(4*(var_max-var_min)/5+var_min),
                    String(3*(var_max-var_min)/5+var_min),
                    String(2*(var_max-var_min)/5+var_min),
                    String(1*(var_max-var_min)/5+var_min),
                    String(var_min))
                
                for jj in 0..<Int(equal-1)
                {
                    //p1.setTextSize(width/30);//设置字体大小12(480*800)
                    //canvas.drawText(time_jj[jj], do_x[jj]-width/40, (float)(height*0.96), p1);
                     did_drawlable_onlick(CGFloat(line_do_x[jj])-width/60,y0: (height*0.96),text: time_jj[jj],color: 1,view: view_bottom)
                    //canvas.drawText(time_jj[jj], line_do_x[jj]-width/60, (float)(height*0.96), p1);
                }
                //int jjj;
                for jjj in 0..<Int(days)
                {
                    //p1.setTextSize(width/30);//设置字体大小12(480*800)
                    did_drawlable_onlick(CGFloat(line_do_px0)-width/15+CGFloat(line_do_px0)/3,y0: (CGFloat(jjj)*height/7+(width/96+1)/2+width/60),text: time_jjj[jjj],color: 1,view: view_bottom)
                   //canvas.drawText(time_jjj[jjj], (float)(line_do_px0-width/15+line_do_px0/3), (float)(jjj*height/7+(width/96+1)/2+width/60), p1);
                }
                
                if(his_stat == HIS_STAT_LOADING)
                {
                    //p1.setTextSize(width / 18);// 设置字体大小
                    var label:UILabel = UILabel(frame: CGRect(x: (width * 0.03), y: (height * 0.1), width: width*0.6, height: height*0.3))
                    label.textColor = UIColor.whiteColor()
                    label.font = UIFont.boldSystemFontOfSize(12.0)
                    label.backgroundColor = UIColor.clearColor()
                    label.textAlignment = NSTextAlignment.Center
                    label.userInteractionEnabled = true
                    if(var_sel_index == 0)
                    {
                        
                        if((dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN)||(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN_CO2)||(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN_TMP))
                        {
                            label.text = "空气湿度（加载中）"
                            //canvas.drawText("空气湿度" + "（" + "加载中" + "）", (float) (width * 0.03),(float) (height * 0.1), p1);
                        }
                        else
                        {
                            label.text = "溶氧（加载中）"
                            //canvas.drawText("溶氧" + "（" + "加载中" + "）", (float) (width * 0.03),(float) (height * 0.1), p1);
                        }
                    }
                    else if(var_sel_index == 1)
                    {
                        if((dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN)||(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN_CO2)||(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type == DEV_TYPE_BARN_TMP))
                        {
                            label.text = "土壤湿度（加载中）"
                            //canvas.drawText("土壤湿度" + "（" + "加载中" + "）", (float) (width * 0.03),(float) (height * 0.1), p1);
                        }
                        else
                        {
                            label.text = "氨氮（加载中）"
                            //canvas.drawText("氨氮" + "（" + "加载中" + "）", (float) (width * 0.03),(float) (height * 0.1), p1);
                        }
                    }
                    else
                    {
                        label.text = "光照度（加载中）"
                        //canvas.drawText("光照度" + "（" + "加载中" + "）", (float) (width * 0.03),(float) (height * 0.1), p1);
                    }
                }
                else
                {
                

                    var k:Int = 0;
                    for(var i:Int=0; i<(HIS_INFO_HOUR_NUM-1); i++)
                        {//---------------线--点--文本
                            if((dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i].valid == 1)&&(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i+1].valid == 1))
                            {
                                /*if((dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i].stat==1)
                                 ||(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i+1].stat==1))*/
                                //Log.e("ox_py[i]"+i,""+ox_py[i]);
                                if(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[i+1].stat==1)
                                {
                                    did_two_point_line(CGFloat(ox_px[i])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y0: CGFloat(ox_py[i]), x1: CGFloat(ox_px[i+1])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y1: CGFloat(ox_py[i+1]),color: 2,v: view_bottom)
                                    //canvas.drawLine((float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i]), (float)ox_px[i+1]+width/equal+line_do_px0/3, (float)ox_py[i+1], p);
                                    
                                }else{
                                    did_two_point_line(CGFloat(ox_px[i])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y0: CGFloat(ox_py[i]), x1: CGFloat(ox_px[i+1])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y1: CGFloat(ox_py[i+1]),color: 3,v: view_bottom)
                                    //canvas.drawLine((float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i]), (float)ox_px[i+1]+width/equal+line_do_px0/3, (float)ox_py[i+1], p4);
                                    
                                }
                                
                                if(i%2 == 0){
                                    //if((k==0)&&(ox_val[k+1]<=ox_val[k])){
                                        did_drawlable_onlick(CGFloat(ox_px[i])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y0: CGFloat(ox_py[i]), text: String(ox_val[k]), color: 2,view: view_bottom)
                                        //canvas.drawText(""+(float)ox_val[k], (float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i])-5, p1);
//                                    }
//                                    else if((k==0)&&(ox_val[k+1]>ox_val[k])){
//                                        canvas.drawText(""+(float)ox_val[k], (float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i])+5, p1);
//                                    }
//                                    else if(ox_val[k]<ox_val[k+1]){
//                                        canvas.drawText(""+(float)ox_val[k], (float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i])-8, p1);   
//                                    }
//                                    else {
//                                        canvas.drawText(""+(float)ox_val[k], (float)ox_px[i]+width/equal+line_do_px0/3, (float)(ox_py[i])-10, p1);   							
//                                    }
//                                    
                                    k++;
                                }
                            }
                           
                        }
                    if((dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[HIS_INFO_HOUR_NUM-1].valid == 1) ){
                        if(dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[HIS_INFO_HOUR_NUM-1].stat==1)
                        {
                            did_two_point_line(CGFloat(ox_px[HIS_INFO_HOUR_NUM-1])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y0: CGFloat(ox_py[HIS_INFO_HOUR_NUM-1]), x1: CGFloat(line_do_px12)+CGFloat(line_do_px0)/3, y1: CGFloat(ox_py[HIS_INFO_HOUR_NUM-1]),color: 2,v: view_top)
                            //canvas.drawLine((float)ox_px[HIS_INFO_HOUR_NUM-1]+width/equal+line_do_px0/3, (float)(ox_py[HIS_INFO_HOUR_NUM-1]), (float)(line_do_px12+line_do_px0/3), (float)ox_py[HIS_INFO_HOUR_NUM-1], p);
                            
                        }else{
                            did_two_point_line(CGFloat(ox_px[HIS_INFO_HOUR_NUM-1])+width/CGFloat(equal)+CGFloat(line_do_px0)/3, y0: CGFloat(ox_py[HIS_INFO_HOUR_NUM-1]), x1: CGFloat(line_do_px12)+CGFloat(line_do_px0)/3, y1: CGFloat(ox_py[HIS_INFO_HOUR_NUM-1]),color: 3,v: view_top)
                           // canvas.drawLine((float)ox_px[HIS_INFO_HOUR_NUM-1]+width/equal+line_do_px0/3, (float)(ox_py[HIS_INFO_HOUR_NUM-1]), (float)(line_do_px12+line_do_px0/3), (float)ox_py[HIS_INFO_HOUR_NUM-1], p4);
                            
                        }
                    }
                    
//                    p1.setColor(Color.WHITE);// 设置白色
//                    int j;
//                    for(j=1;j<dev_group.HIS_INFO_HOUR_NUM;j++)
//                    {//---------------点和文本
//                        
//                        //if((j%12) == 0)
//                        if((j%24) == 0)
//                        {
//                            if((dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[j].valid == 1))
//                            {
//                                canvas.drawCircle(line_do_x[j/12]+line_do_px0/3, (float)(ox_py[j]), width/96, p1);
//                                p1.setTextSize(width/20);//设置字体大小24(480*800)
//                                if(var_sel_index == 0)
//                                {
//                                    
//                                    if((dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)
//                                        &&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)
//                                        &&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
//                                    {
//                                        canvas.drawText(String.valueOf((float)dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[j].ox/10),line_do_x[j/12]-width/40+line_do_px0/3, ox_py[j]-height/25, p1);
//                                    }
//                                    else
//                                    {
//                                        canvas.drawText(String.valueOf((float)dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[j].wet_air/10),line_do_x[j/12]-width/40+line_do_px0/3, ox_py[j]-height/25, p1);
//                                    }
//                                }
//                                else if(var_sel_index == 1)
//                                {
//                                    if((dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)
//                                        &&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)
//                                        &&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
//                                    {
//                                        
//                                    }
//                                    else
//                                    {
//                                        canvas.drawText(String.valueOf((float)dev_grp.dev_info[fullintent_focus_dev_index].his_info_item[j].soil_wet/10),line_do_x[j/12]-width/40+line_do_px0/3, ox_py[j]-height/25, p1);
//                                    }
//                                }
//                                else
//                                {
//                                    
//                                }
//                                
//                            }
//                        }
//                        
//                    }
                    //------溶氧
                    //p1.setTextSize(width/20);//设置字体大小
                    //if(his_stat == HIS_STAT_DISP)
                    var label:UILabel = UILabel(frame: CGRect(x: (width * 0.02), y: (height * 0.01), width: width*0.4, height: height*0.11))
                    label.textColor = UIColor.whiteColor()
                    label.font = UIFont.boldSystemFontOfSize(12.0)
                    label.backgroundColor = UIColor.clearColor()
                    label.textAlignment = NSTextAlignment.Center
                    label.userInteractionEnabled = true
                    view_bottom.addSubview(label)
                    if(var_sel_index == 0)
                    {
                        if((dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[ fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
                        {
                            label.text="平均溶氧("+String(Float(Int(ox_sum*10)/Int(dev_grp.dev_info[fullintent_focus_dev_index].his_data_num))/10)+")°C"
                            //canvas.drawText("平均溶氧"+ "("+(float) ((int)(ox_sum*10)/dev_grp.dev_info[fullintent_focus_dev_index].his_data_num)/10  +"mg)"+"  "+"开机时间"+"("+ (float)(int)(power_sum)+"小时)" , (float)(width*0.03), (float)(height*0.1), p1);
                        }
                        else
                        {
                            
                            //canvas.drawText("湿度: " +"  "+"开机时间"+ "（"+ (float)((int)(power_sum*100/60))/10 +"小时）" , (float)(width*0.03), (float)(height*0.1), p1);
                            label.text="空气湿度:"+String(Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.air_wet)/10)
                            //canvas.drawText("空气湿度: " +(float)dev_grp.dev_info[fullintent_focus_dev_index].var1.air_wet/10 , (float)(width*0.03), (float)(height*0.1),  p1);
                        }
                    }
                    else if(var_sel_index == 1)
                    {
                        if((dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_CO2)&&(dev_grp.dev_info[  fullintent_focus_dev_index].dev_type != DEV_TYPE_BARN_TMP))
                        {
                            label.text = "氨氮: 未连接传感器"
                            //canvas.drawText("氨氮: " +"未连接传感器" , (float)(width*0.03), (float)(height*0.1),  p1);
                        }
                        else
                        {
                            label.text = "土壤湿度: "+String(Float(dev_grp.dev_info[fullintent_focus_dev_index].sys_var.soil_wet)/10)
                            //canvas.drawText("土壤湿度: " +(float)dev_grp.dev_info[fullintent_focus_dev_index].var1.soil_wet/10 , (float)(width*0.03), (float)(height*0.1),  p1);
                        }
                    }
                        
                    else
                    {
                        label.text = "光照度: " + "未连接传感器"
                        //canvas.drawText("光照度: " +"未连接传感器" , (float)(width*0.03), (float)(height*0.1),  p1);
                    }
                    //p4.setTextSize(width/20);
                }
            }
            else
            {
                //p1.setTextSize(width/18);//设置字体大小
                var label:UILabel = UILabel(frame: CGRect(x: (width * 0.02), y: (height * 0.1), width: width*0.4, height: height*0.11))
                label.text="本日没有历史纪录"
                label.textColor = UIColor.whiteColor()
                label.font = UIFont.boldSystemFontOfSize(14.0)
                label.backgroundColor = UIColor.clearColor()
                label.textAlignment = NSTextAlignment.Center
                label.userInteractionEnabled = true
                view_bottom.addSubview(label)

                //canvas.drawText("本日没有历史数据记录", (float)(width*0.03), (float)(height*0.1), p1);
                //p4.setTextSize(width/20);
            }
            //canvas.drawText("线“━”,表示增氧机关", (float)(width*0.5), (float)(height*0.1), p4);
        
    }

    
    
    func did_drawlable_onlick(x0:CGFloat,y0:CGFloat,text:String,color:UInt8,view:UIView)
    {
    
        //for var index = 0;index < xLabels.count; ++index {
        //            let labelText = xLabels[index] as! NSString
        //            let labelX = 2.0 * chartMargin +  ( CGFloat(index) * xLabelWidth) - (xLabelWidth / 2.0)
        var x_val:CGFloat = (x0-6)
        if x_val <= 2 {
            x_val=2
        }
        let label:UILabel = UILabel(frame: CGRect(x: x_val, y: y0-14, width: 36, height: 14))
        label.text = text
        if color == 1 {
            label.textColor = UIColor.whiteColor()
            label.font = UIFont.boldSystemFontOfSize(10.0)
        }
        else if color == 2
        {
            label.textColor = UIColor.blackColor()
            label.font = UIFont.boldSystemFontOfSize(8.0)
        }
        else{
            label.textColor = UIColor.yellowColor()
            label.font = UIFont.boldSystemFontOfSize(8.0)
        }
        
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = NSTextAlignment.Left
            label.userInteractionEnabled = true

            view.addSubview(label)
        //}
    }
    //画两点直线
    func did_two_point_line(var x0:CGFloat,var y0:CGFloat,var x1:CGFloat,var y1:CGFloat,color:UInt8,v:UIView)
    {
        var pointArray = [CGPoint]()
        var pointView = CGPoint(x: x0 , y: y0)
        pointArray.append(pointView)
        pointView = CGPoint(x: x1 , y: y1)
        pointArray.append(pointView)
        if color == 1{
            did_drawline_onclick(v,pointArray: pointArray,color: UIColor.whiteColor(),linewidth: 1)
        }
        else if color == 2{
            did_drawline_onclick(v, pointArray: pointArray, color: UIColor.brownColor(),linewidth: 2)
        }
        else if color == 3{
            did_drawline_onclick(v, pointArray: pointArray, color: UIColor.cyanColor(),linewidth: 2)
        }
        else if color == 4{
            did_drawline_onclick(v, pointArray: pointArray, color: UIColor.greenColor(),linewidth: 2)
        }
        else if color == 5
        {
            did_drawline_onclick(v, pointArray: pointArray, color: UIColor.yellowColor(),linewidth: 2)
        }
        else if color == 6
        {
            
        }
        else if color == 7
        {
            
        }
        else if color == 8
        {
            
        }
        else
        {
            
        }
        
    }
    var _curves:[UIBezierPath]=[]
    func did_clear_drawing_onclick(){
        for i in 0..<_curves.count
        {
            _curves[i].removeAllPoints()
        }
        _curves.removeAll()
    }
    // 画曲线
    func did_drawline_onclick(view:UIView,pointArray:[CGPoint],color:UIColor,linewidth:UInt8)
    {
         var _curve = UIBezierPath()
        _curves.append(_curve)
        _curve.moveToPoint(pointArray.first!)
        _curve.addBezierThrough( pointArray)
         var _shapeLayer = CAShapeLayer()
        _shapeLayer.strokeColor = color.CGColor
        _shapeLayer.fillColor = nil
        if linewidth == 1{
            _shapeLayer.lineWidth = 1
        }
        else{
            _shapeLayer.lineWidth = 2
        }
        
        _shapeLayer.path = _curve.CGPath
        _shapeLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(_shapeLayer)
    }

}

class MyCanvas: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //把背景色设为透明
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let white_color = UIColor.whiteColor()
        white_color.set()
        
        let one_paint = UIBezierPath()
        one_paint.lineWidth = 5.0
       // one_paint.
        
        //创建一个矩形，它的所有边都内缩5%
        let drawingRect = CGRectInset(self.bounds,
                                      self.bounds.size.width * 0.05,
                                      self.bounds.size.height * 0.05)
        
        //确定组成绘画的点
        let topLeft = CGPointMake(CGRectGetMinX(drawingRect),CGRectGetMinY(drawingRect))
        
        //let topRight = CGPointMake(CGRectGetMaxX(drawingRect),CGRectGetMinY(drawingRect))
        
        let bottomRight = CGPointMake(CGRectGetMaxX(drawingRect),CGRectGetMaxY(drawingRect))
        
        let bottomLeft = CGPointMake(CGRectGetMinX(drawingRect),CGRectGetMaxY(drawingRect))
        
        let center = CGPointMake(CGRectGetMidX(drawingRect),CGRectGetMidY(drawingRect))
        
        ////开始绘制
        //bezierPath.moveToPoint(topLeft)
        //bezierPath.addLineToPoint(topRight)
        //bezierPath.addLineToPoint(bottomLeft)
        //bezierPath.addCurveToPoint(bottomRight, controlPoint1: center, controlPoint2: center)
        
        //使路径闭合，结束绘制
        //bezierPath.closePath()
        
        //设定颜色，并绘制它们
        UIColor.greenColor().setFill()
        UIColor.blackColor().setStroke()
        
        //bezierPath.fill()
        //bezierPath.stroke()
    }
}
