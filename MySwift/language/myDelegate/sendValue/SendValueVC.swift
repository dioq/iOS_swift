//
//  FirstVC.swift
//  SwiftDemo
//
//  Created by William on 2018/7/11.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

protocol SendDelegateName:NSObjectProtocol {
    //设置协议方法
    func mymethod(str:String)
}

class SendValueVC: UIViewController {
    //指定协议对象
    weak var delegate:SendDelegateName?
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.addTarget(self, action:#selector(myaction), for: .touchUpInside)
    }
    
    @objc func myaction(){
        print("go myaction!!!1")
        //执行协议
        delegate?.mymethod(str: "sendValue")
//        self.navigationController?.popViewController(animated: true)
    }

}
