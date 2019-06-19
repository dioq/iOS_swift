//
//  JudgeNetworkingVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/16.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import Alamofire
import CoreTelephony

class JudgeNetworkingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isConnectiong = MyHttp.shareManager().monitorNetworking()
        print(isConnectiong)
    }

    //获取运营商
    @IBAction func deviceSupplier(_ sender: UIButton) {
        let which = zz_deviceSupplier()
        print(which)
    }
    private func zz_deviceSupplier() -> String {
        let info = CTTelephonyNetworkInfo()
        var supplier:String = ""
        if #available(iOS 12.0, *) {
            if let carriers = info.serviceSubscriberCellularProviders {
                if carriers.keys.count == 0 {
                    return "无手机卡"
                } else { //获取运营商信息
                    for (index, carrier) in carriers.values.enumerated() {
                        print(carrier)
                        guard carrier.carrierName != nil else { return "无手机卡" }
                        //查看运营商信息 通过CTCarrier类
                        if index == 0 {
                            supplier = carrier.carrierName!
                        } else {
                            supplier = supplier + "," + carrier.carrierName!
                        }
                    }
                    return supplier
                }
            } else{
                return "无手机卡"
            }
        } else {
            if let carrier = info.subscriberCellularProvider {
                guard carrier.carrierName != nil else { return "无手机卡" }
                return carrier.carrierName!
            } else{
                return "无手机卡"
            }
        }
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
