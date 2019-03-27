//
//  MyPointView.swift
//  Swift_Info
//
//  Created by hello on 2019/1/30.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MyPointView: UIView {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    //初始化nib
    override func awakeFromNib() {
        super.awakeFromNib()
        btn1.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
    }
    
    @objc func actionIsTouch(button:UIButton) {
        print("第\(button.tag)个button响应了")
    }
    
    /*
     1.判断当前控件userInteractionEnabled、hidden、alpha这三个属性的值
     2.调用 pointInside: withEvent: 方法
     3.从后向前遍历子控件，并调用子控件的 hitTest: withEvent: 和 pointInside: withEvent: 方法
     **/
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hitTest point:\t",point)
        /*
         先判断当前控件能否接收事件，如果不能返回空，如果能再判断当前点能否响应事件，如果不能返回空，如果能从后向前遍历子控件，判断当前子控件当前点能否响应事件，如果不能继续判断下一个子控件直到子控件遍历完成（如果所有子控件都不满足条件，那么当前控件就是响应这个事件最合适的控件），如果能那么返回当前子控件的hitTest方法并跳出循环，进入子控件hitTest重复当前操作。
         **/
        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
            return nil
        }

        if self.point(inside: point, with: event) == false {
            return nil
        }

        let count = self.subviews.count - 1
        for i in (0...count).reversed() {
            let view = self.subviews[i]
//            print(type(of: view))
//            print(view.tag)
            let p = view.convert(point, from: self)//将坐标系由self(这个view) 转换到view(这个view上来)
            print("p:\t",p)
            if view.point(inside: p, with: event){//假如转换后的坐标p,在这个视图内
                return view.hitTest(p, with: event)
            }
        }
        
        return self
    }
    
}
