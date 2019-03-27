//
//  FirstVC.swift
//  UI_Swift
//
//  Created by William on 2018/7/11.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyFirstVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let newButton:UIButton = UIButton(frame: CGRect(x: 100, y:125, width: 150, height: 80))
        newButton.backgroundColor = UIColor.blue
        newButton.setTitle("跳转传值", for: .normal)
        newButton.addTarget(self, action: #selector(newButtonAction), for: .touchUpInside)
        self.view.addSubview(newButton)
    }

    @objc func newButtonAction() {
        let svc = SecondVC()
        svc.msg = "属性传值: this is a value!!!"
        self.navigationController?.pushViewController(svc, animated: true)

        svc.backValueClusore = {(text:String) -> Void in
            print("FirstVC:\t"+text)
        }
        
        print("aaaa")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("go here! ============= ")
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
