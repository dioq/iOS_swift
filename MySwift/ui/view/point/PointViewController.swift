//
//  PointViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/30.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class PointViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "点击监控"
//        test()
        test1()
    }
    
    func test1() {
        let pointView1 = Bundle.main.loadNibNamed("MyPointView1", owner: self, options: nil)?.last as! MyPointView1
        pointView1.frame = CGRect(x: 10, y: 40, width: ScreenWIDTH - 20, height: ScreenHEIGHT - 200)
        let deadline = DispatchTime.now() + 0.2
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.view.addSubview(pointView1)
        }
    
        //单击手势
        let oneTap = UITapGestureRecognizer(target: self, action: #selector(clickOneTap(sender:)))
        oneTap.numberOfTapsRequired = 1
        pointView1.isUserInteractionEnabled = true
        pointView1.addGestureRecognizer(oneTap)
    }
    
    func test() {
        let pointView = Bundle.main.loadNibNamed("MyPointView", owner: self, options: nil)?.last as! MyPointView
        pointView.frame = CGRect(x: 10, y: 40, width: ScreenWIDTH - 20, height: ScreenHEIGHT - 200)
        let deadline = DispatchTime.now() + 0.2
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.view.addSubview(pointView)
        }
    }
    
    //实现手势方法  单击手势
    @objc func clickOneTap(sender: UITapGestureRecognizer) {
        print("单击手势")
    }
}
