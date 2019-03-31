//
//  JudgeNetworkingVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/16.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import Alamofire

class JudgeNetworkingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isConnectiong = MyHttp.shareManager().monitorNetworking()
        print(isConnectiong)
    }

    @IBAction func judgeAction(_ sender: UIButton) {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in    // 当网络状态发生改变的时候调用这个closure
            var statusStr: String?
            switch status {
            case .unknown:
                statusStr = "未识别的网络"
            case .notReachable:
                statusStr = "不可用的网络(未连接)"
            case .reachable:
                if (manager?.isReachableOnWWAN)! {
                    statusStr = "2G,3G,4G...的网络"
                } else if (manager?.isReachableOnEthernetOrWiFi)! {
                    statusStr = "wifi的网络";
                }
            }
            print(statusStr!)
            EWToast.showCenterWithText(text: statusStr!, duration: 3)
        }
        let isWork = manager?.startListening()
        print("开启监听是否成功:\(isWork!)")
        let connect =  manager?.isReachable //网络是否通畅
        print("网络是否通畅:",connect!)
        print("the last line! ==== go here!")
    }

}
