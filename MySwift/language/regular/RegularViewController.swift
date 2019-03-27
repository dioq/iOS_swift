//
//  RegularViewController.swift
//  Swift_stu
//
//  Created by William on 2018/9/13.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class RegularViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mytextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytextfield.delegate = self
    }
    
    @IBAction func action0(_ sender: UIButton) {
        print(mytextfield.text!)
        let regex = "^1\\d{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let message = mytextfield.text!
        let isValid = predicate.evaluate(with: message)
        print(isValid ? "是手机号" : "不是手机号")
    }
    
    @IBAction func action01(_ sender: UIButton) {
        print(mytextfield.text!)
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
//        let email = "lifusc464@qq.com"
        let email = mytextfield.text!
        let isValid = predicate.evaluate(with: email)
        print(isValid ? "正确的邮箱地址" : "错误的邮箱地址")
    }
    
    @IBAction func action002(_ sender: UIButton) {
        print(mytextfield.text!)
        let regex = "^[\\u4E00-\\u9FA5]+(·[\\u4E00-\\u9FA5]+)*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let message = mytextfield.text!
        let isValid = predicate.evaluate(with: message)
        print(isValid ? "姓名" : "不是姓名")
    }
    
    @IBAction func action3(_ sender: UIButton) {
        print(mytextfield.text!)
        let regex = "^[-_a-zA-Z0-9]{6,20}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let message = mytextfield.text!
        let isValid = predicate.evaluate(with: message)
        print(isValid ? "是微信" : "不是微信")
    }
    
    @IBAction func action4(_ sender: UIButton) {
        print(mytextfield.text!)
        let regex = "^[1-9]{1}[0-9]{5,15}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let message = mytextfield.text!
        let isValid = predicate.evaluate(with: message)
        print(isValid ? "是QQ" : "不是QQ")
    }
    
    
    //还没实现
    @IBAction func action02(_ sender: UIButton) {
        let regex = "\\s{10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let email = " 1 2 3232"
        let isValid = predicate.evaluate(with: email)
        print(isValid,isValid ? "有空格" : "无空格")
    }
    
    //点击return键响应的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
