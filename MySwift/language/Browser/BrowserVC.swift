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
        
        if #available(iOS 10.0, *) { //iOS10 以后
            UIApplication.shared.open(url!, options: [UIApplication.OpenExternalURLOptionsKey(rawValue: ""):""]) { (yes) in
                if yes {
                    print("10.x跳转成功")
                }else {
                     print("10.x跳转失败")
                }
            }
        } else {// iOS10 以前
            let yes =  UIApplication.shared.canOpenURL(url!)
            if yes {
                print("9.x跳转成功")
            }else {
                print("9.x跳转失败")
            }
        }
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
