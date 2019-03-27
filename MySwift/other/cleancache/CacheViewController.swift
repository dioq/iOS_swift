
//
//  CacheViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/12/12.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CacheViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        // 取出cache文件夹路径
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        // 取出文件夹下所有文件数组
        let files = FileManager.default.subpaths(atPath: cachePath!)
        // 用于统计文件夹内所有文件大小
        var big = Double()
        // 快速枚举取出所有文件名
        for p in files!{
            // 把文件名拼接到路径中
            let path = cachePath!.appendingFormat("/\(p)")
            // 取出文件属性
            if let floder = try? FileManager.default.attributesOfItem(atPath: path){
                // 用元组取出文件大小属性
                for (abc,bcd) in floder {
                    // 只去出文件大小进行拼接
                    if abc == FileAttributeKey.size{
                        big += (bcd as AnyObject).doubleValue
                    }
                }
            }
        }
        // 提示框
        let showValue = Int64(big/(1024*1024))
        showLabel.text = "\(showValue)M缓存"
    }
    
    @IBAction func cleanCache(_ sender: UIButton) {
        // 取出cache文件夹路径
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        // 取出文件夹下所有文件数组
        let files = FileManager.default.subpaths(atPath: cachePath!)
        if let files = files{//假如文件存在
            if files.isEmpty{//存在但为空
                EWToast.showCenterWithText(text: "清除成功", duration: 1.5)
                return
            }
            // 点击确定时开始删除
            for p in files{
                // 拼接路径
                let path = cachePath!.appendingFormat("/\(p)")
                if(FileManager.default.fileExists(atPath: path) && FileManager.default.isDeletableFile(atPath: path)){
                    do {
                        try FileManager.default.removeItem(atPath: path as String)
                        EWToast.showCenterWithText(text: "清除成功", duration: 1.5)
                    } catch {
                        print("removeItemAtPath err"+path)
                    }
                }
            }
        }else{
            EWToast.showCenterWithText(text: "清除成功", duration: 1.5)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
