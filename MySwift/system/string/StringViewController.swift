//
//  StringViewController.swift
//  Swift_stu
//
//  Created by William on 2018/9/14.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class StringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func action01(_ sender: UIButton) {
        let hander = "去设置"
        let res = hander.suffix(2)
        print(type(of: res))
        let result =  "手机号" + res
        print(result)
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
