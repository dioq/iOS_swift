//
//  UIPasteboardVC.swift
//  swift_UI02
//
//  Created by William on 2018/8/8.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class UIPasteboardVC: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //复制字符串
        UIPasteboard.general.string = "欢迎访问 hangge.com"
        
        //复制字符串数组
        UIPasteboard.general.strings = ["hellow", "hangge.com"]
        
        //复制图片
        let image = UIImage(named: "girl.png")
        UIPasteboard.general.image = image
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
