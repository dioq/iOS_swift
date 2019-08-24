//
//  AlertViewController.swift
//  swift_UI02
//
//  Created by William on 2018/8/10.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "hello!", message: "good luck", preferredStyle: UIAlertController.Style.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func myTip(_ sender: UIButton) {
        let alertController = UIAlertController(title:"提示哦",message:"我是提示信息",preferredStyle: .alert)
        let canceAction = UIAlertAction(title:"取消",style:.cancel,handler:nil)
        let okAciton = UIAlertAction(title:"确定",style:.default,handler: {action in
            print("他点击了确定")
        })
        alertController.addAction(canceAction)
        alertController.addAction(okAciton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func action03(_ sender: UIButton) {
        let alertController = UIAlertController(title:"提示哦",message:"我是提示信息",preferredStyle: .actionSheet)
        /*当在iPad上运行上面这段代码的时候，如果没有设置如下两个属性*/
        alertController.popoverPresentationController?.sourceView = self.view
        alertController.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: 0, width: 1.0, height: 1.0)
        /*会导致程序crash。然而在iPhone上没有这样的问题。*/
        let cancelAction = UIAlertAction(title:"取消",style:.cancel,handler:nil);
        let okAciton = UIAlertAction(title:"确定",style:.default,handler: {
            action in
            print("他点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAciton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func action02(_ sender: UIButton) {

    }
    
    @IBAction func action3(_ sender: UIButton) {

    }
    
}
