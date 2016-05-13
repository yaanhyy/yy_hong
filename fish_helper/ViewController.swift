//
//  ViewController.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/1/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    //@IBOutlet weak var login_backgd: UIImageView!
    @IBOutlet weak var user_name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var result_message_lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //login_backgd.backgroundColor
        //btnLgoin.layer.cornerRadius=4.0
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        let height = screenSize.height * 0.75
//        let width  = user_name.bounds.width;
//        user_name.frame = CGRectMake(25, height, width, 40)
//        self.view.addSubview(user_name)
        user_name.placeholder="请输入用户名"
        user_name.becomeFirstResponder()
        user_name.keyboardType = UIKeyboardType.NumberPad
        user_name.delegate = self
        password.returnKeyType = UIReturnKeyType.Done
        password.placeholder="请输入密码"
        password.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchview(sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }
   
  
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {

        textField.resignFirstResponder()

        return true;
    }
 
   
    @IBAction func did_login_onclick(sender: AnyObject) {        /**登陆验证成功**/
        if user_name.text == "123" && password.text == "123"{
            self.performSegueWithIdentifier("btn_login", sender: nil)
        }else{
            result_message_lable.text = "username or passward is error!"
        }
    }
    @IBAction func did_register_onclick(sender: UIButton) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}

