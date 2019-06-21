//
//  MoveViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController {

    var floatBtn:FloatButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myBall = BallView.init(frame: CGRect(x: 10, y: 100, width: 80, height: 80))
        myBall.backgroundColor = UIColor.orange
        configSideRadius(view: myBall)
        view.addSubview(myBall)
        
        
        floatBtn = FloatButton()
        view.addSubview(floatBtn)
        floatBtn.snp.makeConstraints { (maker) in
            maker.right.bottom.equalTo(self.view).offset(-10)
            maker.width.height.equalTo(65)
        }
        floatBtn.backgroundColor = UIColor.white
        floatBtn.setBackgroundImage(UIImage.init(named: "add"), for: .normal)
        floatBtn.delegate = self
    }
    
    //设置圆角
    func configSideRadius(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.blue.cgColor
    }
}

extension MoveViewController:ClickDelegate {
    
    func clickMethod(value: String) {
        print(value)
    }
    
}
