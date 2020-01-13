//
//  BrowserVC.swift
//  Swift_stu
//
//  Created by William on 2018/9/13.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class BrowserVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func action01(_ sender: UIButton) {
        let urlString = "https://www.jianshu.com/p/64e3bc8cffdb"
        let url = URL(string: urlString)
        
        let yes =  UIApplication.shared.canOpenURL(url!)
        if yes == false {
            print("浏览器不可跳转")
            return
        }
        
        if #available(iOS 10.0, *) { //iOS10 以后
            UIApplication.shared.open(url!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""]) { (yes) in
                if yes {
                    print("10.x跳转成功")
                }else {
                    print("10.x跳转失败")
                }
            }
        } else {// iOS10 以前
            UIApplication.shared.openURL(url!)
        }
    }
    
}
