//
//  MyFontViewController.swift
//  MySwift
//
//  Created by hello on 2019/9/6.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class MyFontViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加字体图片 .tff
        //Info.plist里要设置    Fonts provided by application
        
        /*
         系统字体有81种,如果自己添加N种新字体, 总共就会有81+N种字体
         **/
        for i in 0..<UIFont.familyNames.count {
            let fontfamilyname:String = UIFont.familyNames[i]
            print("fontfamilyname:\(fontfamilyname)")
            for fontName in UIFont.fontNames(forFamilyName: fontfamilyname) {
                print("font:\(fontName)")
            }
            print("----------------- \(i) done ------------------")
        }
        self.myLabel.font = UIFont.init(name: "huxiaobo-meixin", size: 17)
    }
    
}
