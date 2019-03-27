//
//  KVOViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/17.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {
    
    /*
     在Swift中有计算属性set{}和get{}和存储属性didSet{}和willSet{}，与OC不同的是，在Swift中get与set方法并不常用，也不会重写getter也setter方法，非要重写的话，可以这样：
     **/
    private  var _name: String?
    var name: String? {
        get {
            // oc  返回 _成员变量
            print("get")
            return _name
        }
        set {
            //使用 _成员变量 记录值
            print("set")
            _name = newValue
        }
    }
    
    /*
     属性观察者：存储属性 didSet{}和willSet{} 差不多是代替OC的Set方法 ，再也不需要考虑 _成员变量 = 值，可以在内设置UI
     属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
     1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
     2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
     3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
     4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
     5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
     6，即使是设置的值和原来值相同，willSet和didSet也会被调用
     **/
    var number: Int? {
        //赋值前执行
        willSet(newNumber) {
            if newNumber != nil {
                print("willSet | NewValue: \(newNumber!)")
            }else{
                print("willSet | NewValue: nil")
            }
        }
        //赋值后执行
        didSet(oldNumber) {
            if oldNumber != nil {
                print("didSet  | OldValue: \(oldNumber!)")
            }else{
                print("didSet  | OldValue: nil")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "property"
        let barButtonItem = UIBarButtonItem.init(title: "改变值", style: .plain, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        /* 调用第1种写法 */
        self.name = "a new value"
        print(self.name!)
        
        self.number = 0
    }
    
    @objc func add() {
        if let tmp = self.number {
            if tmp == 5 {
                self.number = nil
            }else{
                self.number = tmp + 1
            }
        }else{
            self.number = 6
        }
    }

}
