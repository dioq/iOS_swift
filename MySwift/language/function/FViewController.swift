//
//  FViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/11.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class FViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "函数的特性"
        //        test01(9, secondParameterName: 8)
        //        test1()
        //        test2()
        //        test3()
        test4()
    }
    
    func test4() {
        print("test4 is starting")
        wasteTime()//调用方法都是同步的
        print("test4 is finished")
    }
    func wasteTime() {
        sleep(5)
        print("wasteTime is finished")
    }
    
    func test3() {
        /* override 方法的调用 */
        let ob = SonObject.init()
        let result = ob.testFunc(param1: 2, param2: 3)
        print("override\t\tresult:", result)
    }
    
    /* overload 方法的调用 */
    func test2() {
        let res1 = plusFun(param1: 1, param2: 2)
        let res2 = plusFun(param1: 1, param2: 2, param3: 3)
        print("overload\t\tres1:", res1, "res2:", res2)
    }
    
    //引用传递及参数设默认值
    func test1() {
        var a = 1
        increment(num: &a)
        print(a)
    }
    
    //inout让值类型以引用方式传递
    func increment(num: inout Int, length: Int = 10){
        num += length
    }
    
    func plusFun(param1:Int, param2:Int) -> Int {
        return param1 + param2
    }
    /* 上下两个方法是重载overload */
    func plusFun(param1:Int, param2:Int, param3:Int) -> Int {
        return param1 + param2 + param3
    }
    
    //“_”是代表函数调用时，可以忽略参数名称
    func test01(_ firstParameterName: Int, secondParameterName: Int) {
        // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
}
