//
//  MyGestureVC.swift
//  Swift_Info
//
//  Created by hello on 2018/11/14.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class MyGestureVC: UIViewController {
    
    lazy var gesturesView: GestureBlockView = {
        let itemWidth: CGFloat = ScreenWIDTH - 80
        let gesturesV = GestureBlockView.init(frame: CGRect(x: 40, y: ScreenHEIGHT / 2 - itemWidth / 2, width: itemWidth, height: itemWidth))
        gesturesV.backgroundColor = UIColor.green
        return gesturesV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "手势密码"
        view.backgroundColor = UIColor.yellow
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "重置", style: .plain, target: self, action: #selector(btnClick))
        
        view.addSubview(gesturesView)
        gesturesView.sendGestureClousure = {(numbers:Array<String>) -> Void in
            print(numbers)
        }
    }
    
    @objc func btnClick() {
        gesturesView.reset()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        hidesBottomBarWhenPushed = true
    }
    
}
