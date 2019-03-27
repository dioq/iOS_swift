//
//  UISwitchVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/3.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class UISwitchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UISwitch"
        //UISwitch的大小是确定的不能进行修改 51*31
        let switchOne = UISwitch(frame:CGRect(x:100.0, y:100.0, width:0.0,height: 0.0))
        self.view.addSubview(switchOne)
        switchOne.backgroundColor = UIColor .yellow
        
        //设置打开状态背景颜色
        switchOne.onTintColor = UIColor.brown
        
        //设置关闭状态的背景颜色
        switchOne.tintColor = UIColor.orange
        
        //开关的颜色
        switchOne.thumbTintColor = UIColor.red
        
        //设置开关状态
        switchOne.setOn(true, animated: true)
        
        //添加按钮事件
        switchOne.addTarget(self, action: #selector(test(sender:)), for: UIControl.Event.valueChanged)
    }

    //状态改变之后的执行方法
    @objc func test(sender:UISwitch) {
        print("开关状态 value= ",sender.isOn)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
