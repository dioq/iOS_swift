//
//  TextFieldViewController.swift
//  Swift_UI
//
//  Created by William on 2018/8/19.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        
        textField1.borderStyle = .none//边框样式
        
//        textField1.clearButtonMode = .whileEditing  //编辑时出现清除按钮
//        textField1.clearButtonMode = .unlessEditing  //编辑时不出现，编辑后才出现清除按钮
        textField1.clearButtonMode = .always  //一直显示清除按钮
        textField2.clearButtonMode = .always
        textField3.clearButtonMode = .always
        
        textField2.isSecureTextEntry = true //输入内容会显示成小黑点
        textField3.isSecureTextEntry = true
        
        //弹出的键盘样式
        textField1.keyboardType = .default
        textField2.keyboardType = .numbersAndPunctuation
        textField3.keyboardType = .numberPad
    }

    //开始编辑
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("开始编辑")
        return true //返回一个BOOL值，指定是否循序文本字段开始编辑
    }
    //开始编辑时触发，文本字段将成为first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text!)
    }
    //结束编辑时调用
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
//        //要想在用户结束编辑时阻止文本字段消失，可以返回false
//        //这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
//        return true
//    }
    //输入框内发生改变时调用
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField4 - 正在编辑, 当前输入框内容为:\(textField.text!) 键盘上被点击的字符为\(string)||")
        print("===============")
        return true
    }
    //点击return键响应的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        print(textField.text!)
        return true;
    }
    
    //点屏幕回收键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //收起键盘
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
    }
    
    
    @IBAction func action01(_ sender: UIButton) {
        print(textField1.text!)
        print(textField2.text!)
        print(textField3.text!)
    }

}
