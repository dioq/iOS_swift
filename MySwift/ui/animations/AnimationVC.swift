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
        self.title = "动画"
        
        self.view2 = UIView.init(frame: CGRect(x: 250, y: 150, width: 100, height: 100))
        self.view2.backgroundColor = UIColor.red
        self.view.addSubview(view2)
        let opts = UIView.AnimationOptions.autoreverse
        
        UIView.animate(withDuration: 5, delay: 0, options: opts, animations: {
            self.view2.center.x -= 100
        }) { (make) in
            print(make)//此处要等动画执行完后才执行
        }
        print("go here!! =========== 22222222")
    }

}
