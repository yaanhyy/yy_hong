//
//  XVView.swift
//  StoryBoardXibDemo
//
//  Created by tb on 15/11/2.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

var LoginisSelected:Bool = false
@IBDesignable class XVView: UIView {
    @IBOutlet private var contView: UIView!
    
    @IBOutlet private weak var imageTitleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    
    @IBInspectable var imageTitle:String?
        {
        get {
            return imageTitleLabel.text
        }
        set(newTitle){
            imageTitleLabel.text = newTitle
        }
    }
    @IBInspectable var image:UIImage?
        {
        get {
            return imageView.image
        }
        set(newImage) {
            imageView.image = newImage
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
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
        let nib = UINib(nibName: "XVView", bundle: bundle)
        contView = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        contView.frame = bounds
        self.addSubview(contView)
        var h = imageView.bounds.height
        var w = imageView.bounds.width
        
        
        if h>w
        {
            imageView.frame = CGRect(x: 0, y: (h-w)/2, width: w, height: w)
        }
        else if h<w
        {
            imageView.frame = CGRect(x: 0, y: 0, width: h, height: h)
        }
        
        //imageView.contentMode = UIViewContentModeScaleToFill
    }
    
//    @IBAction func onClicked(sender: AnyObject) {
//        
//        if isSelected
//        {
//            imageView.image = UIImage(named: "check_un.png")
//            isSelected = false
//        }
//        else
//        {
//            imageView.image = UIImage(named: "check_on.png")
//            isSelected = true
//        }
//        print("Button clicked!")
//    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //backgroundColor = UIColor.groupTableViewBackgroundColor()
        imageView.image = UIImage(named: "check_touch.png")
    }
    override func touchesEnded(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        backgroundColor = UIColor.clearColor()
        if LoginisSelected
        {
            imageView.image = UIImage(named: "check_un.png")
            LoginisSelected = false
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(LoginisSelected, forKey: "user_login_flag")
        }
        else
        {
            imageView.image = UIImage(named: "check_on.png")
            LoginisSelected = true
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
