//
//  DeviceViewController.swift
//  Swift_stu
//
//  Created by William on 2018/9/2.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDeviceInfo()
    }

    
    //获取设备信息
    func getDeviceInfo() {
        //应用程序信息
        let infoDictionary = Bundle.main.infoDictionary!
        let appDisplayName = infoDictionary["CFBundleDisplayName"] //app的名字
        let bundleID = infoDictionary["CFBundleIdentifier"]//bundle identifier
        let majorVersion = infoDictionary["CFBundleShortVersionString"]//主程序版本号
        let minorVersion = infoDictionary["CFBundleVersion"]//版本号（内部标示）
        let appVersion = majorVersion as! String
        
        //设备信息
        let iosVersion = UIDevice.current.systemVersion //iOS版本
        let identifierNumber = UIDevice.current.identifierForVendor //设备udid
        let systemName = UIDevice.current.systemName //设备名称
        let model = UIDevice.current.model //设备型号
        let modelName = UIDevice.current.modelName //设备具体型号
        let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
        
        //打印信息
        if appDisplayName != nil {
            print("Display Name：\(appDisplayName!)")
        }
        if bundleID != nil {
            print("Bundle Identifier: \(bundleID!)")
        }
        print("Version：\(appVersion)")
        if minorVersion != nil {
            print("Build：\(minorVersion!)")
        }
        print("iOS版本：\(iosVersion)")
        if identifierNumber != nil {
            print("设备udid：\(identifierNumber!)")
        }
        print("设备名称：\(systemName)")
        print("设备型号：\(model)")
        print("设备具体型号：\(modelName)")
        print("设备区域化型号：\(localizedModel)")
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
