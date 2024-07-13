//
//  GestureVC.swift
//  Swift_UI
//
//  Created by William on 2018/8/24.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class GestureVC: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var cureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///对一些没有交互的view 开启交互 后才能添加手势
        cureImage.isUserInteractionEnabled = true
        cureImage.tag = 101 //给视图加tag
        addGertrue()
    }
    
    //添加手势
    func addGertrue() {
        //0.单击手势
        let oneTap = UITapGestureRecognizer(target: self, action: #selector(clickOneTap(sender:)))
        //代理
        oneTap.delegate = self
        oneTap.numberOfTapsRequired = 1
        cureImage.addGestureRecognizer(oneTap)
        
        //1.双击手势
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(clickDoubleTap(sender:)))
        doubleTap.numberOfTapsRequired = 2
        cureImage.addGestureRecognizer(doubleTap);
        
        //2.拖动手势
        //        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(sender:)))
        //        cureImage.addGestureRecognizer(panGestureRecognizer)//这个手势 与 上下左右划的手势 之间有冲突
        //3.旋转手势
        let RotationGesture = UIRotationGestureRecognizer (target: self, action: #selector(rotationGestureClick(sender:)))
        cureImage.addGestureRecognizer(RotationGesture);
        //4.捏合手势
        let pinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(pinchGestureClick(sender:)) )
        cureImage.addGestureRecognizer(pinchGesture)
        
        //划动手势
        //上划
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        swipeUpGesture.direction = UISwipeGestureRecognizer.Direction.up //不设置是右
        cureImage.addGestureRecognizer(swipeUpGesture)
        //下划
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        swipeDownGesture.direction = UISwipeGestureRecognizer.Direction.down //不设置是右
        cureImage.addGestureRecognizer(swipeDownGesture)
        //左划
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left //不设置是右
        cureImage.addGestureRecognizer(swipeLeftGesture)
        //右划
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(sender:)))
        cureImage.addGestureRecognizer(swipeGesture)
        
        //长按手势
        let longpressGesutre = UILongPressGestureRecognizer(target: self, action: #selector(handleLongpressGesture(gestureRecognizer:)))
        //代理
        //        longpressGesutre.delegate = self
        //长按时间为1秒
        longpressGesutre.minimumPressDuration = 1
        //允许15秒运动
        longpressGesutre.allowableMovement = 15
        //所需触摸1次
        longpressGesutre.numberOfTouchesRequired = 1
        cureImage.addGestureRecognizer(longpressGesutre)
    }
    
    //实现手势方法  单击手势
    @objc func clickOneTap(sender: UITapGestureRecognizer) {
        let tag = sender.self.view?.tag
        print("tag: \(tag!)")
        print("单击手势")
    }
    
    //实现手势方法  双击手势
    @objc func clickDoubleTap(sender: UITapGestureRecognizer) {
        print("双击手势")
    }
    
    //移动手势
    @objc func panGestureRecognizer(sender:UIPanGestureRecognizer) {
        print("移动手势")
    }
    
    //旋转手势
    @objc func rotationGestureClick(sender: UIRotationGestureRecognizer) {
        print("旋转手势")
    }
    
    //捏合手势
    @objc func pinchGestureClick(sender: UIPinchGestureRecognizer) {
        print("捏合手势")
    }
    //划动手势
    @objc func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch (direction){
        case UISwipeGestureRecognizer.Direction.left:
            print("Left")
            break
        case UISwipeGestureRecognizer.Direction.right:
            print("Right")
            break
        case UISwipeGestureRecognizer.Direction.up:
            print("Up")
            break
        case UISwipeGestureRecognizer.Direction.down:
            print("Down")
            break
        default:
            break;
        }
    }
    
    //长按手势
    @objc func handleLongpressGesture(gestureRecognizer:UILongPressGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            print("长按开始\tUIGestureRecognizer.State.began")
        }else if gestureRecognizer.state == UIGestureRecognizer.State.changed {
            print("长按改变\tUIGestureRecognizer.State.changed")
        }else if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            print("长按结束\tUIGestureRecognizer.State.ended")
        }
    }
    
    
    /** 以下是UIGestureRecognizerDelegate的代理方法 **/
    //开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，用处：可以在控件指定的位置使用手势识别
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizerShouldBegin")
        return true
    }
    
    //是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
    //是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizer \t shouldRecognizeSimultaneouslyWith")
        return true
    }
    
    //手指触摸屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
    //此方法在window对象在有触摸事件发生时，调用gesture recognizer的touchesBegan:withEvent:方法之前调用，如果返回NO,则gesture recognizer不会看到此触摸事件。(默认情况下为YES)
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("gestureRecognizer \t touch")
        let curp = touch.location(in: cureImage)
        print(curp)//获取手势触发的位置
        if curp.x <= (cureImage.bounds.size.width / 2) {//点击左半边
            return false
        }
        return true
    }
    
    // 这个方法返回YES，第一个和第二个互斥时，第二个会失效
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizer \t shouldBeRequiredToFailBy")
        return true
    }
    // 这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizer \t shouldRequireFailureOf")
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
