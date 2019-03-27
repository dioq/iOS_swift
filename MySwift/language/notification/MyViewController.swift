//
//  MyViewController.swift
//  Notification
//
//  Created by William on 2018/7/20.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendNo(_ sender: UIButton) {
        //点击发送通知进行
        NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"this is a sent valued"])
    }
    
    //最后要记得移除通知
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
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
