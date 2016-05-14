//
//  SectionHeaderView.swift
//  表格动画手势示例
//
//  Created by Semper Idem on 14-10-22.
//  Copyright (c) 2014年 星夜暮晨. All rights reserved.
//

import UIKit

// 该协议将被分节表头的委托实现； 当分节表被打开关闭时，分节表头将通知发送给委托
protocol SectionHeaderViewDelegate: class, NSObjectProtocol{
    
    func sectionHeaderView(sectionHeaderView: DevSectionHeaderView, sectionOpened: Int)
    func sectionHeaderView(sectionHeaderView: DevSectionHeaderView, sectionClosed: Int)
}

class DevSectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lab_dev_name: UILabel!
    @IBOutlet weak var lab_dev_online: UILabel!
    @IBOutlet weak var btn_disclosure: UIButton!
    
    var delegate: SectionHeaderViewDelegate!
    
    var section: Int!
    
    override func awakeFromNib() {
        
        // 设置disclosure 按钮的图片（被打开）
        self.btn_disclosure.setImage(UIImage(named: "dev_close"), forState: UIControlState.Selected)
        
        // 建立点击手势识别
        var tapGesture = UITapGestureRecognizer(target: self, action: "toggleOpen:")
        
        self.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func toggleOpen(sender: UITapGestureRecognizer){
        self.toggleOpenWithUserAction(true)
    }
    
    func toggleOpenWithUserAction(userAction: Bool) {
        
        // 切换disclosure按钮的状态（开启/关闭）
        self.btn_disclosure.selected = !self.btn_disclosure.selected
        
        // 如果确信是用户进行的操作，将给委托传递相应的消息
        if userAction {
            if self.btn_disclosure.selected {
                if self.delegate.respondsToSelector("sectionHeaderView:sectionOpened:") {
                    NSLog("Press Open")
                    self.delegate.sectionHeaderView(self, sectionOpened: self.section)
                }
            }
            else {
                if self.delegate.respondsToSelector("sectionHeaderView:sectionClosed:") {
                    NSLog("Press Close")
                    self.delegate.sectionHeaderView(self, sectionClosed: self.section)
                }
            }
        }
    }
}