//
//  Nib1ViewController.swift
//  MySwift
//
//  Created by Geek on 2020/1/2.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class Nib1ViewController: UIViewController {
    
    @IBOutlet weak var bottomH: NSLayoutConstraint!
    var isClick = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "xib使用技巧"
        let rightBarButtonItem = UIBarButtonItem(title: "Click", style: .plain, target: self, action: #selector(onClickPop))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func onClickPop() {
        isClick = !isClick
        if isClick {
            bottomH.constant = 200
        }else{
            bottomH.constant = 0
        }
    }
    
}
