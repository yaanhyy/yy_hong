//
//  CheckButton.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/31.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import UIKit
@IBDesignable class CheckBotton: UIView {
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
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}


//
//  CheckBottom.swift
//
//
//  Created by 王少兰 on 16/5/31.
//
//

//import UIKit
//
//@IBDesignable
//class CheckBottom: UIView {
//    
//    @IBOutlet weak var img_backgd: UIImageView!
//    @IBOutlet weak var lab_name: UILabel!
//    var isSelected:Bool = false
//    var str:String!
//    weak var view: UIView!
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupSubviews()
//    }
//    
//    convenience init() {
//        self.init(frame: CGRect.zero)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupSubviews()
//    }
//    func setupSubviews(){
//        view = loadViewFromNib()
//        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
//        addSubview(view)
//        img_backgd.image = UIImage(named: "check_un.png")
//        isSelected = false
//        lab_name.textColor = UIColor.blackColor()
//    }
//    
//    func loadViewFromNib()->UIView{
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
//        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
//        return view
//    }
//    
//    
//    @IBAction func onClicked(sender: AnyObject) {
//        
//        if isSelected
//        {
//            img_backgd.image = UIImage(named: "check_un.png")
//        }
//        else
//        {
//            img_backgd.image = UIImage(named: "check_on.png")
//        }
//        print("Button clicked!")
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        backgroundColor = UIColor.groupTableViewBackgroundColor()
//    }
//    
//    @IBInspectable var title: String = "" {
//        didSet {
//            self.lab_name.text = title
//        }
//    }
//    
//    /*
//     // Only override drawRect: if you perform custom drawing.
//     // An empty implementation adversely affects performance during animation.
//     override func drawRect(rect: CGRect) {
//     // Drawing code
//     }
//     */
//    
//}
//
/*
 //
 //  CheckButton.swift
 //  fish_helper
 //
 //  Created by 王少兰 on 16/5/30.
 //  Copyright © 2016年 洪远洋. All rights reserved.
 //
 
 import UIKit
 
 @IBDesignable
 class CheckButton: UIView {
 
 @IBOutlet weak var img_backgd: UIImageView!
 @IBOutlet weak var lab_name: UILabel!
 var isSelected:Bool = false
 var str:String!
 weak var view: UIView!
 override init(frame: CGRect) {
 super.init(frame: frame)
 setupSubviews()
 }
 
 convenience init() {
 self.init(frame: CGRect.zero)
 }
 
 required init?(coder aDecoder: NSCoder) {
 super.init(coder: aDecoder)
 setupSubviews()
 }
 
 
 func setupSubviews(){
 view = loadViewFromNib()
 view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
 addSubview(view)
 img_backgd.image = UIImage(named: "check_un.png")
 isSelected = false
 lab_name.textColor = UIColor.blackColor()
 }
 
 func loadViewFromNib()->UIView{
 let bundle = NSBundle(forClass: self.dynamicType)
 let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
 let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
 return view
 }
 
 
 @IBAction func onClicked(sender: AnyObject) {
 
 if isSelected
 {
 img_backgd.image = UIImage(named: "check_un.png")
 }
 else
 {
 img_backgd.image = UIImage(named: "check_on.png")
 }
 print("Button clicked!")
 }
 
 override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
 backgroundColor = UIColor.groupTableViewBackgroundColor()
 }
 
 @IBInspectable var title: String = "" {
 didSet {
 self.lab_name.text = title
 }
 }
 
 }
 
 
 */