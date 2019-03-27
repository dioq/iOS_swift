//
//  TargetViewController.swift
//  Drawer
//
//  Created by hello on 2019/3/1.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    
    var btn1:UIButton!
    var btn2:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        btn1 = UIButton.init(type: .custom)
        btn1.setTitle("push", for: .normal)
        btn1.setTitleColor(UIColor.white, for: .normal)
        btn1.frame = CGRect(x: 20, y: 120, width: 70, height: 30)
        btn1.backgroundColor = UIColor.orange
        btn1.addTarget(self, action: #selector(comeAction), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        btn2 = UIButton.init(type: .custom)
        btn2.setTitle("present", for: .normal)
        btn2.setTitleColor(UIColor.white, for: .normal)
        btn2.frame = CGRect(x: 20, y: 250, width: 70, height: 30)
        btn2.backgroundColor = UIColor.orange
        btn2.addTarget(self, action: #selector(comeback), for: .touchUpInside)
        self.view.addSubview(btn2)
    }
    
    @objc func comeAction() {
        let vc = Target2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func comeback() {
        let vc = Target2ViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}
