//
//  XVView.swift
//  StoryBoardXibDemo
//
//  Created by tb on 15/11/2.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

var checkSelected:UInt8 = 0

@IBDesignable class Manu_sig_op: UIView {
    @IBOutlet private var contView1: UIView!
    @IBOutlet weak var img_two: UIImageView!
    @IBOutlet weak var img_three: UIImageView!
    @IBOutlet weak var img_four: UIImageView!
    @IBOutlet weak var img_one: UIImageView!

    
    var CHECK_ONE_TRUE:UInt8 = 0x1
    var CHECK_TWO_TRUE:UInt8 = 0x2
    var CHECK_THREE_TRUE:UInt8 = 0x4
    var CHECK_FOUR_TRUE:UInt8 = 0x8

    
    @IBInspectable var imageTitle:String?
        {
        get {
            return nil
        }
        set(newTitle){
            //lab_title.text = newTitle
        }
    }
    @IBInspectable var image:UIImage?
        {
        get {
            return nil
        }
        set(newImage) {
            //imageView.image = newImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromXIB()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromXIB()
    }
    
    func initFromXIB() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "Manu_sig_op", bundle: bundle)
        print("nib"+"\(nib.instantiateWithOwner(self, options: nil)[0])")
        contView1 = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        contView1.frame = bounds
        print("contview.height = "+"\(contView1.frame.height)")
        self.addSubview(contView1)
        
        img_one.contentMode = UIViewContentMode.ScaleAspectFit
        img_two.contentMode = UIViewContentMode.ScaleAspectFit
        img_three.contentMode = UIViewContentMode.ScaleAspectFit
        img_four.contentMode = UIViewContentMode.ScaleAspectFit
        
    }

    @IBAction func did_one_isSeclicked(sender: AnyObject) {
        did_select(CHECK_ONE_TRUE,ch: img_one)
    }
    @IBAction func did_two_isSelected(sender: AnyObject) {
        did_select(CHECK_TWO_TRUE,ch: img_two)
    }
    @IBAction func did_three_isSelected(sender: AnyObject) {
        did_select(CHECK_THREE_TRUE,ch: img_three)
    }
    @IBAction func did_four_isSelected(sender: AnyObject) {
        did_select(CHECK_FOUR_TRUE,ch: img_four)
    }
    
    func did_select(isS:UInt8,ch:UIImageView){
        if checkSelected & isS == isS
        {
            checkSelected &= ~isS
            ch.image = UIImage(named: "check_un.png")//设置前景图片
            //ch.setBackgroundImage(UIImage(named: "imageName"), forState: UIControlState.Normal)//设置背景图片
        }
        else
        {
            checkSelected |= isS
            //ch.setImage(UIImage(named: "check_on.png"), forState: UIControlState.Normal)
            ch.image = UIImage(named: "check_on.png")
        }
    }

    @IBAction func tochDown(sender: AnyObject) {
        
    }

}
