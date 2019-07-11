//
//  DrawerViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/15.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {
    
    var targetVC:TargetViewController!
    var bgView:UIView!
    var btn1:UIButton!
    var btn2:UIButton!
    
    let offset:CGFloat = 150.0
    var h:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "抽屈效果"
        h = self.view.frame.height
        
        targetVC = TargetViewController()
        self.view.addSubview(self.targetVC.view)
        self.addChild(targetVC)
        
        bgView = UIView.init(frame: self.view.frame)
        bgView.backgroundColor = UIColor.green
        self.view.addSubview(bgView)
        
        btn1 = UIButton.init(type: .custom)
        btn1.setTitle("滑出", for: .normal)
        btn1.setTitleColor(UIColor.white, for: .normal)
        btn1.frame = CGRect(x: 100, y: 120, width: 70, height: 30)
        btn1.backgroundColor = UIColor.blue
        btn1.addTarget(self, action: #selector(comeAction), for: .touchUpInside)
        bgView.addSubview(btn1)
        
        btn2 = UIButton.init(type: .custom)
        btn2.setTitle("复原", for: .normal)
        btn2.setTitleColor(UIColor.white, for: .normal)
        btn2.frame = CGRect(x: 100, y: 250, width: 70, height: 30)
        btn2.backgroundColor = UIColor.blue
        btn2.addTarget(self, action: #selector(comeback), for: .touchUpInside)
        bgView.addSubview(btn2)
        
        /*
         隐藏tabBar,从子controller里push也要在父controller里 操作
         **/
        self.hidesBottomBarWhenPushed = true
    }
    
    @objc func comeAction() {
        UIView.animate(withDuration: 0.5) {
            self.bgView.frame.origin.x = self.offset
            self.targetVC.view.frame = CGRect(x: 0, y: 0, width: self.offset, height: self.h)
        }
    }
    
    @objc func comeback() {
        UIView.animate(withDuration: 0.5) {
            self.bgView.frame.origin.x = 0
            self.targetVC.view.frame = CGRect(x: -self.offset, y: 0, width: self.offset, height: self.h)
        }
    }
    
}
