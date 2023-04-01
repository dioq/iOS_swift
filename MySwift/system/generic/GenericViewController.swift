//
//  GenericViewController.swift
//  MySwift
//
//  Created by hello on 2019/9/21.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "泛型"
        //        study1()
        study2()
//        study3()
    }
    
    func study3() {
        var stackOfStrings = Stack<String>()
        stackOfStrings.push(item: "A")
        stackOfStrings.push(item: "B")
        stackOfStrings.push(item: "C")
        stackOfStrings.push(item: "D")
        
        let fromTheTop = stackOfStrings.pop()
        print("fromTheTop的值是\(fromTheTop)")
        
        if let topItem = stackOfStrings.topItem{
            print("栈顶的元素是\(topItem)")
        }
    }
    
    func study2() {
        let a:Int = 100
        let b:String = "test"
        testManyPara(a, b)
    }
    
    func study1() {
        var numb1 = 100
        var numb2 = 200
        
        print("交换前数据:  \(numb1) 和 \(numb2)")
        swapTwoValues(&numb1, &numb2)
        print("交换后数据: \(numb1) 和 \(numb2)")
        
        var str1 = "A"
        var str2 = "B"
        
        print("交换前数据:  \(str1) 和 \(str2)")
        swapTwoValues(&str1, &str2)
        print("交换后数据: \(str1) 和 \(str2)")
    }
    
    // 定义一个交换两个变量的函数
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func testManyPara<T, E>(_ a:T, _ b:E) {
        print("a的类型是:\(type(of: a))")
        print("b的类型是:\(type(of: b))")
    }
}

// 扩展泛型栈
extension Stack{
    var topItem:Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
