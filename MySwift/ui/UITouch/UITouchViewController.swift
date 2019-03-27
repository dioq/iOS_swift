//
//  UITouchViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class UITouchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //支持多点触摸
        self.view.isMultipleTouchEnabled = true
    }
    
    /*
     通知调用者当有一个或者多个手指触摸到了视图或者窗口时触发此方法。
     touches是UITouch的集合，通过UITouch我们可以检测触摸事件的属性，是单拍还是双拍，还有触摸的位置等。
     **/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            if(t.tapCount == 2){//当在屏幕上连续拍动两下时，背景恢复为白色
                self.view.backgroundColor = UIColor.white
            }else if(t.tapCount == 1){//当在屏幕上单击时，屏幕变为红色
                self.view.backgroundColor = UIColor.red
            }
            print("touchesBegan event begin!")
//            t.gestureRecognizers
        }
    }
    
    /*
     告诉接收者一个或者多个手指在视图或者窗口上触发移动事件。
     默认不允许多点触摸。如果要接收多点触摸事件必须将UIView的属性设置为true。
     **/
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print(t.location(in: self.view))
        }
    }
    
    /* 当一个触摸事件结束时发出的UITouch实例对象。 */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //两点触摸(轻点一下,不用滑动)时，计算两点间的距离，以及角度
        if touches.count == 2{
            //获取触摸点
            let first = (touches as NSSet).allObjects[0] as! UITouch
            let second = (touches as NSSet).allObjects[1] as! UITouch
            //获取触摸点坐标
            let firstPoint = first.location(in: self.view)
            let secondPoint = second.location(in: self.view)
            //计算两点间的距离
            let deltaX = secondPoint.x - firstPoint.x
            let deltaY = secondPoint.y - firstPoint.y
            let initialDistance = sqrt(deltaX*deltaX + deltaY*deltaY)
            print("两点间距离：\(initialDistance)")
            //计算两点间的角度
            let height = secondPoint.y - firstPoint.y
            let width = firstPoint.x - secondPoint.x
            let rads = atan(height/width);
            let degrees = 180.0 * Double(rads) / .pi
            print("两点间角度：\(degrees)")
        }
        print("touchesEnded event end!")
    }
    
    /* 通知接收者当系统发出取消事件的时候（如低内存消耗的告警框）*/
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled event canceled!")
    }
    
}
