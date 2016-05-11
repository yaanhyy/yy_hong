//
//  DevListViewController.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/9.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit

class DevListViewController: UIViewController {

    @IBOutlet weak var img_sideslip: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    func initview(){
        
        
        //给侧滑图片添加点击事件
        //设置允许交互属性
        img_sideslip.userInteractionEnabled = true
        /////添加tapGuestureRecognizer手势
        let tapGR = UITapGestureRecognizer(target: self, action: "tapHandler:")
        img_sideslip.addGestureRecognizer(tapGR)        //////手势处理函数
        func tapHandler(sender:UITapGestureRecognizer) {
           // self.view.dis
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
