//
//  DefineViewVC.swift
//  MySwift
//
//  Created by Dio Brand on 2022/6/25.
//  Copyright © 2022 Dio. All rights reserved.
//

import UIKit

class DefineViewVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray
        
        /*
         var frame: CGRect
         The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
         var bounds: CGRect
         The bounds rectangle, which describes the view’s location and size in its own coordinate system.
         
         rect 是 rectangle (矩形的简写)
         CGRect  定义一个矩形, 需要 origin(原点) width(宽) height(高)
         
         CGPoint 定义一个点, 需要 x , y
         
         CGSize  定义形状, 需要 width(宽) height(高)
         
         注意: view.center 要在 view.frame 设置之后再设置,要不然坐标计算可以会出错
         */
        print(UIScreen.main.bounds)
        print(self.view.frame)
        print(self.view.frame.origin)
        print(self.view.center)
        
        let view = UIView.init();
        view.backgroundColor = UIColor.red
        view.frame = CGRect.init(x: 10, y: 10, width: 300, height: 80)
        self.view.addSubview(view)
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.green
        view1.frame.origin = CGPoint.init(x: 10, y: 100)
        view1.frame.size = CGSize.init(width: 300, height: 80)
        self.view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.blue
        view2.frame.size = CGSize.init(width: 150, height: 150)
        view2.center = CGPoint.init(x: 187.5, y: 333.5)
        self.view.addSubview(view2)
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.yellow
        view3.frame.size = CGSize.init(width: 100, height: 100)
        view3.center = self.view.center
        self.view.addSubview(view3)
    }
    
}
