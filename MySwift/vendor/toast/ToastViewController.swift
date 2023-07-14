//
//  ToastViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/5.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class ToastViewController: UIViewController {
    
    let topButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 150, width: UIScreen.main.bounds.width - 200, height: 70))
        button.backgroundColor = UIColor.gray
        button.tag = 0
        button.setTitle("上方显示", for: .normal)
        button.addTarget(self, action: #selector(showToast(sender:)), for: .touchUpInside)
        return button
    }()
    let centerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: UIScreen.main.bounds.width - 200, height: 70))
        button.backgroundColor = UIColor.gray
        button.setTitle("中间显示", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(showToast(sender:)), for: .touchUpInside)
        return button
    }()
    let bottomButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 450, width: UIScreen.main.bounds.width - 200, height: 70))
        button.backgroundColor = UIColor.gray
        button.tag = 2
        button.setTitle("下方显示", for: .normal)
        button.addTarget(self, action: #selector(showToast(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(topButton)
        self.view.addSubview(centerButton)
        self.view.addSubview(bottomButton)
    }
    
    @objc func showToast(sender: UIButton){
        switch sender.tag {
        case 0:
            EWToast.showTopWithText(text: "上方显示,持续默认时间2秒")
        case 1:
            EWToast.showCenterWithText(text: "中间显示,持续自定义时间3秒", duration: 3)
        case 2:
            EWToast.showBottomWithText(text: "下方显示,位置自定义距离屏幕底边150", bottomOffset: 150)
        default:
            break
        }
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
