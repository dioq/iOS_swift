//
//  RecNotificationMsg.swift
//  MySwift
//
//  Created by Dio Brand on 2023/2/28.
//  Copyright © 2023 Dio. All rights reserved.
//

import UIKit

class RecNotificationMsg: NSObject {

    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveMsg), name: NSNotification.Name(rawValue:"testname"), object:nil)
    }
    
    //    实现通知监听方法
    @objc func receiveMsg(noti : Notification){
        if let userInfo:Dictionary = noti.userInfo {
            if let v1 = userInfo["k1"] as? String {
                print("k1:",v1)
            }
        }
    }
    
    deinit {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }
}
