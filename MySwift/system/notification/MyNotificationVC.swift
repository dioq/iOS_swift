//
//  MyNotificationVC.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyNotificationVC: UIViewController {
    
    var recMsg:RecNotificationMsg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recMsg = RecNotificationMsg()
        recMsg.addNotificationObserver()
    }
    
    @IBAction func sendNo(_ sender: UIButton) {
        //点击发送通知进行
        var userInfo:Dictionary = Dictionary<String, Any>()
        userInfo["k1"] = "this is a test value"
        userInfo["k2"] = "a new test msg"
        NotificationCenter.default.post(name: NSNotification.Name("testname"), object: self, userInfo: userInfo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
