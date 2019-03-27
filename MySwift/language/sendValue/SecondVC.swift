//
//  SecondVC.swift
//  UI_Swift
//
//  Created by William on 2018/7/11.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    var msg:String?
    var backValueClusore:((_ text:String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if msg != nil {
            print("SecondVC\t\t",msg!)
        }
        
        self.view.backgroundColor = UIColor.white
        let newButton:UIButton = UIButton(frame: CGRect(x: 100, y:125, width: 150, height: 80))
        newButton.backgroundColor = UIColor.blue
        newButton.setTitle("回跳传值", for: .normal)
        newButton.addTarget(self, action: #selector(newButtonAction), for: .touchUpInside)
        self.view.addSubview(newButton)
    }
    
    @objc func newButtonAction() {
        let value:String = "闭包回传: 这是一个回传信息"
        self.backValueClusore!(value)
//        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
