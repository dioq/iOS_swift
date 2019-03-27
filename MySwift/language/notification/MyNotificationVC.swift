//
//  MyNotificationVC.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyNotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         创建通知中心
         设置监听方法
         设置通知的名字
         */
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue:"isTest"), object:nil)
    }
    
    //    实现通知监听方法
    @objc func test(nofi : Notification){
        let str = nofi.userInfo!["post"]
        print(str!,"\tthis notifi in MyNotificationVC")
    }
    
    @IBAction func notificationBtn(_ sender: UIButton) {
        let vc = MyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
