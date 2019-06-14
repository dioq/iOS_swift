//
//  ReflectViewController.swift
//  MySwift
//
//  Created by hello on 2019/5/24.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class ReflectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    样例1：输出实体对象的类名，属性个数，以及所有属性的属性名和属性值。
    @IBAction func one(_ sender: UIButton) {
        //创建一个User实例对象
        let user1 = User()
        user1.name = "hangge"
        user1.age = 100
        user1.emails = ["hangge@hangge.com","system@hangge.com"]
        
        //将user对象进行反射
        let hMirror = Mirror(reflecting: user1)
        
        print("对象类型：\(hMirror.subjectType)")
        print("对象子元素个数：\(hMirror.children.count)")
        
        print("--- 对象子元素的属性名和属性值分别如下 ---")
        for case let (label?, value) in hMirror.children {
            print("属性：\(label)     值：\(value)")
        }
    }
    
    
    //根据属性名字符串获取属性值
    func getValueByKey(obj:AnyObject, key: String) -> Any {
        let hMirror = Mirror(reflecting: obj)
        for case let (label?, value) in hMirror.children {
            if label == key {
                return unwrap(any: value)
            }
        }
        return NSNull()
    }
    //将可选类型（Optional）拆包
    func unwrap(any:Any) -> Any {
        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .optional {
            return any
        }
        if mi.children.count == 0 { return any }
        let (_, some) = mi.children.first!
        return some
    }
    //样例2：通过属性名（字符串）获取对应的属性值，并对值做类型判断（包括是否为空）
    /*
     首先为方便使用，这里定义两个方法。getValueByKey()是用来根据传入的属性名字符串来获取对象中对应的属性值。
     unwrap()是用来给可选类型拆包的（对于非可选类型则返回原值）
     **/
    @IBAction func two(_ sender: UIButton) {
        //创建一个User实例对象
        let user1 = User()
        user1.name = "hangge"
        user1.age = 100
        user1.emails = ["hangge@hangge.com","system@hangge.com"]
        
        //通过属性名字符串获取对应的值
        let name = getValueByKey(obj: user1, key: "name")
        let nickname = getValueByKey(obj: user1, key: "nickname")
        let age = getValueByKey(obj: user1, key: "age")
        let emails = getValueByKey(obj: user1, key: "emails")
        let tel = getValueByKey(obj: user1, key: "tel")
        print(name, nickname, age, emails, tel)
        
        //当然对于获取到的值也可以进行类型判断
//        if name is NSNull {
//            print("name这个属性不存在")
//        }else if name == nil {
//            print("name这个属性是个可选类型，且为nil")
//        }else if name is String {
//            print("name这个属性String类型，其值为：\(name)")
//        }
//        
//        if nickname is NSNull {
//            print("nickname这个属性不存在")
//        }else if (nickname as AnyObject) == nil {
//            print("nickname这个属性是个可选类型，且为nil")
//        }else if nickname is String {
//            print("nickname这个属性String类型，其值为：\(nickname)")
//        }
//        
//        if tel is NSNull {
//            print("tel这个属性不存在")
//        }else if (tel as? AnyObject) == nil {
//            print("tel这个属性是个可选类型，且为nil")
//        }else if tel is String {
//            print("tel这个属性String类型，其值为：\(tel)")
//        }
    }
    
}

//用户类
class User {
    var name:String = ""  //姓名
    var nickname:String?  //昵称
    var age:Int?   //年龄
    var emails:[String]?  //邮件地址
}
