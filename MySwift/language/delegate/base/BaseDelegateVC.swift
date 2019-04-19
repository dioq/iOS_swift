//
//  BaseDelegateVC.swift
//  MySwift
//
//  Created by hello on 2019/4/16.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class BaseDelegateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        study1()
    }
    
    func study1() {
        let m = Man()
        m.testMethod(str: "William")
    }
    
}
