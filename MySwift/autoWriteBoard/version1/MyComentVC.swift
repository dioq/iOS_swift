//
//  MyComentVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/13.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class MyComentVC: UIViewController {

    var maskView = UIView()  // 灰色背景视图,遮罩层
    var writeview:WriteBoardView!
    var writeviewHeight:CGFloat = 50
    var navigationBarHeight:CGFloat = 0
    var startY:CGFloat = 0
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // 灰色背景视图
        maskView.frame = self.view.bounds
        maskView.backgroundColor = UIColor(white: 0.1, alpha: 0.3)
        maskView.isHidden = true
        //给遮罩层加手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideView))
        maskView.addGestureRecognizer(tapGesture)
        self.view.addSubview(maskView)
        
        writeview = Bundle.main.loadNibNamed("WriteBoardView", owner: self, options: nil)?.last as? WriteBoardView
        startY = ScreenHEIGHT - (statusBarHeight + getNavigationBarHeight() + writeviewHeight)
        writeview.frame = CGRect(x: 0, y: startY, width: ScreenWIDTH, height: writeviewHeight)
        let deadline = DispatchTime.now() + 0.2
        DispatchQueue.main.asyncAfter(deadline: deadline) {//延时执行，等待self.view加载完后再加载自定义xib视图
            self.view.addSubview(self.writeview)
        }

        writeview.sendBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        //监控键盘出现
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //监控键盘消失
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // 键盘出现
    @objc func keyBoardWillShow(_ notification: Notification){
        let kbInfo = notification.userInfo
        let kbRect = (kbInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let height = kbRect.size.height  //取到键盘的高
        let duration = kbInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double //取到键盘弹出持续时间
        UIView.animate(withDuration: duration) {
            self.maskView.isHidden = false
            self.writeview.frame.origin.y -= height
        }
    }
    // 键盘隐藏
    @objc func keyBoardWillHide(_ notification: Notification){
        let kbInfo = notification.userInfo
        let duration = kbInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: duration) {
            self.maskView.isHidden = true
            self.writeview.frame.origin.y = self.startY
        }
    }
    
    // 隐藏背景灰色视图
    @objc func hideView() {
        self.writeview.myTextView.resignFirstResponder()
        print(self.writeview.myTextView.text!)
        self.writeview.myTextView.text = ""
    }
    
    @objc func sendMessage() {
        self.writeview.myTextView.resignFirstResponder()
        print(self.writeview.myTextView.text!)
        self.writeview.myTextView.text = ""
    }
    
    deinit {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }

}
