//
//  AnimationVC.swift
//  swift_UI02
//
//  Created by William on 2018/8/3.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class AnimationVC: UIViewController {
    
    var view2:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "动画"
        
        self.view2 = UIView.init(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        self.view2.backgroundColor = UIColor.red
        self.view.addSubview(view2)
        let opts = UIView.AnimationOptions.autoreverse // 执行完动画后,自动逆向执行一次
        
        UIView.animate(withDuration: 5, delay: 5, options: opts, animations: {
            print("file:",#file,"\tfunction:",#function,"\tline:",#line)
            self.view2.frame = CGRect(x: 355, y: 600, width: 20, height: 20)
        }) { (make) in
            print("file:",#file,"\tfunction:",#function,"\tline:",#line)
            print(make)//此处要等动画执行完后才执行
        }
        print("file:",#file,"\tfunction:",#function,"\tline:",#line)
    }
    
}
