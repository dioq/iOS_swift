//
//  ViewVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ViewVC: UIViewController {
    
    let widthV = (ScreenWIDTH - 30) / 2
    let heightV = (ScreenHEIGHT - 40 - 64 - 44) / 3
    let centeyX = ScreenWIDTH / 2 + 5
    
    //懒加载
    lazy var testView:MyView = {
        let myview = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.last as! MyView
        myview.frame = CGRect(x: 10, y:70 + 20 + self.heightV * 2, width: widthV, height: heightV)
        myview.backgroundColor = UIColor.blue
        let model = TestModel.init(imageName: "girl", text: "这是一个自定义的view")
        myview.model = model
        return myview
    }()
    
    //懒加载
    lazy var testView2:MyView = {
        let myview = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.last as! MyView
        myview.frame = CGRect(x: centeyX, y:70 + 20 + self.heightV * 2, width: widthV, height: heightV)
        myview.backgroundColor = UIColor.purple
        let model = TestModel.init(imageName: "girl", text: "这是一个自定义的view")
        myview.model = model
        return myview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "自定义xib view"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "加载视图", style: .plain, target: self, action: #selector(rightAction))
        
        self.setUpView(x:10, y: 70,color: UIColor.red)//直接加载的话,会有形变
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {//在主线程执行
            self.setUpView(x:10, y: 70 + 10 + self.heightV, color: UIColor.orange) //延迟加载, 当self.view视图所有的坐标都加载好后，myview再加载就不会出现形变
        }
        self.view.addSubview(testView)//即使用懒加载,直接加载依然变形
    }

    func setUpView(x:CGFloat, y:CGFloat, color:UIColor?) {
        let myview = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.last as! MyView
        myview.frame = CGRect(x: x, y: y, width: widthV, height: heightV)
        myview.backgroundColor = color!
        let model = TestModel.init(imageName: "girl", text: "这是一个自定义的view")
        myview.model = model
        self.view.addSubview(myview)
    }
    /* 因为控制器的生命周期问题, 与延时加载出来的视图效果一样 */
    @objc func rightAction() {
        self.setUpView(x: centeyX, y: 70, color: UIColor.yellow)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = "自定义xib view"
        self.setUpView(x: centeyX, y: 70 + 10 + heightV, color: UIColor.green)//虽然不会形变,但是会出现多次加载的问题
        self.view.addSubview(testView2)//在view视图出现后，再加载就不会形变，而且懒加载可以避免重复加载(建议用这种方法,添加nib视图)
    }

}
