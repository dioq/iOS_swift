//
//  ButtonViewController.swift
//  UI_Swift
//
//  Created by William on 2018/7/9.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "button"
        let rightBarButtonItem = UIBarButtonItem(title: "英雄联盟▼", style: .plain, target: self, action: #selector(onClickPop(sender:)))
        rightBarButtonItem.tintColor = UIColor.darkGray//设颜色
        rightBarButtonItem .setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)], for: .normal) //设字体
        self.navigationItem.rightBarButtonItem = rightBarButtonItem


        let button1 = UIButton(frame: CGRect(x: 100, y: 85, width: 250, height: 70))
        button1.center.x = self.view.center.x
        button1.backgroundColor = UIColor.yellow
        button1.setTitle("点击传值", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button1.addTarget(self, action: #selector(buttonTap1(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button1)


        let button2 = UIButton(frame: CGRect(x: 100, y: 160, width: 250, height: 70))
        button2.center.x = self.view.center.x
        button2.backgroundColor = UIColor.green
        button2.setTitle("点击前", for: .normal)
        button2.setTitle("点击后", for: .selected)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.setTitleColor(UIColor.red, for: .selected)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button2.addTarget(self, action: #selector(action2(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button2)
    }
    
    @objc func action2(button:UIButton) {
        button.isSelected = !button.isSelected
    }

    @objc func buttonTap1(button:UIButton) {
        if button.backgroundColor == UIColor.yellow{
            button.backgroundColor = UIColor.blue
        }else if button.backgroundColor == UIColor.blue{
            button.backgroundColor = UIColor.yellow
        }
    }
    
    @IBAction func action01(_ sender: UIButton) {
        if  sender.backgroundColor != UIColor.red {
            sender.backgroundColor = UIColor.red
        }else {
            sender.backgroundColor = UIColor.green
        }
    }
    
    @objc func onClickPop(sender: UIBarButtonItem) {
        let myView = sender.value(forKey: "_view") as? UIView
        if myView != nil {
            print(myView!.frame)
        }
        print("点击了右上角按钮")
    }
    
    
    @IBAction func thread(_ sender: UIButton) {
        let currentThread = Thread.current
        print("当前线程为:\(currentThread)\t\tname:\(currentThread.name!)")
        sleep(15)
        print("the last line! ==== go here!")
    }
    
}
