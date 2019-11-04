//
//  MyClosureVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/19.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class MyClosureVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        study01()
//        study2()
//        study3()
//        study4()
//        study5()
//        study6()
        study7()
    }
    
    //closure回调
    func study7() {
        let url:String = "https://codeload.github.com/AFNetworking/AFNetworking/zip/master"
        let para:Dictionary<String, Any> = ["age":18]
        
        let handler:(_ receiveData:Data?, _ error:Error?) -> Void
        handler = {(receiveData:Data?, error:Error?) in
            if error != nil {
                print("下载失败:\(error!)")
            }
            if receiveData != nil {
                print("下载成功:\(receiveData!)")
            }
        }
        
        let downloadManager = DownloadManager()
        downloadManager.downloadWithURL(url: url, parameters: para, handler: handler)
    }
    
    //@escaping @noescaping
    func study6() {
        /*
         闭包只有在函数中做参数时才会区分逃逸闭包和非逃逸闭包。
         Swift 3.0之后，传递闭包到函数中的时候，系统会默认为非逃逸闭包类型（NonescapingClosures)@noescaping，逃逸闭包在闭包前要添加@escaping关键字。
         从生命周期看两者区别：
         非逃逸闭包的生命周期与函数相同：
         1，把闭包作为参数传给函数；
         2，函数中调用闭包；
         3，退出函数。结束
         
         逃逸闭包的生命周期：
         1，闭包作为参数传递给函数；
         2，退出函数；
         3，闭包被调用，闭包生命周期结束
         即逃逸闭包的生命周期长于函数，函数退出的时候，逃逸闭包的引用仍被其他对象持有，不会在函数结束时释放
         
         经常使用逃逸闭包的2个场景：
         异步调用: 如果需要调度队列中异步调用闭包，比如网络请求成功的回调和失败的回调，这个队列会持有闭包的引用，至于什么时候调用闭包，或闭包什么时候运行结束都是不确定，上边的例子。
         存储: 需要存储闭包作为属性，全局变量或其他类型做稍后使用
         **/
        
        var closure1:(String) -> Void
        closure1 = {(data:String) in
            print(data)
        }
        loadData(callBack: closure1)
        
        loadOtherData(callBack: closure1)
    }
    //非逃逸闭包
    func loadData(callBack:(String) -> Void) {
        print("-- 非逃逸闭包 -- 1")
        callBack("*** 非逃逸闭包 ***")
        print("-- 非逃逸闭包 -- 2")
    }
    //逃逸闭包
    func loadOtherData(callBack: @escaping (String) -> Void) {
        /*
         如果此时去掉 @escaping 会报错, 这因为当程序 执行完[==6]处时,最外面的loadOtherData函数的生命周期就结束了,而在loadOtherData函数内部还开了另一条线程来运行函数callBack,callBack还在运行,因此callBack的生命土周期还不能结束,这就需要callBack的生命周期不能小于loadOtherData
        **/
        print("== 逃逸闭包 == 1")
        DispatchQueue.global().async {
            print("== 逃逸闭包 == 2")
            sleep(2)
            DispatchQueue.main.async {
                sleep(3)
                print("== 逃逸闭包 == 3")
                callBack("**** 逃逸闭包 ***")
                print("== 逃逸闭包 == 4")
            }
            print("== 逃逸闭包 == 5")
        }
        print("== 逃逸闭包 == 6")
    }
    
    //闭包是同步的
    func study5() {
        //闭包其实是一个匿名函数,具有其他函数的一切特性,执行时也是同步的
        let testClosure : () -> Void
        testClosure = {
            sleep(5)
            print("在closure在执行")
        }
        testClosure()
        print("在外面")
    }
    
    //闭包基础
    func study01() {
        //闭包是无名的，因为他们能够从上下文中捕获变量、常量，从而应用在自身的作用区域。
        
        //声明
        var myClosure: () -> Void
        //注意 () -> Void 实际上是一个无名函数，作为闭包变量的类型。
        //无返回值的闭包
        myClosure = {
            print("Hello world")
        }
        //执行闭包
        myClosure() // Hello world
        
        
        //尝试一个带参的闭包
        var mySecondClosure: (Int , Int ) -> Int
        mySecondClosure = {(a: Int , b: Int) -> Int in
            return a * b
        }
        let result = mySecondClosure(3,5)
        print(result)
        
        
        //第一次简化 类型自动推导 可以根据参数推断
        mySecondClosure = {(a, b) in
            return a * b
        }
        
        //第二次简化 如果函数体只包含一句 return 代码，可省略 return
        mySecondClosure = {(a, b) in
            a * b
        }
        
        /*
         第三次简化
         被捕获的参数列表中，含有a、b，下标从0开始，可通过"$"获取。
         
         编译器亦可通过，捕获列表自行推断出参数。
         故可省略参数列表 （a, b）和 关键字 in
         */
        mySecondClosure = {
            $0 * $1
        }
        
        let result2 = mySecondClosure(2,9)
        print(result2)
    }
    
    //闭包作为函数参数
    func study2() {
        //实现一个闭包
        var multipyClosure:(Int, Int) -> Int = {
            $0 * $1
        }
        
        //等同于
        multipyClosure = {(a: Int, b: Int) in
            a * b
        }
        
        //下面，我们将闭包作为参数传递
        let result = myOperation(4, 3, operation:multipyClosure)
        print(result)
        
        //展开 inline
        let result2 = myOperation(4, 2, operation: {(a: Int, b: Int) -> Int in
            return a * b
        })
        print(result2)
        
        /*
         事实上，我们并没有必要在本地定义一个闭包常量或变量，再作为参数传递。
         可以简单的在调用的地方进行声明并简化
         */
        let result3 = myOperation(4, 2, operation:{
            $0 * $1
        })
        print(result3)
        
        //进一步简化，* 操作符是一个有两个参数并返回一个结果的函数。可做如下简化:
        let result4 = myOperation(4, 2, operation: *)
        print(result4)
        
        /*
         如果闭包是作为函数的最后一个参数，可以将闭包后置到函数体外部。
         */
        let result5 = myOperation(4, 2) {
            $0 * $1
        }
        print(result5)
    }
    /*
     operation: 是一个闭包类型的参数
     该闭包有两个参数（Int, Int） ,并有一个Int型返回值
     要整体看待，不要蒙圈。
     */
    func myOperation(_ a: Int , _ b: Int, operation: @escaping(Int , Int) -> Int) -> Int {
        let res = operation(a, b)
        return res
    }
    
    
    //捕获
    func study3() {
        //闭包可以从上下文环境中捕获常量、变量，并在自己的作用域内使用。
        
        //eg.: 1
        var counter = 0
        let incrementCounter = {
            counter += 1
        }
        
        /*
         由于闭包定义和变量counter在同一作用域中，
         故闭包可以捕获并访问变量counter。
         对变量counter做的任何改变，对闭包来说都是透明可见的。
         */
        incrementCounter() //1
        print(counter)
        incrementCounter() //2
        print(counter)
        
        /*
         该例子中，闭包捕获了封闭空间（函数实体内）的内部变量counter。
         */
        let counter1 = countingClosure()
        let counter2 = countingClosure()
        
        let res1 = counter1() // 1
        print(res1)
        let res2 =  counter2() // 1
        print(res2)
        let res3 =  counter1() // 2
        print(res3)
        let res4 =  counter1() // 3
        print(res4)
        let res5 =  counter2() // 2
        print(res5)
    }
    func countingClosure() -> () -> Int {
        var counter = 0
        let incrementCounter: () -> Int = {
            counter += 1
            return counter
        }
        return incrementCounter
    }
    
    
    //函数式
    func study4() {
        /* 排序 */
        /*
         数组提供了一个排序函数，sorted().使用的是默认规则，当然我们也可以定制排序规则。
         */
        let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
        let res = names.sorted()
        print(res)
        // ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]
        
        //更改排序规则 其实就是利用了函数重载，具体可看函数定义
        //sorted(by: <#T##(String, String) throws -> Bool#>)
        let res2 = names.sorted {
            $0.count > $1.count
        }
        print(res2)
        // ["ZZZZZZ", "EEEEE", "CCCC", "BB", "A"]

        
        /* 遍历 */
        /*
         循环遍历集合中的元素，相当于for-in 快速遍历
         */
        let values = [5, 3, 2, 3,1]
        values.forEach {
            print("element is \($0)")
        }
        
        /*
         函数原型:
         func filter(_ isIncluded: (Element) -> Bool) -> [Element]
         
         按照规则过滤原数组
         */
        let values01 = [1.5, 10, 4.88, 3.2, 8]
        let res01 = values01.filter {
            return $0 > 4
        }
        print(res01)
        //res是移除掉小于或等于4的元素的新数组
        
        /*
         函数原型：
         students.map(<#T##transform: (String) throws -> T##(String) throws -> T#>)
         
         数组映射
         */
        let input = ["0", "12", "name", "hi", "3"]
        let number = input.map {
            Int($0) //将元素转换为Int型
        }
        print(number)
        //注意类型转换可能失败，所以返回的是可选型
        //[Optional(0), Optional(12), nil, nil, Optional(3)]
        
        /*
         另外一个高度近似的函数
         flatMap
         隐含了两种操作
         1.解包
         2.展开并合并
         */
        let flatNumber = input.compactMap() {
            Int($0)
        }
        print(flatNumber)
        //[0, 12, 3]
        
        
        /*
         函数原型
         reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, String) throws -> Result##(Result, String) throws -> Result#>)
         
         */
        //数组
        let flatNumber03 = [0, 12, 3]
        let sum = flatNumber03.reduce(0) {
            return $0 + $1
        }
        print(sum)
        //15
        
        //字典
        let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
        let stockSum = stock.reduce(0) {
            return $0 + $1.key * Double($1.value)
        }
        print(stockSum)
        //384.5
        
        /*
         另一个reduce重载函数
         注意inout 关键字，所以想想你可以怎么应用？
         */
//        input.reduce(into: <#T##Result#>) { (<#inout Result#>, <#String#>) in
//            <#code#>
//        }
    }

}
