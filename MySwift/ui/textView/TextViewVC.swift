//
//  TextViewVC.swift
//  Swift_UI
//
//  Created by William on 2018/8/23.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class TextViewVC: UIViewController, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textview = UITextView(frame:CGRect(x: 30, y: 80, width: 250, height: 100))
        textview.layer.borderWidth = 0.4
        textview.layer.cornerRadius = 4
        textview.layer.borderColor = UIColor.red.cgColor
        textview.layer.masksToBounds = true
        textview.becomeFirstResponder()
        self.view.addSubview(textview)
        
        setUp(textview:textview)
    }
    
    func setUp(textview:UITextView) {
//        2.1 是否可以被编辑,返回false,就是readOnly
        textview.isEditable = true
//        2.2 显示文本
        textview.text = "Hello Swift and Object-C"
//        2.3 当文本是电话或者是一个网址,那么高亮显示,点击并跳转或者拨打电话
//        PhoneNumber : 电话号码链接 Link : 网址的链接 All : 电话号码+网址链接 None : 都不创建链接
        textview.dataDetectorTypes = .all
//        2.4 光标和选择范围
        print(textview.selectedRange)
//        2.5 对选定文字进行加粗、下划线等操作
        textview.allowsEditingTextAttributes = true
//        2.6 避免用户对选定一定范围内文本进行copy
//        指定光标一定到指定位置,如果设置selectable为false的话,文字不能被选择,防止用户copy
        textview.scrollRangeToVisible(NSMakeRange(0, 10))
        textview.isSelectable = true
//        2.7 常用的一些代理方法
        textview.delegate = self
        //返回键的类型
        textview.returnKeyType = UIReturnKeyType.done
    }
    
//    //        2.8 编辑开始被调用,返回false,编辑不会被开始
//    private func textViewShouldBeginEditing(textView: UITextView) -> Bool { return true }
//    //        2.9 编辑结束前调用,返回false,编辑不会结束,光标一直存在
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool { return true }
//    //        2.10 改变文本前被调用,向range中设置变化范围,text中设置变化后的字符串,返回false,变化将不会反应
//    func textVie_W(textView: UITextViewshouldChangeTextInge, range: NSRange, replacementText text: String) -> Bool { print(textView.text); return true }
//    //        2.11 编辑开始后被调用,获取焦点被调用
//    func textViewDidBeginEditing(_ textView: UITextView) { print(textView.text) }
//    //        2.12 编辑结束后调用
//    func textViewDidEndEditing(textView: UITextView) { print(textView.text) }
//    //        2.13 文本变更时被调用(结果是每输入一个字符时都会被调用)
//    func textViewDidChange(textView: UITextView) { print(textView.text) }
//    //        2.14 游标移动,选择范围发生变化时被调用
//    func textViewDidChangeSelection(textView: UITextView) { print(textView.text) }
    //        注意: UITextview并没有像UITextField控件有textFieldShouldReturn监听点击return回车键,因为在多行文本控件中,点击return键被意味着是正常的换行行为。因为,我们需要在界面中自己增加一个完成按钮,点击按钮后调用UITextview的resgisterFirstResponde方法,从而收起键盘。
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //文本视图内容改变时，触发本方法,如果是回车符号，则textView释放第一响应值，返回false
        if (text ==  "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
