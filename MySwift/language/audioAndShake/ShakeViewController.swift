//
//  ShakeViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ShakeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         开启摇动感应
         */
        UIApplication.shared.applicationSupportsShakeToEdit = true
    }

    /**
     开始摇动
     */
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("开始摇动")
    }
    
    /**
     取消摇动
     */
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("取消摇动")
    }
    
    /**
     摇动结束
     */
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("摇动结束")
        ///此处设置摇一摇需要实现的功能
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
