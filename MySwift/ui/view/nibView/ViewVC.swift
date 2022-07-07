//
//  ViewVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ViewVC: UIViewController {
    
    let widthV:CGFloat = 180
    let heightV:CGFloat = 250
    let centeyX:CGFloat = ScreenWIDTH / 2 + 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "自定义xib view"
        
        setUpView1()
        setUpView2()
    }
    
    func setUpView1() {
        let myview = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.last as! MyView
        print(#line, "--> myview.frame : ",myview.frame)
        myview.frame = CGRect(x: 10, y: 70, width: widthV, height: heightV)
        myview.backgroundColor = UIColor.red
        let model = TestModel.init(imageName: "girl", text: "这是一个自定义的view")
        myview.model = model
        //        self.view.addSubview(myview)
        print(#line, "--> myview.frame : ",myview.frame)
        //nib 视图在刚加载进来时长宽是在xxx.nib里设置的,需要加载进来后等一会新设置的frame才会生效
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {//在主线程执行
            print(#line, "--> myview.frame : ",myview.frame)
            self.view.addSubview(myview)
            print(#line, "--> myview.frame : ",myview.frame)
        }
    }
    
    func setUpView2() {
        let myview = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.last as! MyView
        print(#line, "--> myview.frame : ",myview.frame)
        myview.frame = CGRect(x:centeyX, y: 70, width: widthV, height: heightV)
        myview.backgroundColor = UIColor.yellow
        let model = TestModel.init(imageName: "girl", text: "这是一个自定义的view")
        myview.model = model
        self.view.addSubview(myview)
        print(#line, "--> myview.frame : ",myview.frame)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {//在主线程执行
//            self.view.addSubview(myview)
            print(#line, "--> myview.frame : ",myview.frame)
        }
        print(#line, "--> myview.frame : ",myview.frame)
    }
    
}
