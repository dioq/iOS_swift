//
//  AutoWriteBoard.swift
//  Swift_Info
//
//  Created by hello on 2019/2/1.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

protocol SendMessageDelegate:NSObjectProtocol {
    func sendMessage(message:String?)
}

class AutoWriteBoard: UIView {
    
    private var myTextView: UITextView! //输入文本框
    private var sendBtn: UIButton! //发送按钮
    private var startY:CGFloat! //记录当前view起始 y坐标
    private var maskview:UIView!  //遮罩层, 灰色背景视图
    private var placeHolderLab:UILabel! //由于textView没有占位字符的功能，所在在上面添加一个label实现类似textField的占位字符功能
    private let maxNum = 20 //限制最多输入字数
    
    weak var delegate:SendMessageDelegate?
    
    init(frame: CGRect, targetView:UIView) {
        super.init(frame: frame)
        setUp(targetView: targetView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(targetView:UIView) {
        let W = self.bounds.width
        let H = self.bounds.height
        myTextView = UITextView.init(frame: CGRect(x: 10, y: 5, width: W - 10 - 80, height: H - 10))
        myTextView.backgroundColor = UIColor.white
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.delegate = self
        self.addSubview(myTextView)
        myTextView.layer.cornerRadius = myTextView.frame.height / 2 //圆角弧度
        myTextView.layer.masksToBounds = true  //是否把圆角边切去
        
        placeHolderLab = UILabel()
        placeHolderLab.text = "请输入评论内容..."
        placeHolderLab.font = UIFont.systemFont(ofSize: 17)
        placeHolderLab.textColor = UIColor.lightGray
        placeHolderLab.backgroundColor = UIColor.clear
        myTextView.addSubview(placeHolderLab)
        placeHolderLab.sizeToFit()
        placeHolderLab.frame.origin.x = myTextView.frame.origin.x
        placeHolderLab.center.y = myTextView.center.y - 5
        
        let sendBtnX = myTextView.frame.origin.x + myTextView.frame.width + 5
        let sendBtnW = W - sendBtnX - 5
        sendBtn = UIButton.init(frame: CGRect(x: sendBtnX, y: 5, width: sendBtnW, height: H - 10))
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.backgroundColor = UIColor.orange
        self.addSubview(sendBtn)
        sendBtn.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        
        
        startY = frame.origin.y//记住当前视图初始化后的y坐标,在以后的动画中复原时会用到
        
        //初始化遮罩层
        maskview = UIView()
        maskview.backgroundColor = UIColor(white: 0.1, alpha: 0.3)
        maskview.frame = targetView.frame
        maskview.isHidden = true
        targetView.addSubview(self.maskview)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideView))
        maskview.addGestureRecognizer(tapGesture)
        
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
            self.maskview.isHidden = false //遮目罩层显示
            self.frame.origin.y = self.startY - height //位置上移到键盘上方
        }
    }
    
    // 键盘隐藏
    @objc func keyBoardWillHide(_ notification: Notification){
        let kbInfo = notification.userInfo
        let duration = kbInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: duration) {
            self.maskview.isHidden = true //遮目罩层隐藏
            self.frame.origin.y = self.startY //位置复原
        }
    }
    
    // 点击遮目罩
    @objc func hideView() {
        self.maskview.isHidden = true //遮目罩层隐藏
        self.myTextView.resignFirstResponder() //回收键盘
    }
    
    //视图消毁时执行
    deinit {
        NotificationCenter.default.removeObserver(self)// 移除观察者中心
        self.maskview.removeFromSuperview()//移除遮罩层
    }
    
    //点击发送按钮
    @objc func sendAction() {
        if delegate != nil {
            self.delegate!.sendMessage(message: myTextView.text)
        }
        myTextView.text = nil
        self.myTextView.resignFirstResponder() //回收键盘
        self.placeHolderLab.isHidden = false
    }
    
}

extension AutoWriteBoard:UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != "" {
            self.placeHolderLab.isHidden = true
        }else{
            self.placeHolderLab.isHidden = false
        }
        
        if textView.text.count >= maxNum {
            let selectRange = textView.markedTextRange
            //获取高亮部分 － 如果有联想词则解包成功
            if let selectRange = selectRange {
                let position =  textView.position(from: (selectRange.start), offset: 0)
                //如果在变化中是高亮部分在变，就不要计算字符了
                if (position != nil) {
                    return
                }
            }

            let content = textView.text
            let textNum = content?.count
            // 截取前maxNum个字符
            if textNum! >= maxNum {
                let index = content?.index((content?.startIndex)!, offsetBy: maxNum)
                if let content = content {
                    let str = String(content[content.startIndex..<index!])
                    textView.text = str
                }
            }
        }
    }
    
}
