//
//  ShowSingletonVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/2.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class ShowSingletonVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singletonOne1 = SingletonOne.shareSingletonOne
        print(getPointer(objc: singletonOne1))
        let singletonOne2 = SingletonOne.shareSingletonOne
        print(getPointer(objc: singletonOne2))
        let singletonOne3 = SingletonOne.shareSingletonOne
        print(getPointer(objc: singletonOne3))
        print("----------------- another ----------------")
        let singletonTwo1 = SingletonTwo.shareSingletonTwo
        print(getPointer(objc: singletonTwo1))
        let singletonTwo2 = SingletonTwo.shareSingletonTwo
        print(getPointer(objc: singletonTwo2))
        let singletonTwo3 = SingletonTwo.shareSingletonTwo
        print(getPointer(objc: singletonTwo3))
        
        
        /*非单例生成的不是同一个对象*/
        let t1 = LazyViewController()
        print(t1)
        let t2 = LazyViewController()
        print(t2)
        let t3 = LazyViewController()
        print(t3)
    }
    
    //打印类内存地址的方法
    func getPointer(objc:AnyObject) -> UnsafeMutableRawPointer {
        // 将Object引用 转化为 unmanaged 对象引用
        let unmanagedObj = Unmanaged.passUnretained(objc)
        // 将 unmanaged class reference 转化 为pointer
        let ptr = unmanagedObj.toOpaque()
        return ptr
    }

}
