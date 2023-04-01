//
//  SendValueViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ReceiveVC: UIViewController,SendDelegateName {

    func mymethod(str: String) {
        print("go ViewController:\(str)")
    }
    
    var vc:SendValueVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton.init(frame: CGRect(x: 30, y: 100, width: 120, height: 80))
        btn.setTitle("按钮", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
        
        vc = SendValueVC()
        vc.delegate = self
    }
    
    @objc func jump(){
//        let vc = SendValueVC()
//        vc.delegate = self
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }

}
