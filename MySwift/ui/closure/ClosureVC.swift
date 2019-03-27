//
//  ClosureVC.swift
//  Swift_UI
//
//  Created by William on 2018/10/17.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import SnapKit

class ClosureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myview = Bundle.main.loadNibNamed("FilterView", owner: self, options: nil)?.last as! FilterView
        myview.backgroundColor = UIColor.blue
        view.addSubview(myview)
        myview.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.height.equalTo(130)
        }
        
        myview.startTimeValueClousure = {(text:String) -> Void in
            print(text)
        }
        
        myview.endTimeValueClousure = {(text:String) -> Void in
            print(text)
        }
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
