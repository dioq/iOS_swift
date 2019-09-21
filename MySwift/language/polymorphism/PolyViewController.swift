//
//  PolyViewController.swift
//  MySwift
//
//  Created by hello on 2019/9/21.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class PolyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "多态"
        
        let animal1:Animal = Cat()  // 用子类构造函数定义一个父类Animal类型的常量，这和oc不一样
        let animal2:Animal = Dog()  // 用子类构造函数定义一个父类Animal类型的常量，这和oc不一样
        // animal1和animal2都是父类类型，引用了子类的对象
        print(animal1)      // 打印   Swift_封装_多态和嵌套类型.Cat
        print(animal2)      // 打印   Swift_封装_多态和嵌套类型.Dog
        
        animal1.shout()     // 打印   猫在喵喵叫
        animal2.shout()     // 打印   狗在汪汪叫
    }
    
}
