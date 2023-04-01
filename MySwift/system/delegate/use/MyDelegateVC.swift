//
//  MyDelegateViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyDelegateVC: UIViewController, DelegateName, TestProtocol {
    
    func testMethod(str: String) {
        print("MyDelegateVC:\(str)")
    }
    
    func mymethod(str:String) {
        print("MyDelegateVC:\(str)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myview:MyDelegateView = MyDelegateView.init(frame: CGRect(x: 100, y: 200, width: 200, height: 150))
        myview.backgroundColor = UIColor.red
        self.view.addSubview(myview)
        myview.delegate = self
        myview.myDelegate = self
    }
    
}
